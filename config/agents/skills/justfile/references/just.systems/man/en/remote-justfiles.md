---
title: "Remote Justfiles - Just Programmer's Manual"
source_url: "https://just.systems/man/en/remote-justfiles"
fetched_at: "2026-03-31T07:58:30.733796+00:00"
---



### [Remote Justfiles](https://just.systems/man/en/remote-justfiles.html#remote-justfiles)

If you wish to include a `mod` or `import` source file in many `justfiles`
without needing to duplicate it, you can use an optional `mod` or `import`,
along with a recipe to fetch the module source:

```
import? 'foo.just'

fetch:
  curl https://raw.githubusercontent.com/casey/just/master/justfile > foo.just
```

Given the above `justfile`, after running `just fetch`, the recipes in
`foo.just` will be available.
