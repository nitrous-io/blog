---
layout: post
title: Introducing SSL Previews & Autoparts in the UI
author: sandeep
utm: utm_source=nitrous.io&utm_medium=blog&utm_campaign=introautopartspreviewssl
---
It's been a busy post holiday season for the Nitrous.IO team. We are excited to introduce two features that our customers have been requesting - **SSL Support for Live Preview** and **One Click Autoparts installation**.

![SSL Preview & Autoparts UI](/images/launch/introparts.png)

Both these features are available in your existing Nitrous.IO workspaces today so [log on and check them out](http://nitrous.io/users/sign_in/?{{page.utm}}) or keep reading to see how they work.

<!--break-->

###SSL Support for Live Preview (Port 3000)

Live Preview allows you to quickly showcase your development build on a live URL. This popular feature is now available over SSL- allowing you to connect over HTTPS and showcase your app to clients and customers directly from your development machine.

![SSL Preview Menu](/images/launch/sslpreviewlink.png)

Simply launch your app on port 3000 and navigate to it using the **Port 3000 (SSL)** Link from the **Preview Menu**.


###One Click Autoparts Installation

[*Autoparts*, the powerful open-source package manager,](http://help.nitrous.io/autoparts/?{{page.utm}}) is now available from within the web IDE.

![Autoparts UI](/images/launch/autopartsUI.png)

You can `install`, `uninstall`, `start` and `stop` **databases** (e.g. Postgresql, MySQL), **datastores** (e.g. memcached, Redis) **new languages** (e.g. Rust, Pascal) and other tools from [your Nitrous.IO IDE.](https://www.nitrous.io/join?{{page.utm}})

![Autoparts Packages](/images/launch/autopartslist.png)

Don't see your favorite package? [Send us a pull request.](http://help.nitrous.io/autoparts-packages/)
