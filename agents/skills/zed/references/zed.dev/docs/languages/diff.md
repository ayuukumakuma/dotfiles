---
title: "Diff | Diff"
source_url: "https://zed.dev/docs/languages/diff"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [Diff](https://zed.dev/docs/languages/diff.html#diff)

Diff support is available natively in Zed.

* Tree-sitter: [zed-industries/the-mikedavis/tree-sitter-diff](https://github.com/the-mikedavis/tree-sitter-diff)

## [Configuration](https://zed.dev/docs/languages/diff.html#configuration)

Zed will not attempt to format diff files and has [`remove_trailing_whitespace_on_save`](https://zed.dev/docs/reference/all-settings.html#remove-trailing-whitespace-on-save) and [`ensure-final-newline-on-save`](https://zed.dev/docs/reference/all-settings.html#ensure-final-newline-on-save) set to false.

Zed will automatically recognize files with `patch` and `diff` extensions as Diff files. To recognize other extensions, add them to `file_types` in your Zed settings.json:

```
  "file_types": {
    "Diff": ["dif"]
  },
```

[Deno](https://zed.dev/docs/languages/deno.html "Deno")
[Docker](https://zed.dev/docs/languages/docker.html "Docker")
