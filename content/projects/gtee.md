---
date: "2025-01-04T02:27:04+03:00"
draft: false
title: "gtee"
summary: A Go implementation of `tee`, a GNU Coreutils tool.
---

Before saying goodbye to 2024, I wanted to do one last project, one last thing before moving on to bigger adventures in 2025.

So, I started thinking about this and an idea struck me.

As an aspiring cloud infrastructure engineer, I've noticed that this is a field that requires _some_ level of deep knowledge, especially when it comes to Linux.

I've also noticed that Go has a really nice, solid ground in this field, since most of the tooling is written in Go, such as:

- Podman/Docker
- Terraform
- K8s

So, I thought, why not combine these two?

Enter `gtee`.

- Concept: _File processing, CLI_.
- Goal: _Having a better understanding of Linux_.
- Primary tool: _Go_.
- Repository: [gtee](https://github.com/acikgozb/gtee)

---

## The Why

In this section I am going to explain why I ended up writing a Go CLI regarding file processing on Linux, based on a tool that was initially implemented in **1974**.
Yes, you read it right, _nineteen-seventy-four_.

Writing a Go CLI was something that had been on my mind for the reasons below:

- Go really _feels_ like it _is_ the scripting language made for cloud infrastructure.
- Custom CLI programs are heavily used in this field, especially if they play nicely with the way shell works.
  So, if the interface is implemented in a supportive way, the programs end up being really flexible in Linux.

What about the bit regarding file processing?
Why is the selected concept _file processing_?
Well, this part is simple:

- As an engineer, I've mostly dealt with REST APIs in my career, aka _stateless applications_.
  But files are _stateful objects_, so I am naturally lacking in this area.
  This makes me both curious and intimidated, which means there is a good learning opportunity here.
- Files can be _big_, so I can't really write a CLI and expect to work with small files only.
  This forces me to write something that is a bit optimized, which means as few abstractions as possible.
  So, another learning opportunity.
- Playing with files means playing with bytes and buffers, and it's been a while since I've thought about bytes and buffers.
  Sounds fun, right?

And the last part is: why is this project based on a tool that was initially implemented in 1974?

There are several reasons:

- Being a shell builtin, the original tool aka `tee` is really well documented.
  [The POSIX specification](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/tee.html) of `tee` basically outlines how the tool, or any implementations of it, should behave.
  Since the requirements are all set, there is no guessing to do.
  All I need to do is to sit down and write the implementation.
- `tee` is simple.
  At the end, it duplicates standard input.
  This allows me to really experiment with creating an efficient program in Go, along with interesting bits like the SIGINT signal handling.
  Lots of learning opportunities, basically.

Finally, the very final reason, which is the idea of taking something that was done 30 years ago and re-implementing it, just sounds so freaking cool.
This is probably the main reason why I ended up doing this project.
And I am glad that I did, because `gtee` is ended up being faster than the original `tee`!

If you think about doing something in Go, I would highly recommend doing something like this.
GNU Coreutils has lots of tools that you can take inspiration from and learn whilst doing so.

## The Implementation

There are four processes that run concurrently:

- The main goroutine (1),
- Signal handling (2),
- Reading from standard input (3),
- Writing to standard output and files (4).

I will reference these processes with their numbers from now on.

### A Normal Scenario

- (1) waits until (4) is done, which basically comes after (3).
- (1) does **not** wait for (2).
  If that was the case, (1) would keep running until the `SIGINT` signal reaches (2), even if (3) and (4) are done. This behavior is not written in POSIX specification.

Therefore, (2) is left out of the main process loop to keep things under control.

However, (2) needs to communicate with other processes when `SIGINT` is sent by the user or kernel. It does this via `context.Context`:

- (2) creates a `context.Context` and once `SIGINT` hits, it cancels the context.
- (3) and (4) listen to the context and if there are any cancelations, they basically clean up their resources and stop, which unblocks (1) and closes `gtee`.

### Error Cases

When an error happens during (3) and (4):

- (3) cleans up its own resources and stops reading. Therefore, (4) also does the same.
- The error is sent to (1), which writes it to `/dev/stderr` and sets its exit code to >0.
- Since (3) and (4) finish, this state unblocks (1), which closes `gtee` with code >0.

When an error happens only during (4):

- The error is sent to (1), which writes it to `/dev/stderr` and sets its exit code to >0.
  Only the write process associated with the file stops.
- (3) and the rest of (4) keep running until either both are completed or an error happens on (3), which eventually unblocks (1).
- Since there was an error on (4), (1) closes `gtee` with code >0.
  This is basically a partial completion of `gtee`.

As you can see, even if the program is simple, a basic concurrency really spices things up a little bit.

Other than the concurrency part, the reading process is done via a 64kb buffer.

In a normal scenario, the only thing that really allocates memory is 64kb buffer reserved for reading and a 64kb copy of that buffer that gets sent between (3) and (4).

---

And that's it!

I apologize if I confused you with the implementation part.
If there is a better way of doing this, I would love to hear from you. Please let me know!

I really had a lot of fun with this one before saying goodbye to 2024, I hope you had fun whilst reading it!

For more information, you can check the project [README](https://github.com/acikgozb/gtee/blob/main/README.md).

Thank you for reading!

`:wq`
