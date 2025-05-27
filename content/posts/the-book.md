---
date: "2025-05-27T00:16:07+03:00"
draft: false
params:
  author: acikgozb
title: '"The Book"?'
summary: "This time, it is all about Rust."
---

It might be an unpopular opinion, but I love reading books about tech.

It is unpopular because as soon as a book comes out, it becomes outdated with the current pace we have in tech. So, there is some truth in that.

However, I believe some books are "timeless". Those that try to pass fundamental perspectives about certain concepts.

If you are reading this post, I assume you are intrigued by Rust to a point that you saw the phrase [The Book](https://doc.rust-lang.org/stable/book/) multiple times during your research.


You have decided to invest time reading it, but you do not know whether it is worth the effort. Or, you may wonder how it might be a helpful read.

I was there.
I had these questions as well, but went through all 21 chapters which took around 2 months.

In this post, I will share my own experience in the hope of answering your questions as much as possible.

---

## The Starting Point

Now, everyone's journey in tech is different.
Let me explain my starting point to add more context to the topic.

My journey in programming languages goes like this:

- C, if we count college!
- JavaScript
- .NET
- Go
- Bash

There are others in between, but these are the main ones.

If I do not count my very limited time with C, I mostly code via high-level languages. And as time went on, I started to get bothered from a very simple fact:

There was a lot of *magic* happening behind the scenes.

I don't know why, but as I kept going there was this urge to use as less abstractions as possible to have more clarity and confidence about the thing I am writing. So, I started researching about this.

The research led me to two languages at first: C and C++ (excluding Assembly).

I don't know why, and I still can't explain today why these languages push me away from trying them. It is definitely a skill issue, but every time I open a C or C++ code it looks like a forbidden dark magic. It was the case back in the college, and it still is (to a lesser extent).

A part of me wanted so hard to take a shot at C and clear the haunted days I had in college. On the other hand, I wanted to research more to see if there is a way to access that *low-levelness* (is that a word?) in some other way.
I have to say I did not think much about C++.

So, I kept researching and that's when I first saw Rust.

This is really interesting but I almost had the same feeling I had for C and C++ for Rust, but this time it was backwards.
The syntax looked amazing, the language seemed really modern, and the tooling around it amazed me.
It felt like I *had* to try it!

I don't exactly know why I had these initial impressions without knowing anything about Rust but I decided to follow it and learn more.

So, my starting point was this feeling along with a very basic understanding of some concepts that are prevalent in low-level languages (stack/heap, mem management, pointers).

To learn about Rust, I probably did the most straightforward thing and went to its [official site](https://www.rust-lang.org/learn).

There I saw "The Book".

## The Book

First of all, I want to say how great it is to have a reference like this for a programming language:

- It is written by the designers of the language,
- It tries to explain the fundamental mindset shift Rust has compared to other languages,
- It has lots of examples with little projects in between, not just a wall of text,
- (probably the best) It's free!

Now, the sheer length of the book may seem intimidating at first.
And you're right!
We have definitely lost our focus when it comes to things like this.
1-minute Shorts, TikTok, Reels and 3-minute Medium blogs of this era of the Internet do not help us at all.
We have gotten so used to speed that we have forgotten to appreciate the content, think as we consume, and invest time overall.

However, "The Book" is not something that you can or should skim through.

If you are someone who knows Rust and uses this as a reference, that's fine.
You probably know a lot more than I do.

If you are a total newcomer though, I would urge you to change your mindset before starting.

Trust me, it will help.

## The Mindset

Here is the mindset I followed, and I would recommend you do the same.

### It Takes Time

First of all, accept that learning takes time, especially if you are used to working with high-level languages.
Low-level languages are completely different beasts, and the problems they focus on are completely different than high-level ones.

Realize that you are stepping in a completely different playground.
It's nothing but natural to take time to understand.
I see it as a long-term investment, and I believe it is the healthy approach to take.

### It Is Just the Beginning

As a newcomer, your goal should be to have just an *idea* about Rust when you finish The Book.
You should definitely not try to memorize every single feature that is mentioned or think like you will understand everything afterwards.

Even though the reference is great, no amount of text would be enough to learn something in tech.
You need hands-on experience, and Rust is no different.
Understand that the real learning phase will begin *after* you finish The Book.

### Keep an Open Mind

Also, approach Rust and The Book like a breath of fresh air.
Rust has its own take at the common issues in other low-level programming languages.
Of course, it has features that exist on others as well, and while reading you may find yourself comparing them.

For those cases, I believe it's best to keep an open mind and try to improve your perspective instead.

## Skipping The Book

In the previous section, I said that the real learning phase starts after The Book.
So, you might think it is alright to skip it and jump straight to projects.

For this I have to say, everyone's learning journey is different.
Some people learn by simply playing around with the concept and research as they encounter problems, some learn better by first understanding the tool they are working with a little bit. 

There is no right way to approach this, you can go straight to projects and use The Book as a reference, or read it first and then start doing projects.

However, I can say that reading about the syntax or the mindset of Rust helps a ton.
So if you decide to invest time before doing something with Rust, I can assure you - it won't feel like wasting time at all.

For me, I prefer to approach a certain technology by reading it beforehand, it makes the whole learning process feel less *messier*.

One thing is for sure: read it or skip it - you have to get your hands dirty at one point.

## The Important Bits

Don't get me wrong, this is not a TLDR of The Book.
There are some concepts where you need to pay extra attention and try to understand them fully, no matter how long it takes.

This is just a heads-up.
The concepts I'm talking about are:

- Ownership,
- Borrowing,
- Lifetimes,
- Smart pointers.

These concepts are the ones you should absolutely have an idea about when you finish the corresponding chapters.
They are literally at the core when you see Rust out in the wild, and having an understanding of them makes it a LOT easier to work with Rust.

I'm certainly glad that I took extra time to let these concepts sink in. I cannot stress it enough.

If you have experience with another low-level language before, they say it gets a lot easier to understand why these concepts exist in Rust.
Because then you know the problems these concepts try to solve.

I did not have any experience, so it was completely a new perspective to understand.
However, it wasn't hard to get it, it was just *different*.
So, you don't have to worry about anything, just keep an open mind while reading.

## What Should You Expect Afterwards?

Here is what happened to me afterwards.
I took the time and finished reading The Book.
This means:

- I went through all the chapters,
- I carefully checked out the examples and tried to understand them,
- I did the example projects in between.

So, it was about time to do projects.
I eagerly created one:

```bash
cargo new YES
```

I opened the project in my editor, and then I found myself staring at the `main` function.
I just spent 2 months and feel like I couldn't do anything.
Why was that?

### Taking Off The Training Wheels

The reason was quite simple.
The Book explains the concepts with examples as any other learning material would.
Here is an unavoidable fact about examples: they are basically small, pre-made playgrounds that are made and thought by other people.
Examples are great at explaining the concepts, but they make us skip the thought process of creating something.
They hold your hand and make the entire experience really comfortable.

So, naturally, when I was on my own to create something, I was baffled.

You might feel the same, and if you do, understand that this is quite normal.
It doesn't matter whether you read books, do lots of tutorials, or jump straight into the action.

The very first time when you are forced to think by yourself, you become paralyzed no matter what.

All I can say is - expect to be in this situation, but also expect to get out of this situation a lot easier compared to the case where you skip reading The Book.

Because you actually *do* understand the environment you are working with.

### Searching For Answers

No matter what you do, you are bound to encounter issues when you are coding.

Here is actually where The Book shines: it helps you understand the compiler errors you get, what you should search for, and the things you see while searching.

It is especially beneficial if you are coming from high-level languages.
I would probably struggle a lot more if I didn't read before, because:

- There is a mindset difference caused by using high-level languages, The Book helps you to form an idea about the differences.

- You do not simply go from high-level to low-level, you try to go from high-level to low-level with Rust, and having an idea about Rust before makes it a lot easier to understand while searching about it.
It would be pretty hard for me if I searched for answers without seeing the terms ownership, borrows or lifetimes before.

Other than these, The Book also helps you to navigate a lot easier in Rust's documentation.
Compared to other languages, Rust's documentation is really dense.
I am still not entirely comfortable with it, especially when it comes to 3rd party crates, but I would struggle a lot more if I went straight in instead.

Like I said before, the actual learning starts after The Book, and if you invest time in it, it makes the whole learning process a lot easier and fun.

---

So that's it! I hope I answered your questions and left you a bit less confused than before.

I write this as someone who has been playing around with Rust for a couple of months only, so take anything in this post with a grain of salt.
I still have a lot to learn and discover about it.

Overall, I think Rust is a great programming language to work with.
No matter how you approach it, I believe it will broaden your perspective in the long run if you stick with it.

Thank you for reading!

`:wq`
