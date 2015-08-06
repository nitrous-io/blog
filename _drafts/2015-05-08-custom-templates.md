---
layout: post
title: "Use Keywords that you want to be ranked for in the Title - SEO"
author: tim
utm: utm_source=nitrous.io&utm_medium=blog&utm_campaign=custom_templates
category: tutorials
description: Creating a Docker image that integrates with the Nitrous Pro IDE
---

One of the benefits of using Docker as the technology powering Nitrous Pro
containers is support for the industry-standard Dockerfile.
In this post we will showcase how to take advantage of this exciting new
feature to easily create reproducible containers on Nitrous.


<!--break-->

There are two ways to integrate your custom setup with Nitrous:

1. Use the Nitrous base image in a new Dockerfile
2. Take an existing Docker image and customize it for better integration with Nitrous

This blog post will cover the first approach.  A subsequent post will explore
the second.

We will be creating a custom template for the [Khan Academy
exercises](https://github.com/khan/khan-exercises) repo.

### What you will need

It will be easiest if you follow along interactively.  To do so, you will need
the following:

1. An internet connection
1. A working Docker install (>= 1.5.0)
1. A scratch directory for the Dockerfile and any additional files needed (e.g. `/tmp/nitrous-custom`)

If you are already a paying Pro user, you can skip the Docker install step by
following this tutorial within Nitrous! Just [enable advanced
mode](https://community.nitrous.io/docs/advanced-options?utm_source=nitrous.io&utm_medium=blog&utm_campaign=custom_templates`)
and create a new container with the `Docker` template.

### The base image

```Dockerfile
FROM quay.io/nitrous/ubuntu
```

In your scratch directory, create a file named `Dockerfile` with the above.
Run `docker build .` from within the directory.  This will take a while to
download.

**Note**: you may need to precede all docker commands with `sudo` depending on
how `docker` is set up on your system.

The `ubuntu` image sets up a user called `nitrous` and sets up multiple
conveniences for it, including passwordless sudo, ability to SSH and injection
of docker ENV variables.

### Installing software dependencies

Note: the `quay.io/nitrous/ubuntu` image already comes with `git` -- the
example below is just to demonstrate how to install apt-based dependencies.

```Dockerfile
RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -yy --no-install-recommends git && \
  apt-get clean
```

Note the structure of the above.  You will always want to sandwich your
`apt-get install` calls with `apt-get update` and `apt-get clean`.  The former
makes sure you have the latest packages, and the latter clears the local
repository so that your image takes up less disk space.

The `apt-get install` command invocation above has more bells and whistles than
you may be accustomed to:

- the `DEBIAN_FRONTEND=noninteractive` environment variable setting will
  silence any warnings from `apt` not being run interactively
- the `-yy` option automatically answers 'Yes' to prompts
- the `no-install-recommends` option ensures only what we explicitly specify is installed; this saves disk space


### Testing the image

Let's create a container from the image we have built and test the image.  In
the sessions below, lines with a `$ <cmd>` prefix indicate that you should run
`<command>`, while lines without those prefixes are the expected output.

```shell
$ docker build .
# ... elided ...
Successfully built abcde # this is the Image ID
$ docker run -d <Image ID>  # replace <Image ID> with the value from above
f123456 # this is the container ID
```

You now have a running container.  Next, run:

```shell
$ docker exec -it f123456 bash
root@f123456:#/ su --preserve-environment -c 'HOME=/home/nitrous bash' nitrous
nitrous@f123456:/$ git --version
git version 1.9.1
```

Let's breakdown the sequence here.

#### docker exec

The first command runs bash in the container.  The `-i` and `-t` options give
us an interactive session and a pseudo-TTY respectively.  This allows us to
interact with the shell.

#### su

We want to test the container from the user's perspective, so we switch to the
`nitrous` user.  The `--preserve-environment` option will keep the environment
variables set by Docker `ENV` instructions, but also overrides `HOME`, so we
set `HOME` explicitly.

#### git

In this instance we are testing that `git` has been installed and is
available to users.

Now that we've tested the install, we can exit the container and remove it.

```shell
nitrous@f123456:/$ exit # bash shell with nitrous user (su -c bash)
root@f123456:#/ exit # bash shell with root user (docker exec)
$ docker stop f123456
$ docker rm f123456
```

This was a very simple demonstration, but you now know how to test your
container from the Nitrous user's perspective.

### Switching users

Sometimes in your Dockerfile you will have a sequence of commands resulting in
files that you want to change permissions on.  Instead of adding `RUN chmod
...` instructions, you can simply switch users.


```Dockerfile
USER $NITROUS_USERNAME
```

This is currently equivalent to `USER nitrous`.  Reusing the `NITROUS_USERNAME`
envvar makes your Dockerfile more resistant to change.

**Note**: if you switch user, you *must* add `USER root` later on in the
Dockerfile, otherwise the image will not run.

```Dockerfile
RUN \
  cd /home/$NITROUS_USERNAME/code && \
  git clone https://github.com/khan/khan-exercises/
```

### Exposing a port

By default the Python `SimpleHTTPServer` that the `khan-exercises` repo uses
listens on port 8000.  We need to make that port available.

Typically this would simply be:

```Dockerfile
EXPOSE 8000
```

However, we are going to do a little more.

The Nitrous `preview port` has special meaning -- it means that port 80 will
also be forwarded to that port.  This is useful for avoiding issues with
firewalls that block other ports.  We declare it using a predefined environment
variable.

```Dockerfile
ENV NITROUS_PREVIEW_PORT 8000
EXPOSE $NITROUS_PREVIEW_PORT
```

This will make port 8000 available in the 'Preview' menu of the Nitrous IDE.

### Adding a README

```Dockerfile
ENV NITROUS_README_URL https://nitrous-readmes.s3.amazonaws.com/khan.2015-08-06.html
```

Containers can have an optional README that is opened the first time a
container loads, and is thereafter accessible from the Help menu.

To add a README, simply upload a static html file to a public location, e.g.
`Amazon S3`, and add the `NITROUS_README_URL` environment variable pointing to it.

The location must be accessible via HTTPS.

### Finishing up

Remember to add a `USER root` at the end.

The final Dockerfile:

```Dockerfile
FROM quay.io/nitrous/ubuntu

RUN \
  apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yy --no-install-recommends git && \
    apt-get clean

USER $NITROUS_USERNAME
RUN \
  cd /home/$NITROUS_USERNAME/code && \
  git clone https://github.com/khan/khan-exercises/

ENV NITROUS_PREVIEW_PORT 8000
EXPOSE $NITROUS_PREVIEW_PORT

USER root
```

Once a container is built from that image, all the user has to do is run:

```shell
cd ~/code/khan-exercises
python -m SimpleHTTPServer
```

And then click `Preview > Port 8000` in the IDE menu in order to access the exercises.


### Summary

We have covered the basic integration points:

- using `FROM quay.io/nitrous/ubuntu` to create a Nitrous-compatible image
- switching to `USER $NITROUS_USERNAME` when running commands to ensure users
  have non-root access to files created
- using `ENV NITROUS_PREVIEW_PORT 8000` and `EXPOSE $NITROUS_PREVIEW_PORT` to
  allow users to preview a web server
- using `ENV NITROUS_README_URL` to add a custom README to containers when opening in IDE

We look forward to seeing the images our users build on top of Nitrous!
