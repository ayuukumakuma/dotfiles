---
title: "Format Config | The Unified Toolchain for the Web"
source_url: "https://viteplus.dev/config/fmt"
fetched_at: "2026-03-31T02:50:28.336963+00:00"
---



# Format Config [​](https://viteplus.dev/config/fmt.html#format-config)

`vp fmt` and `vp check` read Oxfmt settings from the `fmt` block in `vite.config.ts`. See [Oxfmt's configuration](https://oxc.rs/docs/guide/usage/formatter/config.html) for details.

## Example [​](https://viteplus.dev/config/fmt.html#example)

ts

```
import { defineConfig } from 'vite-plus';

export default defineConfig({
  fmt: {
    ignorePatterns: ['dist/**'],
    singleQuote: true,
    semi: true,
    sortPackageJson: true,
  },
});
```
