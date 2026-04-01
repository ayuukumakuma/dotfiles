---
title: "Task Caching | The Unified Toolchain for the Web"
source_url: "https://viteplus.dev/guide/cache"
fetched_at: "2026-03-31T02:50:28.336963+00:00"
---



# Task Caching [​](https://viteplus.dev/guide/cache.html#task-caching)

Vite Task can automatically track dependencies and cache tasks run through `vp run`.

## Overview [​](https://viteplus.dev/guide/cache.html#overview)

When a task runs successfully (exit code 0), its terminal output (stdout/stderr) is saved. On the next run, Vite Task checks if anything changed:

1. **Arguments:** did the [additional arguments](https://viteplus.dev/guide/run.html#additional-arguments) passed to the task change?
2. **Environment variables:** did any [fingerprinted env vars](https://viteplus.dev/config/run.html#env) change?
3. **Input files:** did any file that the command reads change?

If everything matches, the cached output is replayed instantly, and the command does not run.

INFO

Currently, only terminal output is cached and replayed. Output files such as `dist/` are not cached. If you delete them, use `--no-cache` to force a re-run. Output file caching is planned for a future release.

When a cache miss occurs, Vite Task tells you exactly why:

```
$ vp lint ✗ cache miss: 'src/utils.ts' modified, executing
$ vp build ✗ cache miss: env changed, executing
$ vp test ✗ cache miss: args changed, executing
```

## When Is Caching Enabled? [​](https://viteplus.dev/guide/cache.html#when-is-caching-enabled)

A command run by `vp run` is either a **task** defined in `vite.config.ts` or a **script** defined in `package.json`. Task names and script names cannot overlap. By default, **tasks are cached and scripts are not.**

There are three types of controls for task caching, in order:

### 1. Per-task `cache: false` [​](https://viteplus.dev/guide/cache.html#_1-per-task-cache-false)

A task can set [`cache: false`](https://viteplus.dev/config/run.html#cache) to opt out. This cannot be overridden by any other cache control flag.

### 2. CLI flags [​](https://viteplus.dev/guide/cache.html#_2-cli-flags)

`--no-cache` disables caching for everything. `--cache` enables caching for both tasks and scripts, which is equivalent to setting [`run.cache: true`](https://viteplus.dev/config/run.html#run-cache) for that invocation.

### 3. Workspace config [​](https://viteplus.dev/guide/cache.html#_3-workspace-config)

The [`run.cache`](https://viteplus.dev/config/run.html#run-cache) option in your root `vite.config.ts` controls the default for each category:

| Setting | Default | Effect |
| --- | --- | --- |
| `cache.tasks` | `true` | Cache tasks defined in `vite.config.ts` |
| `cache.scripts` | `false` | Cache `package.json` scripts |

## Automatic File Tracking [​](https://viteplus.dev/guide/cache.html#automatic-file-tracking)

Vite Task tracks which files each command reads during execution. When a task runs, it records which files the process opens, such as your `.ts` source files, `vite.config.ts`, and `package.json`, and records their content hashes. On the next run, it re-checks those hashes to determine if anything changed.

This means caching works out of the box for most commands without any configuration. Vite Task also records:

* **Missing files:** if a command probes for a file that doesn't exist, such as `utils.ts` during module resolution, creating that file later correctly invalidates the cache.
* **Directory listings:** if a command scans a directory, such as a test runner looking for `*.test.ts`, adding or removing files in that directory invalidates the cache.

### Avoiding Overly Broad Input Tracking [​](https://viteplus.dev/guide/cache.html#avoiding-overly-broad-input-tracking)

Automatic tracking can sometimes include more files than necessary, causing unnecessary cache misses:

* **Tool cache files:** some tools maintain their own cache, such as TypeScript's `.tsbuildinfo` or Cargo's `target/`. These files may change between runs even when your source code has not, causing unnecessary cache invalidation.
* **Directory listings:** when a command scans a directory, such as when globbing for `**/*.js`, Vite Task sees the directory read but not the glob pattern. Any file added or removed in that directory, even unrelated ones, invalidates the cache.

Use the [`input`](https://viteplus.dev/config/run.html#input) option to exclude files or to replace automatic tracking with explicit file patterns:

ts

```
tasks: {
  build: {
    command: 'tsc',
    input: [{ auto: true }, '!**/*.tsbuildinfo'],
  },
}
```

## Environment Variables [​](https://viteplus.dev/guide/cache.html#environment-variables)

By default, tasks run in a clean environment. Only a small set of common variables, such as `PATH`, `HOME`, and `CI`, are passed through. Other environment variables are neither visible to the task nor included in the cache fingerprint.

To add an environment variable to the cache key, add it to [`env`](https://viteplus.dev/config/run.html#env). Changing its value then invalidates the cache:

ts

```
tasks: {
  build: {
    command: 'webpack --mode production',
    env: ['NODE_ENV'],
  },
}
```

To pass a variable to the task **without** affecting cache behavior, use [`untrackedEnv`](https://viteplus.dev/config/run.html#untracked-env). This is useful for variables like `CI` or `GITHUB_ACTIONS` that should be available in the task, but do not generally affect caching behavior.

See [Run Config](https://viteplus.dev/config/run.html#env) for details on wildcard patterns and the full list of automatically passed-through variables.

## Cache Sharing [​](https://viteplus.dev/guide/cache.html#cache-sharing)

Vite Task's cache is content-based. If two tasks run the same command with the same inputs, they share the cache entry. This happens naturally when multiple tasks include a common step, either as standalone tasks or as parts of [compound commands](https://viteplus.dev/guide/run.html#compound-commands):

json

```
{
  "scripts": {
    "check": "vp lint && vp build",
    "release": "vp lint && deploy-script"
  }
}
```

With caching enabled, for example through `--cache` or [`run.cache.scripts: true`](https://viteplus.dev/config/run.html#run-cache), running `check` first means the `vp lint` step in `release` is an instant cache hit, since both run the same command against the same files.

## Cache Commands [​](https://viteplus.dev/guide/cache.html#cache-commands)

Use `vp cache clean` when you need to clear cached task results:

bash

```
vp cache clean
```

The task cache is stored in `node_modules/.vite/task-cache` at the project root. `vp cache clean` deletes that cache directory.
