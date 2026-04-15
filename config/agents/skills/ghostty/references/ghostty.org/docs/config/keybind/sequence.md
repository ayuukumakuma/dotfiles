---
title: "Trigger Sequences - Keybindings"
source_url: "https://ghostty.org/docs/config/keybind/sequence"
fetched_at: "2026-04-07T02:34:27.768926+00:00"
---



* [Ghostty Docs](https://ghostty.org/docs.html)
* [Configuration](https://ghostty.org/docs/config.html)
* [Keybindings](https://ghostty.org/docs/config/keybind.html)
* [Trigger Sequences](https://ghostty.org/docs/config/keybind/sequence.html)

# Trigger Sequences

A trigger that requires a sequence of multiple keypress events.

Ghostty supports keybindings that require a sequence of triggers
to activate the action. For example, you could require `ctrl+a`
followed by `n` to open a new window. In other software, this is sometimes
referred to as a "leader key", a "key chord", a "key table",
etc.

To specify a sequence of triggers, use the
[normal trigger syntax](https://ghostty.org/docs/config/keybind.html#trigger) and
separate the triggers in the sequence with a `>` character.
An example is shown below:

```
keybind = ctrl+a>n=new_window
```

> Warning
>
> If you define a sequence as a CLI argument to `ghostty`,
> you probably have to quote the keybind since `>` is a special character
> in most shells. Example: ghostty --keybind='ctrl+a>n=new\_window'

A trigger sequence has some special handling:

* Ghostty will wait an indefinite amount of time for the next key in
  the sequence. There is no way to specify a timeout. The only way to
  force the output of a prefix key is to assign another keybind to
  specifically output that key (i.e. `ctrl+a>ctrl+a=text:foo`) or
  press an unbound key which will send both keys to the program.
* If a prefix in a sequence is previously bound, the sequence will
  override the previous binding. For example, if `ctrl+a` is bound to
  `new_window` and `ctrl+a>n` is bound to `new_tab`, pressing `ctrl+a`
  will do nothing.
* Adding to the above, if a previously bound sequence prefix is
  used in a new, non-sequence binding, the entire previously bound
  sequence will be unbound. For example, if you bind `ctrl+a>n` and
  `ctrl+a>t`, and then bind `ctrl+a` directly, both `ctrl+a>n` and
  `ctrl+a>t` will become unbound.
* Trigger sequences are not allowed for `global:` or `all:`-prefixed
  triggers. This is a limitation we could remove in the future.



[Edit on GitHub](https://github.com/ghostty-org/website/edit/main/docs/config/keybind/sequence.mdx)
