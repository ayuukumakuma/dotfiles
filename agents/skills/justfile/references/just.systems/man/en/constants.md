---
title: "Constants - Just Programmer's Manual"
source_url: "https://just.systems/man/en/constants"
fetched_at: "2026-03-31T07:58:30.733796+00:00"
---



### [Constants](https://just.systems/man/en/constants.html#constants)

A number of constants are predefined:

| Name | Value | Value on Windows |
| --- | --- | --- |
| `HEX`1.27.0 | `"0123456789abcdef"` |  |
| `HEXLOWER`1.27.0 | `"0123456789abcdef"` |  |
| `HEXUPPER`1.27.0 | `"0123456789ABCDEF"` |  |
| `PATH_SEP`1.41.0 | `"/"` | `"\"` |
| `PATH_VAR_SEP`1.41.0 | `":"` | `";"` |
| `CLEAR`1.37.0 | `"\ec"` |  |
| `NORMAL`1.37.0 | `"\e[0m"` |  |
| `BOLD`1.37.0 | `"\e[1m"` |  |
| `ITALIC`1.37.0 | `"\e[3m"` |  |
| `UNDERLINE`1.37.0 | `"\e[4m"` |  |
| `INVERT`1.37.0 | `"\e[7m"` |  |
| `HIDE`1.37.0 | `"\e[8m"` |  |
| `STRIKETHROUGH`1.37.0 | `"\e[9m"` |  |
| `BLACK`1.37.0 | `"\e[30m"` |  |
| `RED`1.37.0 | `"\e[31m"` |  |
| `GREEN`1.37.0 | `"\e[32m"` |  |
| `YELLOW`1.37.0 | `"\e[33m"` |  |
| `BLUE`1.37.0 | `"\e[34m"` |  |
| `MAGENTA`1.37.0 | `"\e[35m"` |  |
| `CYAN`1.37.0 | `"\e[36m"` |  |
| `WHITE`1.37.0 | `"\e[37m"` |  |
| `BG_BLACK`1.37.0 | `"\e[40m"` |  |
| `BG_RED`1.37.0 | `"\e[41m"` |  |
| `BG_GREEN`1.37.0 | `"\e[42m"` |  |
| `BG_YELLOW`1.37.0 | `"\e[43m"` |  |
| `BG_BLUE`1.37.0 | `"\e[44m"` |  |
| `BG_MAGENTA`1.37.0 | `"\e[45m"` |  |
| `BG_CYAN`1.37.0 | `"\e[46m"` |  |
| `BG_WHITE`1.37.0 | `"\e[47m"` |  |

```
@foo:
  echo {{HEX}}
```

```
$ just foo
0123456789abcdef
```

Constants starting with `\e` are
[ANSI escape sequences](https://en.wikipedia.org/wiki/ANSI_escape_code).

`CLEAR` clears the screen, similar to the `clear` command. The rest are of the
form `\e[Nm`, where `N` is an integer, and set terminal display attributes.

Terminal display attribute escape sequences can be combined, for example text
weight `BOLD`, text style `STRIKETHROUGH`, foreground color `CYAN`, and
background color `BG_BLUE`. They should be followed by `NORMAL`, to reset the
terminal back to normal.

Escape sequences should be quoted, since `[` is treated as a special character
by some shells.

```
@foo:
  echo '{{BOLD + STRIKETHROUGH + CYAN + BG_BLUE}}Hi!{{NORMAL}}'
```
