---
title: "Kotlin | Kotlin"
source_url: "https://zed.dev/docs/languages/kotlin"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [Kotlin](https://zed.dev/docs/languages/kotlin.html#kotlin)

Kotlin language support in Zed is provided by the community-maintained [Kotlin extension](https://github.com/zed-extensions/kotlin).
Report issues to: <https://github.com/zed-extensions/kotlin/issues>

* Tree-sitter: [fwcd/tree-sitter-kotlin](https://github.com/fwcd/tree-sitter-kotlin)
* Language Server: [fwcd/kotlin-language-server](https://github.com/fwcd/kotlin-language-server)
* Alternate Language Server: [kotlin/kotlin-lsp](https://github.com/kotlin/kotlin-lsp)

## [Configuration](https://zed.dev/docs/languages/kotlin.html#configuration)

Workspace configuration options can be passed to the language server via lsp
settings in `settings.json`.

The full list of lsp `settings` can be found
[here](https://github.com/fwcd/kotlin-language-server/blob/main/server/src/main/kotlin/org/javacs/kt/Configuration.kt)
under `class Configuration` and initialization\_options under `class InitializationOptions`.

### [JVM Target](https://zed.dev/docs/languages/kotlin.html#jvm-target)

The following example changes the JVM target from `default` (which is 1.8) to
`17`:

```
{
  "lsp": {
    "kotlin-language-server": {
      "settings": {
        "compiler": {
          "jvm": {
            "target": "17"
          }
        }
      }
    }
  }
}
```

### [JAVA\_HOME](https://zed.dev/docs/languages/kotlin.html#java_home)

To use a specific java installation, just specify the `JAVA_HOME` environment variable with:

```
{
  "lsp": {
    "kotlin-language-server": {
      "binary": {
        "env": {
          "JAVA_HOME": "/Users/whatever/Applications/Work/Android Studio.app/Contents/jbr/Contents/Home"
        }
      }
    }
  }
}
```

[Jsonnet](https://zed.dev/docs/languages/jsonnet.html "Jsonnet")
[Lua](https://zed.dev/docs/languages/lua.html "Lua")
