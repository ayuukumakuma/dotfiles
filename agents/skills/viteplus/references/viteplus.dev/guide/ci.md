---
title: "Continuous Integration | The Unified Toolchain for the Web"
source_url: "https://viteplus.dev/guide/ci"
fetched_at: "2026-03-31T02:50:28.336963+00:00"
---



# Continuous Integration [​](https://viteplus.dev/guide/ci.html#continuous-integration)

You can use `voidzero-dev/setup-vp` to use Vite+ in CI environments.

## Overview [​](https://viteplus.dev/guide/ci.html#overview)

For GitHub Actions, the recommended setup is [`voidzero-dev/setup-vp`](https://github.com/voidzero-dev/setup-vp). It installs Vite+, sets up the required Node.js version and package manager, and can cache package installs automatically.

That means you usually do not need separate `setup-node`, package-manager setup, and manual dependency-cache steps in your workflow.

## GitHub Actions [​](https://viteplus.dev/guide/ci.html#github-actions)

yaml

```
- uses: voidzero-dev/setup-vp@v1
  with:
    node-version: '22'
    cache: true
- run: vp install
- run: vp check
- run: vp test
- run: vp build
```

With `cache: true`, `setup-vp` handles dependency caching for you automatically.

## Simplifying Existing Workflows [​](https://viteplus.dev/guide/ci.html#simplifying-existing-workflows)

If you are migrating an existing GitHub Actions workflow, you can often replace large blocks of Node, package-manager, and cache setup with a single `setup-vp` step.

#### Before: [​](https://viteplus.dev/guide/ci.html#before)

yaml

```
- uses: actions/setup-node@v4
  with:
    node-version: '24'

- uses: pnpm/action-setup@v4
  with:
    version: 10

- name: Get pnpm store path
  run: pnpm store path

- uses: actions/cache@v4
  with:
    path: ~/.pnpm-store
    key: ${{ runner.os }}-pnpm-${{ hashFiles('pnpm-lock.yaml') }}

- run: pnpm install && pnpm dev:setup
- run: pnpm test
```

#### After: [​](https://viteplus.dev/guide/ci.html#after)

yaml

```
- uses: voidzero-dev/setup-vp@v1
  with:
    node-version: '24'
    cache: true

- run: vp install && vp run dev:setup
- run: vp check
- run: vp test
```
