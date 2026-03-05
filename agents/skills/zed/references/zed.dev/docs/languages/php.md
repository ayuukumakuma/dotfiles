---
title: "PHP | PHP"
source_url: "https://zed.dev/docs/languages/php"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [PHP](https://zed.dev/docs/languages/php.html#php)

PHP support is available through the [PHP extension](https://github.com/zed-extensions/php).

* Tree-sitter: [tree-sitter/tree-sitter-php](https://github.com/tree-sitter/tree-sitter-php)
* Language Server: [phpactor/phpactor](https://github.com/phpactor/phpactor)
* Alternate Language Server: [bmewburn/vscode-intelephense](https://github.com/bmewburn/vscode-intelephense/)

## [Install PHP](https://zed.dev/docs/languages/php.html#install-php)

The PHP extension requires PHP to be installed and available in your `PATH`:

```
# macOS via Homebrew
brew install php

# Debian/Ubuntu
sudo apt-get install php-cli

# CentOS 8+/RHEL
sudo dnf install php-cli

# Arch Linux
sudo pacman -S php

# check PHP path
## macOS and Linux
which php

## Windows
where php
```

## [Choosing a language server](https://zed.dev/docs/languages/php.html#choosing-a-language-server)

The PHP extension uses [LSP language servers](https://microsoft.github.io/language-server-protocol) with Phpactor as the default. If you want to use other language servers that support Zed (e.g. Intelephense or PHP Tools), make sure to follow the documentation on how to implement it.

### [Intelephense](https://zed.dev/docs/languages/php.html#intelephense)

[Intelephense](https://intelephense.com/) is a [proprietary](https://github.com/bmewburn/vscode-intelephense/blob/master/LICENSE.txt#L29) language server for PHP operating under a freemium model. Certain features require purchase of a [premium license](https://intelephense.com/buy).

Configure language servers in Settings (`cmd-,|ctrl-,`) under Languages > PHP, or add to your settings file:

```
{
  "languages": {
    "PHP": {
      "language_servers": ["intelephense", "!phpactor", "!phptools", "..."]
    }
  }
}
```

To use the premium features, you can place your license file inside your home directory at `~/intelephense/licence.txt` for macOS and Linux, or `%USERPROFILE%/intelephense/licence.txt` on Windows.

Alternatively, you can pass the licence key or a path to a file containing the licence key as an initialization option. To do this, add the following to your `settings.json`:

```
{
  "lsp": {
    "intelephense": {
      "initialization_options": {
        "licenceKey": "/path/to/licence.txt"
      }
    }
  }
}
```

### [PHP Tools](https://zed.dev/docs/languages/php.html#php-tools)

[PHP Tools](https://www.devsense.com/) is a proprietary language server that offers free and premium features. You need to [purchase a license](https://www.devsense.com/en/purchase) to activate the premium features.

Configure language servers in Settings (`cmd-,|ctrl-,`) under Languages > PHP, or add to your settings file:

```
{
  "languages": {
    "PHP": {
      "language_servers": ["phptools", "!intelephense", "!phpactor", "..."]
    }
  }
}
```

To use the premium features, you can add your license in `initialization_options` in your `settings.json`:

```
{
  "lsp": {
    "phptools": {
      "initialization_options": {
        "0": "your_license_key"
      }
    }
  }
}
```

or, set environment variable `DEVSENSE_PHP_LS_LICENSE` on `.env` file in your project.

```
DEVSENSE_PHP_LS_LICENSE="your_license_key"
```

Check out the documentation of [PHP Tools for Zed](https://docs.devsense.com/other/zed/) for more details.

### [Phpactor](https://zed.dev/docs/languages/php.html#phpactor)

Configure language servers in Settings (`cmd-,|ctrl-,`) under Languages > PHP, or add to your settings file:

```
{
  "languages": {
    "PHP": {
      "language_servers": ["phpactor", "!intelephense", "!phptools", "..."]
    }
  }
}
```

## [PHPDoc](https://zed.dev/docs/languages/php.html#phpdoc)

Zed supports syntax highlighting for PHPDoc comments.

* Tree-sitter: [claytonrcarter/tree-sitter-phpdoc](https://github.com/claytonrcarter/tree-sitter-phpdoc)

## [Debugging](https://zed.dev/docs/languages/php.html#debugging)

The PHP extension provides a debug adapter for PHP via Xdebug. There are several ways to use it:

```
[
  {
    "label": "PHP: Listen to Xdebug",
    "adapter": "Xdebug",
    "request": "launch",
    "port": 9003
  },
  {
    "label": "PHP: Debug this test",
    "adapter": "Xdebug",
    "request": "launch",
    "program": "vendor/bin/phpunit",
    "args": ["--filter", "$ZED_SYMBOL"]
  }
]
```

These are common troubleshooting tips, in case you run into issues:

* Ensure that you have Xdebug installed for the version of PHP you're running.
* Ensure that Xdebug is configured to run in `debug` mode.
* Ensure that Xdebug is actually starting a debugging session.
* Ensure that the host and port matches between Xdebug and Zed.
* Look at the diagnostics log by using the `xdebug_info()` function in the page you're trying to debug.

## [Using the Tailwind CSS Language Server with PHP](https://zed.dev/docs/languages/php.html#using-the-tailwind-css-language-server-with-php)

To get all the features (autocomplete, linting, etc.) from the [Tailwind CSS language server](https://github.com/tailwindlabs/tailwindcss-intellisense/tree/HEAD/packages/tailwindcss-language-server#readme) in PHP files, you need to configure the language server so that it knows about where to look for CSS classes by adding the following to your `settings.json`:

```
{
  "lsp": {
    "tailwindcss-language-server": {
      "settings": {
        "includeLanguages": {
          "php": "html"
        },
        "experimental": {
          "classRegex": [
            "class=\"([^\"]*)\"",
            "class='([^']*)'",
            "class=\\\"([^\\\"]*)\\\""
          ]
        }
      }
    }
  }
}
```

With these settings, you will get completions for Tailwind CSS classes in HTML attributes inside PHP files. Examples:

```
<?php
// PHP file with HTML:
?>
<div class="flex items-center <completion here>">
  <p class="text-lg font-bold <completion here>">Hello World</p>
</div>
```

### [Laravel/Blade](https://zed.dev/docs/languages/php.html#laravelblade)

For Laravel/Blade files, you may need additional configuration to handle Blade directives:

```
{
  "lsp": {
    "tailwindcss-language-server": {
      "settings": {
        "includeLanguages": {
          "php": "html",
          "blade": "html"
        },
        "experimental": {
          "classRegex": [
            "class=\"([^\"]*)\"",
            "class='([^']*)'",
            "class=\\\"([^\\\"]*)\\\"",
            "@class\\(\\[([^\\]]*)\\]\\)"
          ]
        }
      }
    }
  }
}
```

This will also provide completions in Blade directives like:

```
{{-- Blade file --}}
<div class="flex {{ $customClass }} <completion here>">
  @class(['flex', 'items-center', '<completion here>'])
</div>
```

[OpenTofu](https://zed.dev/docs/languages/opentofu.html "OpenTofu")
[PowerShell](https://zed.dev/docs/languages/powershell.html "PowerShell")
