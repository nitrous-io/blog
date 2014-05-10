---
layout: post
title: "Use Keywords that you want to be ranked for in the Title - SEO"
author: yourname
utm: utm_source=nitrous.io&utm_medium=blog&utm_campaign=unique_identifier
category: tutorials, announcements, interviews, partnerships  <-- Pick One
highlight_image: http://placehold.it/200x200.png
description: Descriptive text about your post for the description meta tag.
---

Blurb introducing the topic with some tie in to Nitrous.IO.
Eg: Here is a story about winning a hackathon because of Nitrous.IO's Collaboration Efforts.
Eg: I wanted to learn Clojure b/c it's awesome and it's one of the many languages supproted by Nitrous.IO

![Nice Image for the Main Page](http://placehold.it/640x200.png)

More Text Here to hook the reader

<!--break-->

## Details..

Have at least one call to action to sign up for Nitrous.IO. Preferably two with one of them being the end of the article.


A few simple ideas to help keep the blog posts consistent and ensure that we use the blog posts 
to both drive traffic with an effective means to measure it.


### Blog posts should be informative and educational to our audience:
* Large audience of experienced SW development professionals
* Growing audience of people learning how to code

### Use 'description' and 'highlight_image' variables in the Front Matter

These variables are used to tell Google, Twitter and Faceboook about the article and improve the ability for Search Engines to find us.  

Keep the description under 200 words and the image to be 200x200.

####Example:
```
---
layout: post
title: TITLE
author: aj
category: announcements
description: THIS IS A TEST DESCRIPTION
highlight_image: /images/awesome.gif
---
```

###utm tags are you friends. Please use them and encourage partners to use them if you cross post.

On our blog each page has a utm variable in the front matter of the page. Update the `utm_campagin` portion with the title of your post.  

To use it in a link - simply append `{{page.utm}}` to your link.

Eg: `[Link](http://www.nitrous.io/?{{page.utm}}) `


If you're guest blogging - add the following to your links/calls to action that link back to us.
`http://www.nitrous.io/?utm_source=partnername&utm_source=blog&utm_campaign=articlename`

You can of course use this pattern for all your links - your partners will appreciate it.

### Have clear calls to actions that ask people to sign up, subscribe or download a Nitrous.IO product.

In each article have one or more calls to (the same) action that references a Nitrous.IO product.

The links at the bottom tend to perform best. You can track link performance in your post by adding `?utm_keyword=linklocation` to you links.

### Use a text-image-text Format to maintain visual consistency

For an example of this pattern [See this Post](http://blog.nitrous.io/2014/01/13/warming-up-with-emberjs.html).  

Notice the Format and see the location of "Read More..." break

### Use the Tweet Link on the Blog to Send out your initial Tweet
This improves the Tweet count on the page as more people re-tweet your original tweet.  
