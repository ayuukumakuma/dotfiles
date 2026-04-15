---
title: "Toolchains | Toolchains"
source_url: "https://zed.dev/docs/toolchains"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [Toolchains](https://zed.dev/docs/toolchains.html#toolchains)

Zed projects include a toolchain selector that lets you choose the tools used for a language in the current project.

For example, in Python projects, virtual environments define dependencies and interpreter paths. Language servers need that environment to analyze your code correctly.
With the toolchain selector, you can pick the right virtual environment from a dropdown instead of configuring language server paths manually.

You can even select different toolchains for different subprojects within your Zed project. A definition of a subproject is language-specific.
In collaborative scenarios, only the project owner can see and modify an active toolchain.

In [remote projects](https://zed.dev/docs/remote-development.html), you can use the toolchain selector to control the active toolchain on the SSH host. When [sharing your project](https://zed.dev/docs/collaboration/overview.html), the toolchain selector is not available to guests.

## [Why do we need toolchains?](https://zed.dev/docs/toolchains.html#why-do-we-need-toolchains)

The active toolchain is used when launching language servers. Without the correct toolchain, language servers may fail to resolve dependencies, and features like "Go to Definition" or "Code Completions" may not work.

The active toolchain is also relevant when launching a shell in the terminal panel: some toolchains provide "activation scripts" for shells, which make those toolchains available in the shell environment for your convenience. Zed will run these activation scripts automatically when you create a new terminal.

This also applies to [tasks](https://zed.dev/docs/tasks.html). Zed runs tasks as if you opened a new terminal tab and ran the task command yourself, so task execution is also affected by the active toolchain and its activation script.

## [Selecting toolchains](https://zed.dev/docs/toolchains.html#selecting-toolchains)

The active toolchain (if there is one) is shown in the status bar on the right. Click it to open the toolchain selector, or run the command palette action (`toolchain: select`).

Zed will automatically infer a set of toolchains to choose from based on the project you're working with. A default will also be selected on your behalf on a best-effort basis when you open a project for the first time.

Toolchain selection applies to the current subproject, which may be your whole project or just one part of it. In a monorepo, for example, you might choose a different toolchain for each subproject.

## [Adding toolchains manually](https://zed.dev/docs/toolchains.html#adding-toolchains-manually)

If automatic detection does not suffice for you, you can add toolchains manually. To do that, click on the "Add toolchain" button in the toolchain selector. From there you can provide a path to a toolchain and set a name of your liking for it.

[Configuring Languages](https://zed.dev/docs/configuring-languages.html "Configuring Languages")
[Semantic Tokens](https://zed.dev/docs/semantic-tokens.html "Semantic Tokens")
