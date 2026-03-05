---
title: "Rego | Rego"
source_url: "https://zed.dev/docs/languages/rego"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [Rego](https://zed.dev/docs/languages/rego.html#rego)

Rego language support in Zed is provided by the community-maintained [Rego extension](https://github.com/StyraInc/zed-rego).

* Tree-sitter: [FallenAngel97/tree-sitter-rego](https://github.com/FallenAngel97/tree-sitter-rego)
* Language Server: [open-policy-agent/regal](https://github.com/open-policy-agent/regal)

## [Installation](https://zed.dev/docs/languages/rego.html#installation)

The extension is largely based on the [Regal](https://docs.styra.com/regal/language-server) language server which should be installed to make use of the extension. Read the [getting started](https://docs.styra.com/regal#getting-started) instructions for more information.

## [Configuration](https://zed.dev/docs/languages/rego.html#configuration)

The extension's behavior is configured in the `.regal/config.yaml` file. The following is an example configuration which disables the `todo-comment` rule, customizes the `line-length` rule, and ignores test files for the `opa-fmt` rule:

```
rules:
  style:
    todo-comment:
      # don't report on todo comments
      level: ignore
    line-length:
      # custom rule configuration
      max-line-length: 100
      # warn on too long lines, but don't fail
      level: warning
    opa-fmt:
      # not needed as error is the default, but
      # being explicit won't hurt
      level: error
      # files can be ignored for any individual rule
      # in this example, test files are ignored
      ignore:
        files:
          - "*_test.rego"
```

Read Regal's [configuration documentation](https://docs.styra.com/regal#configuration) for more information.

[R](https://zed.dev/docs/languages/r.html "R")
[ReStructuredText](https://zed.dev/docs/languages/rst.html "ReStructuredText")
