---
date: "2024-12-02T16:55:15+03:00"
draft: true
title: "Dotfiles"
summary: "Local environment configuration. Powered by Ansible."
---

Imagine this:

You have your personal workstation and have been using it extensively for a couple of years.
As a result, you have done numerous changes on that workstation:

- Installed a lot of tools,
- Configured them for your liking,
- Fixed issues through hard work, frustration and sweat.

Unfortunately, the time has come and you have to change it.
But, that also means doing all the hardwork again to make it same like the previous one.

If you wonder whether there is a way to _not_ do it all over again, yes, there is:

Enter `dotfiles`.

- Concept: _Automation_.
- Goal: _Configuration management of a workstation_.
- Primary tool: _Ansible_.
- Repository: [dotfiles](https://github.com/acikgozb/dotfiles)

---

## What is `dotfiles` ?

Dotfiles is a collection of configuration files that allows me to create my own local environment.
By storing my local environment configuration in a version control system, it allows me to track and maintain my configuration via code.

## How Does It Work?

The idea is really simple. Let's go over an example.

Assume that we want to install `cowsay`, a tool that prints cute little cows.
Normally, we would do this:

```bash
# MacOS
$ brew install cowsay
# ...

$ which cowsay
# /opt/homebrew/bin/cowsay

$ cowsay "moo"
#  _____
# < moo >
#  -----
#         \   ^__^
#          \  (oo)\_______
#             (__)\       )\/\
#                 ||----w |
#                 ||     ||
```

Now we can enjoy having a cute little cow in our terminal. Just what we needed.

However, there is an issue with this approach.
This is fine as long as we can use the same workstation forever.
But, what happens if we use a different one? We would have to run this installation again.

The installation for `cowsay` is not that hard to understand, but modern workflows usually consist of many different tools and custom configurations.

To fix this issue, we can simply write a script that contains all the installations we need:

```bash
#!/usr/bin/env bash

echo "Installing tools..."

# MacOS
brew install cowsay
# many more commands below
# ...
# ...

echo "Installation is completed."
```

If you followed along, congratulations!
You've written your first script to be put in a **dotfiles** repository.

So basically, the idea is to:

- Store all the installations and custom configurations in scripts to not repeat ourselves,
- Put them under a version control system like **Git** to apply versioning,
- Pull and run them on each new workstation to reproduce the same environment as before.

## Why Is It Called "Dotfiles"?

Normally, the configuration files and directories usually start with a `.` (dot) in Unix world such as `.bashrc` or `.ssh`.
These files are also hidden.

Since our goal is to store our configuration files which represent our unique local environment, the directory that holds these files is called **dotfiles** as a convention.

## The Implementation

There are different ways of executing this idea.
Essentially, all of them does more or less the same thing with the example case above.

I went with **Ansible** as my weapon of choice because **dotfiles** is essentially a **configuration management project**.
The main thing that differs from actual configuration management is that **the managed host is my own local host instead of a fleet of servers**.

Since managing one host is a lot easier than managing a thousand, I thought this is a perfect opportunity to get my hands dirty with Ansible.

Also, we engineers just love storing everything as code. So in this sense this project is again - a perfect opportunity.

So, the implementation consists of:

- Ansible **roles** (e.g `acikgozb.zsh`, `acikgozb.nvim`, `acikgozb.hashicorp`) to have a logical grouping of tools,
- Ansible **tasks** for **Fedora, Ubuntu, and MacOS** to support multiple operating systems.
- Variables which customize these roles to lower the maintenance cost of updating the installation.

## Last Words

I'll be blunt in here, I would highly encourage anyone reading this to just jump right in and create their own dotfiles instead of just installing mine and call it a day.
These configurations are what work for me and my own taste, you will probably disagree with most of the settings.

I believe everyone should find their own unique local environment configuration, and then slowly create their dotfiles.

You can reference this project, I believe it can be a good starting point especially the installation parts with Ansible.

This does not mean that everything here is absolutely perfect, as I said before this was just an opportunity for me to gain experience in Ansible and have fun while doing so.

---

Please refer to the [repository](https://github.com/acikgozb/dotfiles) for the installation, usage and more details.

If you've used this project as a reference, I would love to hear your experience (good or bad) 🎉

Thank you for reading!

`:wq`
