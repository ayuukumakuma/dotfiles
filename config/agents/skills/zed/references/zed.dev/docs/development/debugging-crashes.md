---
title: "Debugging Crashes | Debugging Crashes"
source_url: "https://zed.dev/docs/development/debugging-crashes"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [Debugging Crashes](https://zed.dev/docs/development/debugging-crashes.html#debugging-crashes)

When Zed panics or crashes, it sends a message to a sidecar process that inspects the editor's memory and creates a [minidump](https://chromium.googlesource.com/breakpad/breakpad/+/master/docs/getting_started_with_breakpad.md#the-minidump-file-format) in `~/Library/Logs/Zed` or `$XDG_DATA_HOME/zed/logs`. You can use this minidump to generate backtraces for all thread stacks.

If telemetry is enabled, Zed uploads these reports when you restart the app. Reports are sent to a [Slack channel](https://zed-industries.slack.com/archives/C0977J9MA1Y) and to [Sentry](https://zed-dev.sentry.io/issues) (both are Zed-staff-only).

These crash reports include useful data, but they are hard to read without spans or symbol information. You can still analyze them locally by downloading source and an unstripped binary (or separate symbols file) for your Zed release, then running:

```
zstd -d ~/.local/share/zed/<uuid>.dmp -o minidump.dmp
minidump-stackwalk minidump.dmp
```

Alongside the minidump in your logs directory, you should also see a `<uuid>.json` file with metadata such as the panic message, span, and system specs.

## [Using a Debugger](https://zed.dev/docs/development/debugging-crashes.html#using-a-debugger)

If you can reproduce the crash consistently, use a debugger to inspect program state at the crash point.

For setup details, see [Using a debugger](https://zed.dev/docs/development/debuggers.html#debugging-panics-and-crashes).

[Release Notes](https://zed.dev/docs/development/release-notes.html "Release Notes")
