---
layout: post
title: OpenSSL (Heartbleed) Security Update
author: arun
utm: utm_source=nitrous.io&utm_medium=blog&utm_campaign=heartbleed
category: announcements
---

On Monday, the OpenSSL project released an update to address the
[Heartbleed](http://heartbleed.com) vulnerability. This is a serious
issue that let a perpretator see 64K chunks of memory on the server.
There are reports that over a 100,000 web servers on the Internet were
found to be vulnerable.

Given the version of OpenSSL that we were using on our servers,
Nitrous.IO's web servers were also vulnerable. We patched OpenSSL on all
boxes and all our servers by 1AM PST on Tuesday and confirmed that we
were no longer vulnerable to attacks. We also re-key and re-issued our
SSL certificates for all our web services and after monitoring our
servers until 4PM PST on Tuesday, we marked [the incident as
resolved](http://status.nitrous.io/incidents/8r7lzpp0xfw6).

## Next Steps

Even though it is highly unlikely that our systems were attacked before
we deployed the the patched OpenSSL libraries, we recommend taking some
precautionary measures to make sure protect yourself, including
*changing your Nitrous.IO account password*.

If you are a Chrome user, we also recommend that you check the "Check for server certificate
revocation" option under "HTTPS/SSL" in your Chrome browser settings. 

*Please Note:* This vulnerability did not affect SSH access so there is
no reason for you to remove your SSH keys from your boxes.

## Security at Nitrous.IO

We take the security of our systems and data that you have entrusted
with us very seriously. We are continuing to monitor the situation and
will keep updating our [status page](http://status.nitrous.io) as well
as our [Twitter](https://twitter.com/n2ostatus) as and when we have more
information.

If you have more questions, please email us at
[support@nitrous.io](support@nitrous.io).
