---
date: "2024-12-03T11:37:25+03:00"
draft: false
params:
  author: acikgozb
title: "Local CI"
summary: "Test your Jenkins pipelines locally."
---

Local testing, in any context, is done to receive a faster feedback about the thing we try to build.
It is also done to ensure that the things we build actually behave like we want on remote servers.

Throughout my career, I've noticed that this "local testing" culture is quite prevalent when it comes to applications we build.
However, I've also noticed that when it comes to the pipelines we build for our applications, the testing phase is often carried out through **trial and error**, it's almost the reverse.

So, is there a way to test our pipeline code before running a deployment to understand the errors?
That is what we are going to find out.

Enter `local-ci`.

- Concept: _CI/CD_.
- Goal: _Testing the CI pipelines we build_.
- Primary tool: _Podman, Jenkins_.
- Repository: [local-ci](https://github.com/acikgozb/local-ci)

---

## Decisions, Decisions

We need to have a service for our CI checks, and a pipeline to test. What about the tech stack?

My choices were quite straightforward:

The service itself is really simple and the type of service (API, serverless, scheduler, etc.) doesn't matter that much.
It just needs to have one test and a feature to be tested.
So, for the language, I choose **Golang**:

- It's really fun to play, I don't know why.
- It's pretty dead simple to get it up and running, you just have an entrypoint and a module state and that's it, which is perfect for this project.
- It's tooling is amazing to work with.

For the pipeline, my weapon of choice is **Jenkins**:

- It is by far the most commonly used tool in the industry, we can't deny it.
- I already actively use Github Actions at where I work, so I wanted to try something else to add a little bit more challenge.

## More About the "Goal"

The goal of this project is to create an environment where you can locally check the CI steps of a pipeline.
Normally, a pipeline can be quite complex based on the actual need, so in order to make this project manageable I went with a couple of requirements:

- It should be possible to **containerize the entire build environment**, to make it reproducable across different hosts.
- It is forbidden to install any language runtime on the Jenkins agent other than Java. The agent should stay as clean as possible.
- The pipeline should spin up **ephemeral containers** to execute the CI steps, and then remove them when there is no error.
- If there is an error, it should be visible to the output and developers should be able to exec into the build container to troubleshoot the issue.
- **Any container image** can be used by the pipeline.

---

Please refer to the [repository](https://github.com/acikgozb/local-ci) for installation, usage, and more.

If you've tried to run this project, I would love to hear your experience (good or bad) 🎉

Thank you for reading!

`:wq`
