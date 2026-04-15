---
title: "Build Config | The Unified Toolchain for the Web"
source_url: "https://viteplus.dev/config/build"
fetched_at: "2026-03-31T02:50:28.336963+00:00"
---



# Build Config [​](https://viteplus.dev/config/build.html#build-config)

`vp dev`, `vp build`, and `vp preview` use the standard [Vite configuration](https://vite.dev/config/), including [plugins](https://vite.dev/guide/using-plugins), [aliases](https://vite.dev/config/shared-options#resolve-alias), [`server`](https://vite.dev/config/server-options), [`build`](https://vite.dev/config/build-options) and [`preview`](https://vite.dev/config/preview-options) fields.

## Example [​](https://viteplus.dev/config/build.html#example)

ts

```
import { defineConfig } from 'vite-plus';

export default defineConfig({
  server: {
    port: 3000,
  },
  build: {
    sourcemap: true,
  },
  preview: {
    port: 4173,
  },
});
```
