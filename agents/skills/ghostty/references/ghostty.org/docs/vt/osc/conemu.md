---
title: "ConEmu Extensions (OSC 9;n) - OSC"
source_url: "https://ghostty.org/docs/vt/osc/conemu"
fetched_at: "2026-04-07T02:34:27.768926+00:00"
---



* [Ghostty Docs](https://ghostty.org/docs.html)
* [Terminal API (VT)](https://ghostty.org/docs/vt.html)
* OSC
* [ConEmu Extensions (OSC 9;n)](https://ghostty.org/docs/vt/osc/conemu.html)

# ConEmu Extensions (OSC 9;n)

Various extensions pioneered by ConEmu.

[ConEmu](https://conemu.github.io/), an older terminal emulator for Windows, pioneered several [custom
protocols](https://conemu.github.io/en/AnsiEscapeCodes.html#ConEmu_specific_OSC) using OSC 9. Unfortunately, this conflicts with iTerm2's
[Show Desktop Notification](https://ghostty.org/docs/vt/osc/9.html) protocol, which also uses OSC 9.
Ghostty attempts to differentiate between the two by trying to find the
*sub-ID* that each ConEmu sequence has, which determines its actual function.
When one is not found, a Show Desktop Notification sequence is assumed instead.

Because the following protocols are often underspecified at best and highly
questionable security-wise at worst, Ghostty only *implements* the extensions
that are listed below. There are many more that Ghostty does parse, but either
due to security reasons or the fact that Ghostty does not try to be a ConEmu
clone, they are either ignored or converted into [OSC 9](https://ghostty.org/docs/vt/osc/9.html) sequences.

### Change Progress State (OSC 9;4)

1. 0x1B
   :   ESC
2. 0x5D
   :   ]
3. 0x39
   :   9
4. 0x3B
   :   ;
5. 0x34
   :   4
6. 0x3B
   :   ;
7. \_\_\_\_
   :   s
8. 0x1B
   :   ESC
9. 0x5C
   :   \



1. 0x1B
   :   ESC
2. 0x5D
   :   ]
3. 0x39
   :   9
4. 0x3B
   :   ;
5. 0x34
   :   4
6. 0x3B
   :   ;
7. \_\_\_\_
   :   s
8. 0x3B
   :   ;
9. \_\_\_\_
   :   v
10. 0x1B
    :   ESC
11. 0x5C
    :   \

Change the current progress state based on the value of `s` and `v`.

The current progress can be in various states: inactive (default), in progress,
error, or indeterminate, which is represented visually in Ghostty as a progress
bar on top of each split. Its value is represented as an integer between 0 and
100 inclusive, corresponding to the percentage level of the progress bar.

The new state and value chiefly depends on the value of `s`:

| `s` | New state | New value |
| --- | --- | --- |
| `0` | Inactive | 0 |
| `1` | In progress | `v` |
| `2` | Error | `v` when specified, otherwise unchanged |
| `3` | Indeterminate | Unchanged |
| `4` | Paused | `v` when specified, otherwise unchanged |

> Note
>
> Note that the terminal cannot determine when a progress state becomes
> *stale* with this protocol, e.g. when a program is terminated without
> cleaning up its progress state. This is why Ghostty has a **hardcoded
> timeout** of around 15 seconds, after which the current progress state
> is reset.
>
> If you're writing a program that uses this protocol, you need to make sure
> to update the progress state regularly as a keep-alive signal. There is
> sadly no standardization around this, but we recommend at least updating
> once per second.



[Edit on GitHub](https://github.com/ghostty-org/website/edit/main/docs/vt/osc/conemu.mdx)
