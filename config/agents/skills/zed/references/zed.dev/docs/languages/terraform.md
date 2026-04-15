---
title: "Terraform | Terraform"
source_url: "https://zed.dev/docs/languages/terraform"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [Terraform](https://zed.dev/docs/languages/terraform.html#terraform)

Terraform support is available through the [Terraform extension](https://github.com/zed-extensions/terraform).

* Tree-sitter: [MichaHoffmann/tree-sitter-hcl](https://github.com/MichaHoffmann/tree-sitter-hcl)
* Language Server: [hashicorp/terraform-ls](https://github.com/hashicorp/terraform-ls)

## [Configuration](https://zed.dev/docs/languages/terraform.html#configuration)

The Terraform language server can be configured in your `settings.json`, e.g.:

```
{
  "lsp": {
    "terraform-ls": {
      "initialization_options": {
        "experimentalFeatures": {
          "prefillRequiredFields": true
        }
      }
    }
  }
}
```

See the [full list of server settings here](https://github.com/hashicorp/terraform-ls/blob/main/docs/SETTINGS.md).

[Tailwind CSS](https://zed.dev/docs/languages/tailwindcss.html "Tailwind CSS")
[TOML](https://zed.dev/docs/languages/toml.html "TOML")
