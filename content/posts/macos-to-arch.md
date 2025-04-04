---
date: "2025-03-27T22:40:48+03:00"
draft: false
params:
  author: acikgozb
title: "From MacOS to Arch Linux - Is the Effort Worth It?"
summary: "For those who are curious about making the change."
---

I'm pretty sure most of you have heard the phrase before:

> If you want to learn Linux, you should try to install a distribution and play with it.

I bet you have heard this phrase as well:

> If you use MacOS, you don't need Linux. Just use your Mac to learn Linux.

I started my professional career in an era when MacOS was marketed heavily as a developer-friendly, convenient operating system to work on.
If I add my limited perspective as a junior to this fact, it's natural to say that I did not think even a little bit back then to decide which operating system to choose, I just bought a Macbook and rolled with it.

However, as I kept moving on in my career and diving into the world of Linux, I got curious about it even more.
Also, it really sounded like a natural progress to me to switch to a Linux system to learn Linux and move from there.

In the end, my curiosity beat me so I decided to buy a new computer to try a distribution.
For those who wonder about how it feels like, I think this post may help you a little bit.

---

## Step 1: The Distribution

Now, when it comes to Linux, there are a lot of distributions to choose from.
There are no good or bad distributions, it essentially all boils down to what an individual wants from its operating system.
So, the very first step for me was to decide what I wanted.
To be honest, it was quite easy to figure out.

I am primarily a DIY guy, meaning that I enjoy building stuff by myself to learn and improve my perspective, rather than reaching out to 3rd party packages to solve a problem as quickly as possible.

Of course, this mindset is not applicable all the time, especially at work, but I at least try to apply it to my personal projects.
By doing this, the whole experience also makes me understand and appreciate the hard work that is put into those packages.

That is why, I wanted to install a distribution that caters to this "DIY" mindset.
This decision, along with a little bit of research led me to the answer.

I finally decided to install *Arch Linux*, because:

- Arch Linux's documentation is recommended by the community for not just Arch, but nearly for all distributions.
- Rather than trying to cater to all users, it is designed to be simple and user-centric, meaning that each user can customize the system to solve their own needs.

It seems like a match made in heaven for me.

## Step 2: The Installation

After deciding on the distribution, I proceeded with the installation. 
This step was quite easy to do as well, simply because the documentation explains every single step one by one with detail.
We just need to read it carefully and understand & change user-specific configurations accordingly.

To be fair, compared to the MacOS installation wizard, doing literally everything in the terminal during the installation was quite mindblowing for me.
I am no stranger to the terminal, but the first time I connected to my home network via a CLI tool, it truly fascinated me on a different level.
At that point, I knew that choosing Arch Linux was an excellent decision.

Maybe I'm romanticizing a bit too much at this point, but I wouldn't think about having fun during an installation.

With the excitement I had, I quickly blazed through the installation (without using `archinstall`) and finally, the login screen appeared.
After coming to the end of the documentation, I thought I was done with the installation.

Oh boy, I was so goddamn wrong.

## Step 3: The Issues After The Installation

Now, the things I will explain are not *issues* related to Arch Linux or Linux in general.
They *feel* like issues simply because of the convenience offered by MacOS.

When we install or update MacOS, everything just works out of the box without doing anything.
This is because MacOS is designed to work on a really specific hardware and user experience is pretty much the main focus of the system.

If we think about Linux, this is not the case at all:

- Linux is designed to run on different hardware, and the experience may differ between one system and the other,
- The user experience also depends on each distribution. Some of them focus on out-of-the-box experience, but distributions like Arch Linux focus on being user-centric and leave most of the configurations to users themselves for their own needs.

So it's natural to have so-called *issues* for things like:

- Audio
- Bluetooth
- Monitor (brightness, scaling)
- Keyboard
- Camera
- Network

For me, the speakers and Bluetooth weren't working and my network connection was really slow.
Thus I began the very first troubleshooting on Arch.

For audio and Bluetooth, the problem was simple.
I forgot to install the utility tools that interact with the associated drivers, so I quickly installed them and fixed the speakers and Bluetooth connectivity.

The network issue was a little bit different:

- During the installation of Arch, I installed `NetworkManager` as the main network management tool without any issues. 
- I was connecting successfully to my home network.
- When I ran the speed test on another computer, I saw the same download/upload speeds.

Basically, everything seemed just fine at first.
However, while I was doing basic network troubleshooting with `ping`, I noticed something quite interesting:

- When I pinged a domain via its name (e.g. youtube.com), the initial ICMP echo packet was logged after a couple of seconds.
- When I pinged a domain via its public IP address, the initial ICMP echo packet was logged instantly.

This led me to believe that there was an issue related to DNS name resolution.
Since I didn't configure `NetworkManager`, I checked its default configuration.
Apparently, `NetworkManager` uses Glibc DNS resolver by default.
When I looked at the documentation, I found the root cause: Glibc [does not cache DNS queries by default!](https://wiki.archlinux.org/title/Domain_name_resolution#Resolver_performance).

So the solution was simple.
I configured `NetworkManager` to use `systemd-resolved` which caches queries by default and configured it to use Cloudflare's DNS as its primary source to resolve domain names.

While I was reading the documentation, I also learned about the different WiFi "backends" that `NetworkManager` can use.
Apparently, a program called `iwd` provides better WiFi performance compared to `NetworkManager`'s default one, which is `wpa_supplicant`.
While I was changing `NetworkManager`'s default configuration for the DNS issue, I also configured it to use `iwd` as its WiFi backend.

I did a quick reboot afterwards and voilà!
The connection speed was fixed and everything was working just fine.

I have to say that Arch Linux documentation literally carried me at this point and it made my realize why the community frequently refers to it.

## Step 4: The Customization

Since the initial problems were out of the way, it was time to have some fun aka. *the customization* phase.
I wanted to customize the system to provide myself with a better developer experience and productivity.

Now it would be a bit pointless for me to write down everything I've done on top of the base Arch installation since each user has their own needs.
Instead, I would like to focus on another point that may intrigue you more.

Unlike MacOS, Arch Linux (or any other Linux distribution in this matter) is quite *open*.
You are literally encouraged to tinker around the system.
Also, the more you are comfortable within the terminal and the overall environment, the better the experience gets!

So it becomes second nature on a Linux system to either script your way to victory, or find and configure a package that suits your needs.
This is really important: the environment you get by having a Linux system provides you with a unique opportunity that allows you to both practice Linux and improve your own system - an opportunity that MacOS cannot provide as good as Linux itself.

This solves one of the main issues we have as software engineers: we want to do personal projects to improve ourselves, but it's so hard to come up with ideas to practice concepts.
It's also really fun to write programs that you know you will use daily to either solve a problem or to make the system more convenient for yourself.

---

And that's it!

I hope this post has made you a little bit more interested than before.
It's been a month since I started this, and at this point, I fully agree with the phrase below:

> If you want to learn Linux, you should try to install a distribution and play with it.

My primary goal was to start investing some time to learn more about Linux, and having a Linux system definitely makes it a lot easier to achieve.
It's doable with MacOS as well (to a point), since both systems share a common ancestor (Unix).
However, learning Linux on a Linux system, either through a VM or bare metal makes the experience a lot more natural (and fun, of course!).

So, to answer the question in the title of this post, the effort is definitely worth it.
I am glad that I followed my curiosity, and I would recommend anyone to go for it! 

Thanks for reading!

`:wq`
