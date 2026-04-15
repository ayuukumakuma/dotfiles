---
title: "Staged Config | The Unified Toolchain for the Web"
source_url: "https://viteplus.dev/config/staged"
fetched_at: "2026-03-31T02:50:28.336963+00:00"
---



# Staged Config [​](https://viteplus.dev/config/staged.html#staged-config)

`vp staged` and `vp config` read staged-file rules from the `staged` block in `vite.config.ts`. See the [Commit hooks guide](https://viteplus.dev/guide/commit-hooks.html).

## Example [​](https://viteplus.dev/config/staged.html#example)

ts

```
import { defineConfig } from 'vite-plus';

export default defineConfig({
  staged: {
    '*.{js,ts,tsx,vue,svelte}': 'vp check --fix',
  },
});
```
