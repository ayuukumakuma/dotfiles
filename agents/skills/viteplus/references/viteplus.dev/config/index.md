---
title: "Configuring Vite+ | The Unified Toolchain for the Web"
source_url: "https://viteplus.dev/config/index"
fetched_at: "2026-03-31T02:50:28.336963+00:00"
---



# Configuring Vite+ [​](https://viteplus.dev/config/index.html#configuring-vite)

Vite+ keeps project configuration in one place: `vite.config.ts`, allowing you to consolidate many top-level configuration files in a single file. You can keep using your Vite configuration such as `server` or `build`, and add Vite+ blocks for the rest of your workflow:

ts

```
import { defineConfig } from 'vite-plus';

export default defineConfig({
  server: {},
  build: {},
  preview: {},

  test: {},
  lint: {},
  fmt: {},
  run: {},
  pack: {},
  staged: {},
});
```

## Vite+ Specific Configuration [​](https://viteplus.dev/config/index.html#vite-specific-configuration)

Vite+ extends the basic Vite configuration with these additions:

* [`lint`](https://viteplus.dev/config/lint.html) for Oxlint
* [`fmt`](https://viteplus.dev/config/fmt.html) for Oxfmt
* [`test`](https://viteplus.dev/config/test.html) for Vitest
* [`run`](https://viteplus.dev/config/run.html) for Vite Task
* [`pack`](https://viteplus.dev/config/pack.html) for tsdown
* [`staged`](https://viteplus.dev/config/staged.html) for staged-file checks
