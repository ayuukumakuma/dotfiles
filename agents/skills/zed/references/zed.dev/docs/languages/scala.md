---
title: "Scala | Scala"
source_url: "https://zed.dev/docs/languages/scala"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [Scala](https://zed.dev/docs/languages/scala.html#scala)

Scala language support in Zed is provided by the community-maintained [Scala extension](https://github.com/scalameta/metals-zed).
Report issues to: <https://github.com/scalameta/metals-zed/issues>

* Tree-sitter: [tree-sitter/tree-sitter-scala](https://github.com/tree-sitter/tree-sitter-scala)
* Language Server: [scalameta/metals](https://github.com/scalameta/metals)

## [Setup](https://zed.dev/docs/languages/scala.html#setup)

* Install Scala with `cs setup` (Coursier): https://www.scala-lang.org/download/
  + `brew install coursier/formulas/coursier && cs setup`
* REPL (Almond) Setup Instructions https://almond.sh/docs/quick-start-install
  + `brew install --cask temurin` (Eclipse foundation official OpenJDK binaries)
  + `brew install coursier/formulas/coursier && cs setup`
  + `coursier launch --use-bootstrap almond -- --install`

## [Configuration](https://zed.dev/docs/languages/scala.html#configuration)

Behavior of the Metals language server can be controlled with:

* `.scalafix.conf` file - See [Scalafix Configuration](https://scalacenter.github.io/scalafix/docs/users/configuration.html)
* `.scalafmt.conf` file - See [Scalafmt Configuration](https://scalameta.org/scalafmt/docs/configuration.html)

You can place these files in the root of your project or specifying their location in the Metals configuration. See [Metals User Configuration](https://scalameta.org/metals/docs/editors/user-configuration) for more.

[Rust](https://zed.dev/docs/languages/rust.html "Rust")
[Scheme](https://zed.dev/docs/languages/scheme.html "Scheme")
