---
layout: post
title: OpenSSL (Heartbleed) Security Update
author: arun
utm: utm_source=nitrous.io&utm_medium=blog&utm_campaign=heartbleed
category: announcements
---

On April 7th (Monday), we learned about a new vulnerability [(CVE-2014-0160)](https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-0160)  aka 
[Heartbleed](http://heartbleed.com) related to OpenSSL, a cryptography library that is 
used for encrypting a large majority of the traffic across the Internet.


An audit of Nitrous.IO's web servers showed that were running the latest version of OpenSSL and thus
vulnerable.  We patched OpenSSL on all our systems by 1AM PST on
Tuesday and confirmed that we were no longer vulnerable to attacks. We also
re-keyed and re-issued our SSL certificates for all our web services.  After
monitoring our servers until 4PM PST on Tuesday, we marked [the incident as
resolved](http://status.nitrous.io/incidents/8r7lzpp0xfw6).

We brought the service into maintenance mode on Monday while we were
assessing the situation and patching our systems. 
We apologize to any users affected by this unscheduled downtime.

## Next Steps

It is highly unlikely that our systems were targeted before
we deployed the patched OpenSSL libraries. However, we recommend taking some
additional precautionary measures:
**[changing your Nitrous.IO account
password](https://www.nitrous.io/app#/account_settings)**.

If you are a Chrome user, we also recommend that you check the "Check for server certificate
revocation" option under the "HTTPS/SSL" section in your Chrome browser settings.

**Please Note:** This vulnerability did not affect SSH access so there is
ro reason for you to remove your SSH keys from your boxes.

## Security at Nitrous.IO

We take the security of our systems and the data that you entrust with us very
seriously. We are continuing to monitor the situation and will update
our [status page](http://status.nitrous.io) and our
[Twitter status account](https://twitter.com/n2ostatus) if there are additional updates.

If you have more questions, please email us at
[support@nitrous.io](mailto:support@nitrous.io).
