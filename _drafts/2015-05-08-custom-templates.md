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

We will be creating a custom template for the [Flask](http://flask.pocoo.org/docs/0.10/) web development framework for Python, and set up the [Flaskr](https://github.com/mitsuhiko/flask/tree/master/examples/flaskr/) example app.

### What you will need

It will be easiest if you follow along interactively.  To do so, you will need
the following:

1. An internet connection
1. A working Docker install (>= 1.5.0)
1. A scratch directory for the Dockerfile and any additional files needed (e.g. `/tmp/nitrous-test`)

If you are already a paying Pro user, you can skip the Docker install step by
following this tutorial within Nitrous! Just [enable advanced
mode](http://docs.nitrous.io/v1.0/docs/advanced-container-management-options?utm_source=nitrous.io&utm_medium=blog&utm_campaign=custom_templates`)
and create a new container with the `Docker` template.

### The base image

```Dockerfile
FROM quay.io/nitrous/ubuntu-bare
```

In your scratch directory, create a file named `Dockerfile` with the above.
Run `docker build .` from within the directory.  This will take a while to
download.

**Note**: you may need to precede all docker commands with `sudo` depending on
how `docker` is set up on your system.

The `ubuntu-bare` image sets up a user called `nitrous` and sets up multiple
conveniences for it, including passwordless sudo, ability to SSH and injection
of docker ENV variables.

### Installing software dependencies

```Dockerfile
RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -yy --no-install-recommends build-essential sqlite3 git && \
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
nitrous@f123456:/$ sqlite3 --version
3.8.2 2013-12-06 14:53:30 27392118af4c38c5203a04b8013e1afdb1cebd0d
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

#### sqlite3

In this instance we are testing that `sqlite3` has been installed and is
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
  cd /tmp && \
  git clone https://github.com/mitsuhiko/flask/ && \
  mv flask/examples/flaskr ~/

```
