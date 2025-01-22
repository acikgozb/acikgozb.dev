---
date: "2025-01-22T17:44:52+03:00"
draft: false
title: "Local K8s"
summary: "A local Kubernetes cluster, created from the absolute zero with nothing but Bash."
---

If we are talking about cloud infrastructure, we can't skip the elephant in the room, which is _Kubernetes_.

Whether it is used for valid reasons or not, we cannot deny that it is used _widely_ in the cloud industry.
So, it has been on my mind to start learning about Kubernetes from the beginning of 2024.

Thus began my first journey of 2025, with full of excitement, frustration, suffering, and dopamine rushes.

The result?

Enter `local-k8s-osx`.

- Concept: _Container Orchestration, Cluster Administration_.
- Goal: _Having a base cluster that acts as a playground for future projects_.
- Primary tool: _Kubernetes_, _Bash_.
- Repository: [local-k8s-osx](https://github.com/acikgozb/local-k8s-osx)

---

## The "Why"

As with most of the other posts regarding my projects, I would like to start by explaining why this project exists.

The main question is this:

_If someone wants to start learning about Kubernetes, what can they do as a project?_

Here is my long answer:

As you might know, Kubernetes is basically an _abstraction_ around cloud infrastructure.
Moreover, it is recommended by the community to start learning Kubernetes through several other tools such as `minikube`, even for non-application developers.

Tools like `minikube` are basically _abstractions_ that allow people to bootstrap a _small cluster_ really easily (!), which effectively makes it easier (!) to start playing around with Kubernetes concepts.

Please pay attention to where I put "(!)".
Because at this point, we are talking about an _abstraction_ that is used for another _abstraction_.

For people who have experience with Kubernetes, the idea of making a cluster easier with tools like `minikube` may actually be true.

For newcomers, especially for non-application developers, I strongly disagree.
Hiding away some parts of an abstraction does not make the abstraction easier, it makes it _magical_.

While researching about Kubernetes, this fact bothered me a bit.
Because for a newcomer, the statement above really turns into this:

> _Tools like `minikube` are basically abstractions that allow people to bootstrap a small cluster really magically, which effectively makes it magical to start playing around with Kubernetes concepts_.

I believe that having as less magic as possible is beneficial whilst **learning** something new.
Because we are bound to fail during the whole process.
At that point, we should be able to map exactly why we failed in a crystal clear way, in order to learn from our failures.

Anyway, back to the point.

The mindset I explained above led me to the answer of the main question:

> _If someone wants to start learning about Kubernetes, what can they do as a project?_

I decided that the project would be about creating a Kubernetes cluster in a manual way.
Because having a fully healthy cluster **is** the very first point of Kubernetes.

Now that we are on the same page about the reasoning behind the project, allow me to explain more about it.

## The Implementation

Whilst I was researching about creating a Kubernetes cluster, I encountered several guides along the way:

- [kubernetes-the-hard-way](https://github.com/kelseyhightower/kubernetes-the-hard-way/tree/master)
- [kubernetes-the-harder-way](https://github.com/ghik/kubernetes-the-harder-way)

The second guide really piqued my interest because it dives deep into the virtualization and networking part of the cluster.

However, I knew that blatantly copying and pasting a guide would not help me learn more about Kubernetes.
So I took my time a bit to make sure I understood every single point the author made.

Along the way, some differences started to appear for several reasons:

- The guide was initially written two years ago. So, naturally, the binary versions are different.
- The subnet used in the guide (`192.168.1.0/24`) was occupied by my ISP, so it was not possible to assign it to the virtual interface of the cluster.
- Since the version I used for Kubernetes is different, some of the resource definitions needed to be changed.
- I decided to play around with the values of TLS signing requests, which slapped me pretty hard later on when I tried to establish secure communications between different Kubernetes components.

And I am glad there were differences like these!
These made me really work through the guide to achieve the same result as once the author achieved.

So, whilst the implementation of this project more or less follows the same idea, it is not an exact copy of the guide which earns its own place on this website.
Here are some of the key differences:

- The default subnet of the cluster is changed to `192.168.200.0/24` from `192.168.1.0/24`.
- The installed Kubernetes version has been upgraded to `1.31.4`.
- A couple of extra scripts are added to automate the cluster creation/teardown process.

## Is This a `minikube` Replacement?

The short and obvious answer to this question is a big _no_.

This project does not aim to abstract the creation of a Kubernetes cluster.
The whole code is right there in the repository to check with absolutely zero magic, it's just a collection of good old Bash scripts.
It was merely an opportunity for me (and you, if you decide to take a shot at it) to learn how a Kubernetes cluster is set up, and how the main Kubernetes components interact with each other.

`minikube` serves as a completely different purpose and creates a completely different Kubernetes cluster.
Don't get me wrong, I'm not bashing `minikube`, you should definitely check it out, especially if you are an application developer.

## Going Forward

As I said in the implementation part, there are some scripts in this project which automate the cluster creation/teardown process.
I added these scripts because I aim to use this as a playground to learn more about Kubernetes in the future.

It seems using the cluster like this is also a good opportunity to test it as well, and see where it truly lacks.

Guess we'll see how this goes!

---

And that's it.

This was definitely a nice journey to start the year, and I would highly recommend you to check the [original guide](https://github.com/ghik/kubernetes-the-harder-way) and try it yourself.
The author really does a fantastic job explaining how everything is connected together.

For more details regarding the overall architecture and the implementation, you can check the [repository](https://github.com/acikgozb/local-k8s-osx).

Thank you for reading!

`:wq`
