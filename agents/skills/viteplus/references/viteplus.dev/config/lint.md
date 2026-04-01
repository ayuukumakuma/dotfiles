---
title: "Lint Config | The Unified Toolchain for the Web"
source_url: "https://viteplus.dev/config/lint"
fetched_at: "2026-03-31T02:50:28.336963+00:00"
---



# Lint Config [​](https://viteplus.dev/config/lint.html#lint-config)

`vp lint` and `vp check` read Oxlint settings from the `lint` block in `vite.config.ts`. See [Oxlint's configuration](https://oxc.rs/docs/guide/usage/linter/config.html) for details.

## Example [​](https://viteplus.dev/config/lint.html#example)

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
    rules: {
      'no-console': ['error', { allow: ['error'] }],
    },
  },
});
```

We recommend enabling both `options.typeAware` and `options.typeCheck` so `vp lint` and `vp check` can use the full type-aware path.
