---
title: "Test Config | The Unified Toolchain for the Web"
source_url: "https://viteplus.dev/config/test"
fetched_at: "2026-03-31T02:50:28.336963+00:00"
---



# Test Config [​](https://viteplus.dev/config/test.html#test-config)

`vp test` reads Vitest settings from the `test` block in `vite.config.ts`. See [Vitest's configuration](https://vitest.dev/config/) for details.

## Example [​](https://viteplus.dev/config/test.html#example)

ts

```
import { defineConfig } from 'vite-plus';

export default defineConfig({
  test: {
    include: ['src/**/*.test.ts'],
    coverage: {
      reporter: ['text', 'html'],
    },
  },
});
```
