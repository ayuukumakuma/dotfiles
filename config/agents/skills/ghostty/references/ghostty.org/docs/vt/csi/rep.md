---
title: "Repeat (REP) - CSI"
source_url: "https://ghostty.org/docs/vt/csi/rep"
fetched_at: "2026-04-07T02:34:27.768926+00:00"
---



* [Ghostty Docs](https://ghostty.org/docs.html)
* [Terminal API (VT)](https://ghostty.org/docs/vt.html)
* CSI
* [Repeat (REP)](https://ghostty.org/docs/vt/csi/rep.html)

# Repeat Previous Character (REP)

Repeat the previously printed character `n` times.

1. 0x1B
   :   ESC
2. 0x5B
   :   [
3. \_\_\_\_
   :   n
4. 0x62
   :   b

The parameter `n` must be an integer greater than or equal to 1. If `n` is less than
or equal to 0, adjust `n` to be 1. If `n` is omitted, `n` defaults to 1.

In xterm, only characters with single byte (less than decimal 256) are
supported. In most other mainstream terminals, any character is supported.

Each repeated character behaves identically to if it was manually typed in.
Therefore, soft-wrapping, margins, etc. all behave the same as if the
character was typed.

The previously printed character is any character that is printed through
any means. The previously printed character is not limited to characters
a user manually types. If there is no previously typed character, this sequence
does nothing.

## Validation

### REP V-1: Simple Usage

```
printf "\033[1;1H" # move to top-left
printf "\033[0J" # clear screen
printf "A"
printf "\033[b"
```

```
|AAc_______|
```

### REP V-2: Soft-Wrap

```
cols=$(tput cols)
printf "\033[1;1H" # move to top-left
printf "\033[0J" # clear screen
printf "\033[${cols}G"
printf "A"
printf "\033[b"
```

```
|_________A|
|Ac________|
```



[Edit on GitHub](https://github.com/ghostty-org/website/edit/main/docs/vt/csi/rep.mdx)

* [Validation](https://ghostty.org/docs/vt/csi/rep.html#validation)
* [REP V-1: Simple Usage](https://ghostty.org/docs/vt/csi/rep.html#rep-v-1:-simple-usage)
* [REP V-2: Soft-Wrap](https://ghostty.org/docs/vt/csi/rep.html#rep-v-2:-soft-wrap)
