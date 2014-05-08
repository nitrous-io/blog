---
layout: post
title: "Customizing Box Start with nitrousboxrc"
author: tim
utm: utm_source=nitrous.io&utm_medium=blog&utm_campaign=customizing_box_start
category: announcements
---

If you have custom scripts or programs that you want to run every time a box is
started, the `.nitrousboxrc` file is the right place to add them.

Services installed with `parts` are already set up to run on box
start, so you wouldn't have to do anything extra to get them running.

The up-to-date instructions for using `.nitrousboxrc` will always be found in
the `.nitrousboxrc.sample` file in your home directory.  To view it in the IDE,
click the `Show Hidden` button.

### Getting Started

The steps are pretty straightforward.  In your terminal, run

    cp ~/.nitrousboxrc.sample ~/.nitrousboxrc
    chmod +x ~/.nitrousboxrc

*Note: the .nitrousboxrc.sample and .nitrousboxrc files have a period/dot as their first character.*

You can then edit the `.nitrousboxrc` file by adding your commands after the
comment `# Add your commands here`.

Here are some common examples that you can use today:

<!--break-->

### Example 1: keeping repositories up to date

Let's say you are using [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
and have it checked out in `$HOME/oh-my-zsh`.

Edit the relevant section of your `.nitrousboxrc` file so that it looks like below:

    # The line below is recommended so that any errors will stop the script.
    set -e
    cd ~/oh-my-zsh && git pull --rebase origin master

Remember to make the `.nitrousboxrc` file executable from your shell with:

`chmod +x ~/.nitrousboxrc`

Now whenever your box is started, the repository will be updated.

You can verify your changes by restarting your box and viewing the `.nitrousboxrc.log` file.  You should see something similar to below:

    2014-05-05 03:44:49 : Starting /home/action/.nitrousboxrc
    From https://github.com/robbyrussell/oh-my-zsh
     * branch            master     -> FETCH_HEAD
    Current branch master is up to date.
    2014-05-05 03:44:54 : Finished /home/action/.nitrousboxrc

### Example 2: making some files publicly accessible

First, create a directory for files you want to serve publicly: `mkdir ~/public`

**Note: It is highly recommended that you create a subdirectory for sharing
instead of serving your home directory, as the latter will make your box's
private keys publicly accessible**

Edit the relevant section of your `.nitrousboxrc` file so that it looks like
below:

    # The line below is recommended so that any errors will stop the script.
    set -e
    cd ~/public && python -m SimpleHTTPServer 8080 &

Note the `ampersand (&)` at the end of the command to make it run in the
background.  This is necessary so that subsequent commands (if present) will
run.

Remember to make the `.nitrousboxrc` file executable from your shell with:

    chmod +x ~/.nitrousboxrc

Now restart your box, and choose `Port 8080` from the preview menu.  It will
display the contents of your `$HOME/public` folder, which can be downloaded by
anyone who goes to that page.

### Housekeeping

The output of `.nitrousboxrc` can be viewed in `.nitrousboxrc.log`.  Over time
this file can grow and take up a significant amount of disk space.  To clear
the file's contents, simply run the following in the terminal:

    > ~/.nitrousboxrc.log


### Q & A

#### Q: How is this different from my bashrc/zshrc file?

The bashrc file is run with every new console started, not just on box start.
You will have to add checks to commands you only want to run once per box start
into your shell rc file.

#### Q: How is this different from @reboot in crontab?

`Nitrousboxrc` and the `@reboot` nickname in crontab are functionally the same
in that both will accomplish the goal of running commands on box start.  The
nitrousboxrc file simplifies the process so you only have one file to edit, and
logging is already taken care of for you.

If you have more advanced requirements and wish to use the `@reboot` nickname
in crontab, you can find out more on the [crontab man
page](http://linux.die.net/man/5/crontab).

