---
title: "Check | The Unified Toolchain for the Web"
source_url: "https://viteplus.dev/guide/check"
fetched_at: "2026-03-31T02:50:28.336963+00:00"
---



# Check [​](https://viteplus.dev/guide/check.html#check)

`vp check` runs format, lint, and type checks together.

## Overview [​](https://viteplus.dev/guide/check.html#overview)

`vp check` is the default command for fast static checks in Vite+. It brings together formatting through [Oxfmt](https://oxc.rs/docs/guide/usage/formatter.html), linting through [Oxlint](https://oxc.rs/docs/guide/usage/linter.html), and TypeScript type checks through [tsgolint](https://github.com/oxc-project/tsgolint). By merging all of these tasks into a single command, `vp check` is faster than running formatting, linting, and type checking as separate tools in separate commands.

When `typeCheck` is enabled in the `lint.options` block in `vite.config.ts`, `vp check` also runs TypeScript type checks through the Oxlint type-aware path powered by the TypeScript Go toolchain and [tsgolint](https://github.com/oxc-project/tsgolint). `vp create` and `vp migrate` enable both `typeAware` and `typeCheck` by default.

We recommend turning `typeCheck` on so `vp check` becomes the single command for static checks during development.

## Usage [​](https://viteplus.dev/guide/check.html#usage)

bash

```
vp check
vp check --fix # Format and run autofixers.
```

## Configuration [​](https://viteplus.dev/guide/check.html#configuration)

`vp check` uses the same configuration you already define for linting and formatting:

* [`lint`](https://viteplus.dev/guide/lint.html#configuration) block in `vite.config.ts`
* [`fmt`](https://viteplus.dev/guide/fmt.html#configuration) block in `vite.config.ts`
* TypeScript project structure and tsconfig files for type-aware linting

Recommended base `lint` config:

ts

```
import { defineConfig } from 'vite-plus';

export default defineConfig({
  lint: {
    options: {
      typeAware: true,
      typeCheck: true,
    },
  },
});
```
