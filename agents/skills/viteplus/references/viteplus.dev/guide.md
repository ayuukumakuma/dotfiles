---
title: "Getting Started | The Unified Toolchain for the Web"
source_url: "https://viteplus.dev/guide"
fetched_at: "2026-03-31T02:50:28.336963+00:00"
---



# Getting Started [​](https://viteplus.dev/guide.html#getting-started)

Vite+ is the unified toolchain and entry point for web development. It manages your runtime, package manager, and frontend toolchain in one place by combining [Vite](https://vite.dev/), [Vitest](https://vitest.dev/), [Oxlint](https://oxc.rs/docs/guide/usage/linter.html), [Oxfmt](https://oxc.rs/docs/guide/usage/formatter.html), [Rolldown](https://rolldown.rs/), [tsdown](https://tsdown.dev/), and [Vite Task](https://github.com/voidzero-dev/vite-task).

Vite+ ships in two parts: `vp`, the global command-line tool, and `vite-plus`, the local package installed in each project. If you already have a Vite project, use [`vp migrate`](https://viteplus.dev/guide/migrate.html) to migrate it to Vite+, or paste our [migration prompt](https://viteplus.dev/guide/migrate.html#migration-prompt) into your coding agent.

## Install `vp` [​](https://viteplus.dev/guide.html#install-vp)

### macOS / Linux [​](https://viteplus.dev/guide.html#macos-linux)

bash

```
curl -fsSL https://vite.plus | bash
```

### Windows [​](https://viteplus.dev/guide.html#windows)

powershell

```
irm https://vite.plus/ps1 | iex
```

After installation, open a new shell and run:

bash

```
vp help
```

INFO

Vite+ will manage your global Node.js runtime and package manager. If you'd like to opt out of this behavior, run `vp env off`. If you realize Vite+ is not for you, type `vp implode`, but please [share your feedback with us](https://discord.gg/cAnsqHh5PX).

Using a minor platform (CPU architecture, OS) ?

Prebuilt binaries are distributed for the following platforms (grouped by [Node.js v24 platform support tier](https://github.com/nodejs/node/blob/v24.x/BUILDING.md#platform-list)):

* Tier 1
  + Linux x64 glibc (`x86_64-unknown-linux-gnu`)
  + Linux arm64 glibc (`aarch64-unknown-linux-gnu`)
  + Windows x64 (`x86_64-pc-windows-msvc`)
  + macOS x64 (`x86_64-apple-darwin`)
  + macOS arm64 (`aarch64-apple-darwin`)
* Tier 2
  + Windows arm64 (`aarch64-pc-windows-msvc`)
* Experimental
  + Linux x64 musl (`x86_64-unknown-linux-musl`)
* Other
  + Linux arm64 musl (`aarch64-unknown-linux-musl`)

If a prebuilt binary is not available for your platform, installation will fail with an error.

On Alpine Linux (musl), you need to install `libstdc++` before using Vite+:

sh

```
apk add libstdc++
```

This is required because the managed [unofficial-builds](https://unofficial-builds.nodejs.org/) Node.js runtime depends on the GNU C++ standard library.

## Quick Start [​](https://viteplus.dev/guide.html#quick-start)

Create a project, install dependencies, and use the default commands:

bash

```
vp create # Create a new project
vp install # Install dependencies
vp dev # Start the dev server
vp check # Format, lint, type-check
vp test # Run JavaScript tests
vp build # Build for production
```

You can also just run `vp` on its own and use the interactive command line.

## Core Commands [​](https://viteplus.dev/guide.html#core-commands)

Vite+ can handle the entire local frontend development cycle from starting a project, developing it, checking & testing, and building it for production.

### Start [​](https://viteplus.dev/guide.html#start)

* [`vp create`](https://viteplus.dev/guide/create.html) creates new apps, packages, and monorepos.
* [`vp migrate`](https://viteplus.dev/guide/migrate.html) moves existing projects onto Vite+.
* [`vp config`](https://viteplus.dev/guide/commit-hooks.html) configures commit hooks and agent integration.
* [`vp staged`](https://viteplus.dev/guide/commit-hooks.html) runs checks on staged files.
* [`vp install`](https://viteplus.dev/guide/install.html) installs dependencies with the right package manager.
* [`vp env`](https://viteplus.dev/guide/env.html) manages Node.js versions.

### Develop [​](https://viteplus.dev/guide.html#develop)

* [`vp dev`](https://viteplus.dev/guide/dev.html) starts the dev server powered by Vite.
* [`vp check`](https://viteplus.dev/guide/check.html) runs format, lint, and type checks together.
* [`vp lint`](https://viteplus.dev/guide/lint.html), [`vp fmt`](https://viteplus.dev/guide/fmt.html), and [`vp test`](https://viteplus.dev/guide/test.html) let you run those tools directly.

### Execute [​](https://viteplus.dev/guide.html#execute)

* [`vp run`](https://viteplus.dev/guide/run.html) runs tasks across workspaces with caching.
* [`vp cache`](https://viteplus.dev/guide/cache.html) clears task cache entries.
* [`vpx`](https://viteplus.dev/guide/vpx.html) runs binaries globally.
* [`vp exec`](https://viteplus.dev/guide/vpx.html) runs local project binaries.
* [`vp dlx`](https://viteplus.dev/guide/vpx.html) runs package binaries without adding them as dependencies.

### Build [​](https://viteplus.dev/guide.html#build)

* [`vp build`](https://viteplus.dev/guide/build.html) builds apps.
* [`vp pack`](https://viteplus.dev/guide/pack.html) builds libraries or standalone artifacts.
* [`vp preview`](https://viteplus.dev/guide/build.html) previews the production build locally.

### Manage Dependencies [​](https://viteplus.dev/guide.html#manage-dependencies)

* [`vp add`](https://viteplus.dev/guide/install.html), [`vp remove`](https://viteplus.dev/guide/install.html), [`vp update`](https://viteplus.dev/guide/install.html), [`vp dedupe`](https://viteplus.dev/guide/install.html), [`vp outdated`](https://viteplus.dev/guide/install.html), [`vp why`](https://viteplus.dev/guide/install.html), and [`vp info`](https://viteplus.dev/guide/install.html) wrap package-manager workflows.
* [`vp pm <command>`](https://viteplus.dev/guide/install.html) calls other package manager commands directly.

### Maintain [​](https://viteplus.dev/guide.html#maintain)

* [`vp upgrade`](https://viteplus.dev/guide/upgrade.html) updates the `vp` installation itself.
* [`vp implode`](https://viteplus.dev/guide/implode.html) removes `vp` and related Vite+ data from your machine.

INFO

Vite+ ships with many predefined commands such as `vp build`, `vp test`, and `vp dev`. These commands are built in and cannot be changed. If you want to run a command from your `package.json` scripts, use `vp run <command>`.

[Learn more about `vp run`.](https://viteplus.dev/guide/run.html)
