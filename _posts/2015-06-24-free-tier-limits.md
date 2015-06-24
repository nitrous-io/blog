---
layout: post
title: Nitrous Pro Free Tier Time Limit Removed
description: "The free tier time limit has been removed"
category: announcements
utm: utm_source=nitrous.io&utm_medium=blog&utm_campaign=notimelimit
---

FIXME I want to have screenshots of the time limit UI in here with red Xes
drawn on top as the highlight image -- any thoughts?

It's been two months since we [launched Nitrous
Pro](http://blog.nitrous.io/2015/04/22/introducing-nitrous-pro.html) and we
have been very excited about the response so far.  Feedback has been very
positive, from both existing users of Nitrous Lite and newcomers to the Nitrous
experience.

However, not all user comments have been smileys and unicorns.  In particular,
many have voiced their dissatisfaction with the hourly limit on the new free
tier.  We pay a lot of attention to user feedback, and it has been clear that
the new policy needs changing.

Today, we are happy to announce the upcoming removal of the time limit on the
free tier.

### What's changed

There will no longer be a daily time limit applied to free tier users.  Your
workspace will remain on as long as you are using the IDE.

Simply put, if you close the browser tab with the IDE open, your
workspace will be shut down shortly after.

### Questions and Answers

#### __When will this go live?__

We will be rolling this out to all free users by Jun 27, 2015.  Once you no
longer see the hourly limit ticking down in your IDE menu -- it means your
workspace is on the new system!

#### __What happens when my workspace shuts down?__

Shutting down is similar to powering off a machine: daemons will stop running,
and any existing GNU Screen or tmux sessions will be gone.

Preview URLs will no longer be available since web servers will no longer be
running.

#### __What happens if I lose my internet connection?__

Unfortunately since this means we cannot detect if you are using the IDE, your
workspace will shut down after the grace period.  This grace period was chosen
to be sufficient to handle temporary network outages and things like router
resets.

#### __Does this mean I can leave the IDE on permanently and the workspace won't shut down?__

We hope users won't try to find ways to bypass the new system.  Users
attempting to keep workspaces on while unattended will be are encouraged to
consider our [paid subscriptions](https://pro.nitrous.io/pricing).
