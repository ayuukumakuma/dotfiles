---
title: "YAML | YAML"
source_url: "https://zed.dev/docs/languages/yaml"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [YAML](https://zed.dev/docs/languages/yaml.html#yaml)

YAML support is available natively in Zed.

* Tree-sitter: [zed-industries/tree-sitter-yaml](https://github.com/zed-industries/tree-sitter-yaml)
* Language Server: [redhat-developer/yaml-language-server](https://github.com/redhat-developer/yaml-language-server)

## [Configuration](https://zed.dev/docs/languages/yaml.html#configuration)

You can configure various [yaml-language-server settings](https://github.com/redhat-developer/yaml-language-server?tab=readme-ov-file#language-server-settings) by adding them to your Zed settings.json in a `yaml-language-server` block under the `lsp` key.

You can configure custom YAML schemas using relative paths. Zed resolves paths relative to your project root:

```
  "lsp": {
    "yaml-language-server": {
      "settings": {
        "yaml": {
          "keyOrdering": true,
          "format": {
            "singleQuote": true
          },
          "schemas": {
              "https://getcomposer.org/schema.json": ["/*"],
              "./schemas/kubernetes.yaml": "k8s/**/*.yaml",
              "~/global-schemas/docker-compose.yaml": "docker-compose*.yml"
          }
        }
      }
    }
  }
```

Paths starting with `./` resolve relative to the worktree root. Paths starting with `~/` expand to your home directory.

Note, settings keys must be nested, so `yaml.keyOrdering` becomes `{"yaml": { "keyOrdering": true }}`.

## [Formatting](https://zed.dev/docs/languages/yaml.html#formatting)

By default, Zed uses Prettier for formatting YAML files.

### [Prettier Formatting](https://zed.dev/docs/languages/yaml.html#prettier-formatting)

You can customize the formatting behavior of Prettier. For example to use single-quotes in yaml files add the following to your `.prettierrc` configuration file:

```
{
  "overrides": [
    {
      "files": ["*.yaml", "*.yml"],
      "options": {
        "singleQuote": false
      }
    }
  ]
}
```

### [yaml-language-server Formatting](https://zed.dev/docs/languages/yaml.html#yaml-language-server-formatting)

To use `yaml-language-server` instead of Prettier for YAML formatting, configure in Settings (`cmd-,|ctrl-,`) under Languages > YAML, or add to your settings file:

```
  "languages": {
    "YAML": {
      "formatter": "language_server"
    }
  }
```

## [Schemas](https://zed.dev/docs/languages/yaml.html#schemas)

By default yaml-language-server will attempt to determine the correct schema for a given yaml file and retrieve the appropriate JSON Schema from [Json Schema Store](https://schemastore.org/).

You can override any auto-detected schema via the `schemas` settings key (demonstrated above) or by providing an [inlined schema](https://github.com/redhat-developer/yaml-language-server#using-inlined-schema) reference via a modeline comment at the top of your yaml file:

```
# yaml-language-server: $schema=https://www.schemastore.org/github-action.json
name: Issue Assignment
on:
  issues:
    types: [opened]
```

You can disable the automatic detection and retrieval of schemas from the JSON Schema if desired:

```
  "lsp": {
    "yaml-language-server": {
      "settings": {
        "yaml": {
          "schemaStore": {
            "enable": false
          }
        }
      }
    }
  }
```

## [Custom Tags](https://zed.dev/docs/languages/yaml.html#custom-tags)

Yaml-language-server supports [custom tags](https://github.com/redhat-developer/yaml-language-server#adding-custom-tags) which can be used to inject custom application functionality at runtime into your yaml files.

For example Amazon CloudFormation YAML uses a number of custom tags, to support these you can add the following to your settings.json:

```
  "lsp": {
    "yaml-language-server": {
      "settings": {
        "yaml": {
          "customTags": [
            "!And scalar",
            "!And mapping",
            "!And sequence",
            "!If scalar",
            "!If mapping",
            "!If sequence",
            "!Not scalar",
            "!Not mapping",
            "!Not sequence",
            "!Equals scalar",
            "!Equals mapping",
            "!Equals sequence",
            "!Or scalar",
            "!Or mapping",
            "!Or sequence",
            "!FindInMap scalar",
            "!FindInMap mapping",
            "!FindInMap sequence",
            "!Base64 scalar",
            "!Base64 mapping",
            "!Base64 sequence",
            "!Cidr scalar",
            "!Cidr mapping",
            "!Cidr sequence",
            "!Ref scalar",
            "!Ref mapping",
            "!Ref sequence",
            "!Sub scalar",
            "!Sub mapping",
            "!Sub sequence",
            "!GetAtt scalar",
            "!GetAtt mapping",
            "!GetAtt sequence",
            "!GetAZs scalar",
            "!GetAZs mapping",
            "!GetAZs sequence",
            "!ImportValue scalar",
            "!ImportValue mapping",
            "!ImportValue sequence",
            "!Select scalar",
            "!Select mapping",
            "!Select sequence",
            "!Split scalar",
            "!Split mapping",
            "!Split sequence",
            "!Join scalar",
            "!Join mapping",
            "!Join sequence",
            "!Condition scalar",
            "!Condition mapping",
            "!Condition sequence"
          ]
        }
      }
    }
  }
```

[XML](https://zed.dev/docs/languages/xml.html "XML")
[Yara](https://zed.dev/docs/languages/yara.html "Yara")
