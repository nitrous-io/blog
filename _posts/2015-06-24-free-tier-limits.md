---
layout: post
title: Nitrous Pro Free Tier Time Limit Removed
description: "The free tier time limit has been removed"
category: announcements
utm: utm_source=nitrous.io&utm_medium=blog&utm_campaign=notimelimit
---

FIXME I want to have screenshots of the time limit UI in here with red Xes drawn on top as the highlight image -- any thoughts?

It's been two months since we [launched Nitrous Pro](http://blog.nitrous.io/2015/04/22/introducing-nitrous-pro.html) and we have been very excited about the response so far. Feedback has been very positive, from both existing users of Nitrous Lite and newcomers to the Nitrous experience.

Unfortunately, not all user comments have been all rainbows and unicorns...

The two hour limit was something that many people found really frustrating, and we really want to fix that. That's why we are so happy to announce that, starting today, **there is no time limit on the free tier!**

### What's changed?

There will no longer be a daily time limit applied to free tier users! Instead, when you first log in for the day you'll see a slight delay (usually 30-60 seconds) before your workspace becomes available. Once it's finished starting up, however, it's business as usual!

If you don't use your workspace for a while we'll shut it down again, but when you come back everything should be (mostly) as you left it.

### Questions and Answers

#### __When will this go live?__

We will be rolling this out to all free users by June 27, 2015.  Once you no longer see the hourly limit ticking down in your IDE menu &mdash; it means your workspace is on the new system!

#### __What happens when my workspace shuts down?__

When your workspace shuts down it will stop all running processes. Everything you've saved to disk will stay exactly as is, but any programs that were running (including GNU screen and tmux) will be stopped.

This also means that Preview URLs will no longer be available since the web server will no longer be running.

#### __What happens if I lose my internet connection?__

It depends on how long your connection is down. The amount of time we wait before shutting down an unused workspace is variable, but you can generally assume that if you're back within 10-15 minutes the workspace will still be running. If it's longer than that, you might need to wait for it to be started back up.
