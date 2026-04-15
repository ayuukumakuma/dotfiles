---
title: "Lint | The Unified Toolchain for the Web"
source_url: "https://viteplus.dev/guide/lint"
fetched_at: "2026-03-31T02:50:28.336963+00:00"
---



# Lint [​](https://viteplus.dev/guide/lint.html#lint)

`vp lint` lints code with Oxlint.

## Overview [​](https://viteplus.dev/guide/lint.html#overview)

`vp lint` is built on [Oxlint](https://oxc.rs/docs/guide/usage/linter.html), the Oxc linter. Oxlint is designed as a fast replacement for ESLint for most frontend projects and ships with built-in support for core ESLint rules and many popular community rules.

Use `vp lint` to lint your project, and `vp check` to format, lint and type-check all at once.

## Usage [​](https://viteplus.dev/guide/lint.html#usage)

bash

```
vp lint
vp lint --fix
vp lint --type-aware
```

## Configuration [​](https://viteplus.dev/guide/lint.html#configuration)

Put lint configuration directly in the `lint` block in `vite.config.ts` so all your configuration stays in one place. We do not recommend using `oxlint.config.ts` or `.oxlintrc.json` with Vite+.

For the upstream rule set, options, and compatibility details, see the [Oxlint docs](https://oxc.rs/docs/guide/usage/linter.html).

ts

```
import { defineConfig } from 'vite-plus';

export default defineConfig({
  lint: {
    ignorePatterns: ['dist/**'],
    options: {
      typeAware: true,
      typeCheck: true,
    },
  },
});
```

## Type-Aware Linting [​](https://viteplus.dev/guide/lint.html#type-aware-linting)

We recommend enabling both `typeAware` and `typeCheck` in the `lint` block:

* `typeAware: true` enables rules that require TypeScript type information
* `typeCheck: true` enables full type checking during linting

This path is powered by [tsgolint](https://github.com/oxc-project/tsgolint) on top of the TypeScript Go toolchain. It gives Oxlint access to type information and allows type checking directly via `vp lint` and `vp check`.

## JS Plugins [​](https://viteplus.dev/guide/lint.html#js-plugins)

If you are migrating from ESLint and still depend on a few critical JavaScript-based ESLint plugins, Oxlint has [JS plugin support](https://oxc.rs/docs/guide/usage/linter/js-plugins) that can help you keep those plugins running while you complete the migration.
