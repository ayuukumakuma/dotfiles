---
title: "Pack Config | The Unified Toolchain for the Web"
source_url: "https://viteplus.dev/config/pack"
fetched_at: "2026-03-31T02:50:28.336963+00:00"
---



# Pack Config [​](https://viteplus.dev/config/pack.html#pack-config)

`vp pack` reads tsdown settings from the `pack` block in `vite.config.ts`. See [tsdown's configuration](https://tsdown.dev/options/config-file) for details.

## Example [​](https://viteplus.dev/config/pack.html#example)

ts

```
import { defineConfig } from 'vite-plus';

export default defineConfig({
  pack: {
    dts: true,
    format: ['esm', 'cjs'],
    sourcemap: true,
  },
});
```
