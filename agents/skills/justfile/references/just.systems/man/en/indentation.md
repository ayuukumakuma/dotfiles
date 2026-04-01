---
title: "Indentation - Just Programmer's Manual"
source_url: "https://just.systems/man/en/indentation"
fetched_at: "2026-03-31T07:58:30.733796+00:00"
---



### [Indentation](https://just.systems/man/en/indentation.html#indentation)

Recipe lines can be indented with spaces or tabs, but not a mix of both. All of
a recipe’s lines must have the same type of indentation, but different recipes
in the same `justfile` may use different indentation.

Each recipe must be indented at least one level from the `recipe-name` but
after that may be further indented.

Here’s a justfile with a recipe indented with spaces, represented as `·`, and
tabs, represented as `→`.

```
set windows-shell := ["pwsh", "-NoLogo", "-NoProfileLoadTime", "-Command"]

set ignore-comments

list-space directory:
··#!pwsh
··foreach ($item in $(Get-ChildItem {{directory}} )) {
····echo $item.Name
··}
··echo ""

# indentation nesting works even when newlines are escaped
list-tab directory:
→ @foreach ($item in $(Get-ChildItem {{directory}} )) { \
→ → echo $item.Name \
→ }
→ @echo ""
```

```
PS > just list-space ~
Desktop
Documents
Downloads

PS > just list-tab ~
Desktop
Documents
Downloads
```
