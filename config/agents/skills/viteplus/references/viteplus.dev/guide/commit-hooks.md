---
title: "Commit Hooks | The Unified Toolchain for the Web"
source_url: "https://viteplus.dev/guide/commit-hooks"
fetched_at: "2026-03-31T02:50:28.336963+00:00"
---



# Commit Hooks [​](https://viteplus.dev/guide/commit-hooks.html#commit-hooks)

Use `vp config` to install commit hooks, and `vp staged` to run checks on staged files.

## Overview [​](https://viteplus.dev/guide/commit-hooks.html#overview)

Vite+ supports commit hooks and staged-file checks without additional tooling.

Use:

* `vp config` to set up project hooks and related integrations
* `vp staged` to run checks against the files currently staged in Git

If you use [`vp create`](https://viteplus.dev/guide/create.html) or [`vp migrate`](https://viteplus.dev/guide/migrate.html), Vite+ prompts you to set this up for your project automatically.

## Commands [​](https://viteplus.dev/guide/commit-hooks.html#commands)

### `vp config` [​](https://viteplus.dev/guide/commit-hooks.html#vp-config)

`vp config` configures Vite+ for the current project. It installs Git hooks, sets up the hook directory, and can also handle related project integration such as agent setup. By default, hooks are written to `.vite-hooks`:

bash

```
vp config
vp config --hooks-dir .vite-hooks
```

### `vp staged` [​](https://viteplus.dev/guide/commit-hooks.html#vp-staged)

`vp staged` runs staged-file checks using the `staged` config from `vite.config.ts`. If you set up Vite+ to handle your commit hooks, it will automatically run when you commit your local changes.

bash

```
vp staged
vp staged --verbose
vp staged --fail-on-changes
```

## Configuration [​](https://viteplus.dev/guide/commit-hooks.html#configuration)

Define staged-file checks in the `staged` block in `vite.config.ts`:

ts

```
import { defineConfig } from 'vite-plus';

export default defineConfig({
  staged: {
    '*.{js,ts,tsx,vue,svelte}': 'vp check --fix',
  },
});
```

This is the default Vite+ approach and should replace separate `lint-staged` configuration in most projects. Because `vp staged` reads from `vite.config.ts`, your staged-file checks stay in the same place as your lint, format, test, build, and task-runner config.
