---
layout: post
title: OpenSSL (Heartbleed) Security Update
author: arun
utm: utm_source=nitrous.io&utm_medium=blog&utm_campaign=heartbleed
category: announcements
---

On April 7 (Mon), the OpenSSL project released an update to address the
[Heartbleed](http://heartbleed.com) vulnerability. This is a serious issue that
lets a perpretator see 64KB chunks of memory on the server.  [According to
Netcraft](http://news.netcraft.com/archives/2014/04/08/half-a-million-widely-trusted-websites-vulnerable-to-heartbleed-bug.html),
around half a million web servers on the Internet were found to be vulnerable.

Nitrous.IO's web servers were running the latest version of OpenSSL and thus
vulnerable.  We patched OpenSSL on all boxes and all our servers by 1AM PST on
Tuesday and confirmed that we were no longer vulnerable to attacks. We also
re-keyed and re-issued our SSL certificates for all our web services.  After
monitoring our servers until 4PM PST on Tuesday, we marked [the incident as
resolved](http://status.nitrous.io/incidents/8r7lzpp0xfw6).

There was a downtime period on Nitrous.IO on Monday when we spent time
assessing the situation and patching our systems.  Our team believes that
uptime while vulnerable is worse than no uptime at all, and acted accordingly.
We apologize to any users affected by this unscheduled downtime.

## Next Steps

Even though it is highly unlikely that our systems were attacked before
we deployed the patched OpenSSL libraries, we recommend taking some
precautionary measures to make sure you protect yourself, including
*changing your Nitrous.IO account password*.

If you are a Chrome user, we also recommend that you check the "Check for server certificate
revocation" option under the "HTTPS/SSL" section in your Chrome browser settings.

*Please Note:* This vulnerability did not affect SSH access so there is
ro reason for you to remove your SSH keys from your boxes.

## Security at Nitrous.IO

We take the security of our systems and the data that you entrust with us very
seriously. We are continuing to monitor the situation and will update
our [status page](http://status.nitrous.io) and our
[Twitter status account](https://twitter.com/n2ostatus) as and when we have more information.

If you have more questions, please email us at
[support@nitrous.io](mailto:support@nitrous.io).
