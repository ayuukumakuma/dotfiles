---
title: "Format | The Unified Toolchain for the Web"
source_url: "https://viteplus.dev/guide/fmt"
fetched_at: "2026-03-31T02:50:28.336963+00:00"
---



# Format [​](https://viteplus.dev/guide/fmt.html#format)

`vp fmt` formats code with Oxfmt.

## Overview [​](https://viteplus.dev/guide/fmt.html#overview)

`vp fmt` is built on [Oxfmt](https://oxc.rs/docs/guide/usage/formatter.html), the Oxc formatter. Oxfmt has full Prettier compatibility and is designed as a fast drop-in replacement for Prettier.

Use `vp fmt` to format your project, and `vp check` to format, lint and type-check all at once.

## Usage [​](https://viteplus.dev/guide/fmt.html#usage)

bash

```
vp fmt
vp fmt --check
vp fmt . --write
```

## Configuration [​](https://viteplus.dev/guide/fmt.html#configuration)

Put formatting configuration directly in the `fmt` block in `vite.config.ts` so all your configuration stays in one place. We do not recommend using `.oxfmtrc.json` with Vite+.

For editors, point the formatter config path at `./vite.config.ts` so format-on-save uses the same `fmt` block:

json

```
{
  "oxc.fmt.configPath": "./vite.config.ts"
}
```

For the upstream formatter behavior and configuration reference, see the [Oxfmt docs](https://oxc.rs/docs/guide/usage/formatter.html).

ts

```
import { defineConfig } from 'vite-plus';

export default defineConfig({
  fmt: {
    singleQuote: true,
  },
});
```
