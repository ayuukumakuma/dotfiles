---
title: "OpenTofu | OpenTofu"
source_url: "https://zed.dev/docs/languages/opentofu"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [OpenTofu](https://zed.dev/docs/languages/opentofu.html#opentofu)

OpenTofu support is available through the [OpenTofu extension](https://github.com/ashpool37/zed-extension-opentofu).

* Tree-sitter: [MichaHoffmann/tree-sitter-hcl](https://github.com/MichaHoffmann/tree-sitter-hcl)
* Language Server: [opentofu/tofu-ls](https://github.com/opentofu/tofu-ls)

## [Configuration](https://zed.dev/docs/languages/opentofu.html#configuration)

To automatically use the OpenTofu extension and language server when editing `.tf` and `.tfvars` files,
either uninstall the Terraform extension or add this to your settings.json:

```
"file_types": {
  "OpenTofu": ["tf"],
  "OpenTofu Vars": ["tfvars"]
},
```

See the [full list of server settings here](https://github.com/opentofu/tofu-ls/blob/main/docs/SETTINGS.md).

[OCaml](https://zed.dev/docs/languages/ocaml.html "OCaml")
[PHP](https://zed.dev/docs/languages/php.html "PHP")
