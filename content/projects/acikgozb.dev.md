---
date: "2024-12-22T19:53:17+03:00"
draft: false
title: "acikgozb.dev"
summary: "The very website you are reading right now. Powered by Cloudflare and AWS."
---

Personal websites are great.
I believe everyone would say the same.
There is no denying of it.

For consumers, they allow us to read engineers' insights and projects about certain topics which may spark interest.
For engineers, they allow them to express their opinions and projects in a place where they have total control.

A personal website is also a kind of product where there is not much thought needed to **get started**, unlike other products.
You can pretty much do whatever you want.

Another interesting thing is, the focus of the website changes based on which field the engineers are interested in:

- **Frontend** -> the design of their website will be the main focus.
- **Backend** -> the features and data of their website will be the main focus.
- **Server infrastructure** -> the infrastructure of their website won't be the same like the points above.

Let's see what the focus of this website is that you are in right now.

Enter `acikgozb.dev`.

- Concept: _Cloud storage, Networking, IaC, CI/CD_.
- Goal: _Having a personal public website_.
- Primary tool: _Terraform_
- Repository: [acikgozb.dev](https://github.com/acikgozb/acikgozb.dev)

---

## The Requirements

Before starting this project, I need to set some requirements to get things going.

### Frontend

For the design, I do not want to have a fancy, colorful website that is filled with animations.
To be fair, I like boring designs, they make me focus on the actual content.

What I care is the responsiveness of the website, meaning the content should be readable on both mobile and desktop screens.

### Backend

The main point of the website is to show content to people, so there is no need to have any additional features.

In other words, no API is needed, since no one needs to interact with anything.

### Infrastructure

Now this part is a bit more interesting than the others.

When it comes to personal websites, there are a lot of easy options one can take to make things really simple and fast, such as:

- [Cloudflare Pages](https://pages.cloudflare.com/),
- [Github Pages](https://pages.github.com/),
- [AWS Amplify](https://aws.amazon.com/amplify/)

And probably many more I do not know.

These options are used pretty widely in many different personal websites due to the simple fact that they abstract the actual infrastructure we need to design and implement.
And that is OK! Not everyone wants or needs to deal with the infrastructure. That is why abstractions exist.

However, using these abstractions in this case would prevent me from learning more about several important concepts, which are:

- Cloud storage,
- Networking (DNS),
- Immutable infrastructure (IaC)

This project is a perfect opportunity for anyone to gain more knowledge about these concepts, if they wish to do so.

So my **most important** requirement is to **NOT** use abstractions like the ones above.

### Cost

This is not surprising, but everything comes with a cost.

This is an obvious fact for anyone before starting this project, because having a custom domain name is not free.
So, I _cannot_ escape from paying for the domain name `acikgozb.dev`.

What I _can_ do is to make the website as cheap as possible, which is the final requirement.

To wrap up, here is the list of requirements:

- The design should be simple and responsive.
- Using abstractions such as Cloudflare Pages is forbidden.
- The website should be as cheap as possible.

## Tech Stack

Now that the requirements are set, we can move on with the tech stack.

### Frontend

For frontend, a static-site generator is a perfect fit for the requirements:

- The content of the website is static,
- There are a lot of pre-made, simple yet powerful themes which I can use and skip designing.

Therefore, I chose [Hugo](https://gohugo.io/) as my static-site generator.

The fact that it uses Golang templating is perfect because Golang is heavily used in modern cloud infrastructure tooling as well.

### Infrastructure

My initial goal was to self-host this website on bare metal, meaning that I did not want to use cloud providers such as AWS, Azure or GCP.

However, for personal reasons, I cannot invest in a homelab right now.
Therefore, I ditched this idea and chose the cloud provider I have the most experience of, which is [AWS](https://aws.amazon.com/about-aws/?nc2=h_header).

If you checked the GitHub repository, you may noticed that [Cloudflare](https://www.cloudflare.com/) is also used as well, but I will explain why that is later.
My initial plan did not contain Cloudflare, but at the end I am _really_ glad that I added it, and I am looking forward to experimenting with it a lot more.

Now that the platforms are set (AWS, Cloudflare), we need additional tools to deploy the website:

First is a pipeline to automate the deployment.
I do not want to generate the static assets and deploy them by hand every time I create new content here.
I had two options based on my experience:

- [GitHub Actions](https://github.com/features/actions)
- [Jenkins](https://www.jenkins.io/)

I would ideally go with Jenkins but for this project, I went with **GitHub Actions** because at the time of writing this post I did not have a Jenkins server available for my personal projects.
I want to take my time and set up a Jenkins server with Kubernetes later on.

The last thing I need is a way to automate the infrastructure deployment.
I do not want to deal with both Cloudflare's Dashboard and/or AWS's Console every time I need to change something in the infrastructure.
I also want to store and track the state of it to see exactly what has changed and what the current state of it is.

This idea is basically called _Infrastructure as Code (IaC)_.
There are a few IaC tools available but for this project I chose [Terraform](https://www.terraform.io/), simply because I am dealing with multiple platforms (AWS, Cloudflare).

For AWS only projects, [AWS CDK](https://aws.amazon.com/cdk/) may be considered as another contender.

To wrap up, here is the tech stack:

- Hugo
- Cloudflare
- AWS
- GitHub Actions
- Terraform

## So, Why Cloudflare?

The TLDR answer is _DNS_.
DNS zones in Cloudflare are included in the free plan, but on AWS, each hosted zone costs $0.50 per month.
To satisfy the cost requirement, I went with Cloudflare.

---

Now, the long answer:

I initially started designing the entire infrastructure on AWS, like anyone would.
For a static website, the most straightforward solution is to have an AWS S3 bucket tied to AWS CloudFront (CDN) to serve the static assets.

This part fits perfectly into my requirements, because AWS offers a free tier for a year for any newly created account, which has pretty good limits for AWS S3 and CloudFront.
Atleast the limits are more than enough for a personal website, since the traffic is expected to be pretty minimal.

So, cost wise, it is pretty much free up until this point. However, as you might have guessed, this is not enough.

I needed to tie my AWS CloudFront URL to my domain name `acikgozb.dev` so that the content is served from my domain instead.
And this was the time when I did not have the domain name, so I started looking at how to get started with this entire DNS thing.

Now, if I start explaining about DNS, this post will be _rrrreally_ long, so I will just keep it brief.

Here is the list of DNS concepts that I will talk about a bit:

- DNS registrars,
- DNS registries,
- DNS nameservers,
- DNS zones

Lovely, right!

First things first, there is no such thing as _buying a domain name_.
This is not something you can buy and be done with, it is something you can _rent_, usually annually.

So, in DNS words, renting a domain name means _registering a domain name_, and this is done through _DNS registrars_.
As you can guess, we can register our domain names through AWS by using its DNS service, Route53.

When we register a domain name, registrars notify _DNS registries_, which hold information about all the registered _DNS nameservers_ on the Internet.
Registrars tell registries where to find the DNS nameserver which holds our domain name when someone (users) wish to access the domain.

Before it gets confusing, here is the current flow using AWS as a DNS registrar:

```
We pay AWS for the domain name
            |
            v
AWS notifies DNS registries about the nameserver that holds the domain name
            |
            v
DNS registries link the domain name with the DNS nameserver
```

And here is what happens when you - the reader - visit this website (regarding DNS):

```
You enter acikgozb.dev on your browser
            |
            v
DNS registries point to the DNS nameserver that is registered by AWS (the registrar)
            |
            v
            ?
```

Now, the last missing part is the important piece that led me to use Cloudflare instead of AWS.

The DNS nameserver of our domain name needs to return an _IP address_ in order for you to visit the website.
And this is where _DNS zones_ come into play.

We can use _DNS zones_ to control what our DNS nameserver returns when someone visits our domain.
Unfortunately, AWS charges 0.50$ a month for each DNS zone you have.

I mean when we think about it, $0.50 is not that much but this created a conflict for me for several reasons:

- Having the entire infrastructure on AWS is nice, but this is not a requirement.
  On the other hand, hosting the website as cheap as possible is.
- What happens when I wish to have multiple DNS zones on AWS in the future?
  The cost would start to ramp up.

So I wanted to research more before registering `acikgozb.dev` and this led me to Cloudflare's DNS offerings and their free plan in general.

Cloudflare does also have a DNS service like AWS and the cost of registering a domain name is the domain name itself (no additional cost).
On top of this, Cloudflare's DNS zones and associated DNS nameservers are _free_ unlike AWS where the DNS zone and the nameservers are paid.

Cloudflare's free plan does not consist of their DNS service only.
For example, their CDN is top-notch as well and their limits for available services seem really generous.

There is only one "kind of" downside of the free plan of Cloudflare DNS.
Once you register a domain name via Cloudflare, you cannot use other DNS providers (nameservers) for your domain name.

This is only possible with an enterprise plan, but it is not a limitation for me, so I accepted the offer.

I would like to encourage you to try out Cloudflare as well!

## Honorable Mentions

There are a couple of bits I want to talk about before finishing the post.

### OpenID Connect

Since the pipeline deploys static content on AWS, it needs to have access to my AWS account.
Having hardcoded secrets for AWS is discouraged, therefore I went with OIDC to have short-term access with automatically rotated credentials.

I will write more about this in a separate post, because AWS documentation regarding identity is a bit confusing.

### Silenced IaC Output

If you check the pipeline code, you can see that `terraform plan` and `terraform apply` outputs are silenced.

There are several reasons:

- I wanted to make the Git repository public,
- I wanted to have the IaC live in the same place as the application,
- `terraform plan` and `terraform apply` may output sensitive information, and I do not want to expose it to the public.

Since only `stdout` is silenced, the errors are still visible.
So far, I haven't seen any sensitive information leaked during deployment errors, so I am keeping this as is.

If there is a better way please let me know, I would love to hear it :)

---

And that's it.

I had been thinking about doing this for a loong while, and it finally happened. It was certainly a nice opportunity for me to mess around with certain concepts, and I am glad I did not use abstractions like GitHub Pages to skip dealing with the infrastructure!

You can check out the architecture in the project [README](https://github.com/acikgozb/acikgozb.dev/blob/main/README.md).

Thank you for reading!

`:wq`
