---
title: "SQL | SQL"
source_url: "https://zed.dev/docs/languages/sql"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [SQL](https://zed.dev/docs/languages/sql.html#sql)

SQL files are handled by the [SQL Extension](https://github.com/zed-extensions/sql).

* Tree-sitter: [nervenes/tree-sitter-sql](https://github.com/nervenes/tree-sitter-sql)

### [Formatting](https://zed.dev/docs/languages/sql.html#formatting)

Zed supports auto-formatting SQL using external tools like [`sql-formatter`](https://github.com/sql-formatter-org/sql-formatter).

1. Install `sql-formatter`:

```
npm install -g sql-formatter
```

2. Ensure `sql-formatter` is available in your path and check the version:

```
which sql-formatter
sql-formatter --version
```

3. Configure formatting in Settings (`cmd-,|ctrl-,`) under Languages > SQL, or add to your settings file:

```
  "languages": {
    "SQL": {
      "formatter": {
        "external": {
          "command": "sql-formatter",
          "arguments": ["--language", "mysql"]
        }
      }
    }
  },
```

Substitute your preferred [SQL Dialect] for `mysql` above (`duckdb`, `hive`, `mariadb`, `postgresql`, `redshift`, `snowflake`, `sqlite`, `spark`, etc).

You can add this to Zed project settings (`.zed/settings.json`) or via your Zed user settings (`~/.config/zed/settings.json`).

### [Advanced Formatting](https://zed.dev/docs/languages/sql.html#advanced-formatting)

Sql-formatter also allows more precise control by providing [sql-formatter configuration options](https://github.com/sql-formatter-org/sql-formatter#configuration-options). To provide these, create a `.sql-formatter.json` file in your project:

```
{
  "language": "postgresql",
  "tabWidth": 2,
  "keywordCase": "upper",
  "linesBetweenQueries": 2
}
```

When using a `.sql-formatter.json` file you can use a simplified Zed settings configuration:

```
{
  "languages": {
    "SQL": {
      "formatter": {
        "external": {
          "command": "sql-formatter"
        }
      }
    }
  }
}
```

[Shell Script](https://zed.dev/docs/languages/sh.html "Shell Script")
[Svelte](https://zed.dev/docs/languages/svelte.html "Svelte")
