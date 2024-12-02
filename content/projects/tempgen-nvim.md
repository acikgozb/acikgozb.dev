---
date: "2024-12-02T15:17:28+03:00"
draft: true
title: "tempgen.nvim"
summary: "Bootstrap your file the way you want."
---

My favorite aspect of Vim/Neovim is the fact that you can take the full advantage of the shell itself, and create little scripts that enhances your own development workflow.

`tempgen.nvim` is truly an example of this.

- Concept: _Automation_.
- Goal: _Better file management_.
- Primary tool(s): _Lua, Neovim_.
- Repository: [tempgen.nvim](https://github.com/acikgozb/tempgen.nvim)

---

### What is `tempgen.nvim` ?

This project is a little helper tool that allows you to define **templates**, which then you can use to create your files the way you want.

### Why Should You Use This Project?

This project is only used for scaffolding files and nothing more, so it's perfect for scenarios where you don't want to write the whole "skeleton" of the file again, just to get started on your work.

Regarding the use cases, the only limit is your imagination.
If you see a pattern between the projects you develop, you can extract the main idea (aka. create a template) and then automate your future work.

A couple of examples to start the train of thoughts:

#### READMEs

You can have a basic template for all README's, or individual README's for different project types.

#### Configuration Files

For each tool you are using, you can create basic templates to kickstart your configurations.
For example, I happen to find myself using this plugin a lot to create `Ansible` playbooks based on my preferences.

#### Language Configuration

If you have a favorite setup for a language (e.g **linting**, **project configuration**) and it is not possible to create it via a CLI tool, you can create templates representing your setup and automate your language configuration.

Also, if you find yourself updating 3rd party CLI generated files a little bit every time you create them, you can automate this process as well.

#### Project Code

This one is a little bit stretch, but still possible.

If you discover a nice structure and want to use it in your future projects, automate it away!

### Isn’t There a Better Tool for This?

**Short answer**: I have absolutely no idea. I haven't searched for any existing tools.

**Long answer**: I implemented this project because:

- My needs were pretty simple,
- I wanted to dive into developing a Neovim plugin instead of consuming another one to see how the experience is.

I acknowledge the fact that the tool is not fully fledged out and there is a nice room for improvement.
That is why I added the [TODO section](https://github.com/acikgozb/tempgen.nvim?tab=readme-ov-file#todo) to the repository.

---

Please refer to the [repository](https://github.com/acikgozb/tempgen.nvim) for the demo, installation, and more.

If you've tried this tool, I would love to hear your experience (good or bad) 🎉

Thank you for reading!

`:wq`
