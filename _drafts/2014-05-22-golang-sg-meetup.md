---
layout: post
title: "Singapore's First Golang Meetup: Recap and Slides"
author: Tim
utm: utm_source=nitrous.io&utm_medium=blog&utm_campaign=golang_sg
category: announcements
highlight_image: /images/sg-gopher.jpg
description: Inaugural Golang meetup in Singapore
---

Singapore can now join the growing list of cities where a Go meetup has been
standing room only.  We at [Nitrous.IO](https://www.nitrous.io) recently got
our buckteeth on and invited Singapore gophers to meet up and connect on May
21.  We were overwhelmed by the response!

![Standing room only in the Nitrous.IO office](/images/go-sg-meetup.png)

Despite the event being announced a week in advance, there were around 30
gophers/gophers-to-be squeezing into the Nitrous.IO Singapore office.  Many
local technology companies/offices were represented:
[Neo](http://www.neo.com/offices/singapore), [Pie](http://www.piethis.com/),
[Viki](http://viki.com), [Wego](http://wego.com), and more.

<!--break-->

## The Presentations

We planned two talks: one introductory, one advanced, to satisfy gophers of all
experience levels.  We later learned that half the attendees were new to Go, so
kicking off with an introduction turned out to be very appropriate.

### An Introduction to Programming in Go

Nitrous.IO CTO and co-founder Peter Kim
([@raingrove](https://twitter.com/raingrove)) gave a whirlwind tour of the
language, covering the basic syntax constructs up to structs and interfaces.
His demonstration of [sleep
sort](http://rosettacode.org/wiki/Sorting_algorithms/Sleep_sort) with
goroutines and channels got the biggest laughs of the evening.

The [slides for this
talk](https://speakerdeck.com/petejkim/an-introduction-to-programming-in-go)
are available on SpeakerDeck, or view them in the widget below.

<script async class="speakerdeck-embed" data-id="69f05ea0c317013186c11652ff098141" data-ratio="1.33333333333333" src="//speakerdeck.com/assets/embed.js"></script>

### Static Analysis in Go

I talked about static analysis in Go, covering the use cases for static
analysis and how it is like having continuous integration for your codebases'
code quality.  The talk included examples on how to use the `go/ast` standard
library package for static analysis and even code transformation in Go.

<script async class="speakerdeck-embed" data-id="8fb20c20c3e3013147053ea215ba4b0b" data-ratio="1.41436464088398" src="//speakerdeck.com/assets/embed.js"></script>

The source code and slides for this talk are also available at
[Bitbucket](https://bitbucket.org/keyist/static_analysis_in_go-slides).

## Recap

It was great to meet up with fellow Go fans of all levels.  From the Q&A
sessions after each talk it was clear that there are many topics to cover in
the future, particularly use cases for migrating existing services to Go.

## Where to go from here

For news on future Go meetups in Singapore, do join the [Singapore Gophers
Facebook group](https://www.facebook.com/groups/golang.sg/) .

We hope to have other community members give talks at future meetups, so please email us at [hello+golang@nitrous.io](mailto:hello+golang@nitrous.io) with proposals or ideas.

If you want to try out Go without having to spend time installing it locally,
You can [sign up](https://www.nitrous.io?{{ page.utm }}) with Nitrous.IO for a
free development box in the cloud with Go pre-installed.
