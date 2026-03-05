---
title: "Telemetry | Telemetry"
source_url: "https://zed.dev/docs/telemetry"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [Telemetry in Zed](https://zed.dev/docs/telemetry.html#telemetry-in-zed)

Zed collects anonymous telemetry to understand usage patterns and diagnose issues.

Telemetry falls into two categories:

* **Client-side**: Usage metrics and crash reports. You can disable these in settings.
* **Server-side**: Collected when using hosted services like AI or Collaboration. Required for these features to function.

## [Configuring Telemetry Settings](https://zed.dev/docs/telemetry.html#configuring-telemetry-settings)

You have full control over what data is sent out by Zed.
To enable or disable some or all telemetry types, open Settings (`cmd-,|ctrl-,`) and search for "telemetry", or add the following to your settings file:

```
"telemetry": {
    "diagnostics": false,
    "metrics": false
},
```

## [Dataflow](https://zed.dev/docs/telemetry.html#dataflow)

Telemetry is sent from the application to our servers every 5 minutes (or when 50 events accumulate), then routed to the appropriate service. We currently use:

* [Sentry](https://sentry.io): Crash-monitoring service - stores diagnostic events
* [Snowflake](https://snowflake.com): Data warehouse - stores both diagnostic and metric events
* [Hex](https://www.hex.tech): Dashboards and data exploration - accesses data stored in Snowflake
* [Amplitude](https://www.amplitude.com): Dashboards and data exploration - accesses data stored in Snowflake

## [Types of Telemetry](https://zed.dev/docs/telemetry.html#types-of-telemetry)

### [Diagnostics](https://zed.dev/docs/telemetry.html#diagnostics)

Crash reports consist of a [minidump](https://learn.microsoft.com/en-us/windows/win32/debug/minidump-files) and debug metadata. Reports are sent on the next launch after a crash, allowing Zed to identify and fix issues without requiring you to file a bug report.

You can inspect what data is sent in the `Panic` struct in [crates/telemetry\_events/src/telemetry\_events.rs](https://github.com/zed-industries/zed/blob/main/crates/telemetry_events/src/telemetry_events.rs). See also: [Debugging Crashes](https://zed.dev/docs/development/debugging-crashes.html).

### [Client-Side Metrics](https://zed.dev/docs/telemetry.html#client-side-metrics)

Client-side telemetry includes:

* File extensions of opened files
* Features and tools used within the editor
* Project statistics (e.g., number of files)
* Frameworks detected in your projects

This data does not include your code or sensitive project details. Events are sent over HTTPS and rate-limited.

Usage data is tied to a random telemetry ID. If you've authenticated, this ID may be linked to your email so Zed can analyze patterns over time and reach out for feedback.

To audit what Zed has reported, run `zed: open telemetry log` from the command palette or click `Help > View Telemetry Log`.

For the full list of event types, see the `Event` enum in [telemetry\_events.rs](https://github.com/zed-industries/zed/blob/main/crates/telemetry_events/src/telemetry_events.rs).

### [Server-Side Metrics](https://zed.dev/docs/telemetry.html#server-side-metrics)

When using Zed's hosted services, we collect metadata for rate limiting and billing (e.g., token usage). Zed does not store your prompts or code unless you explicitly share them via feedback ratings.

For details on AI data handling, see [Zed AI Features and Privacy](https://zed.dev/docs/ai/ai-improvement.html).

## [Concerns and Questions](https://zed.dev/docs/telemetry.html#concerns-and-questions)

If you have concerns about telemetry, you can [open an issue](https://github.com/zed-industries/zed/issues/new/choose) or email hi@zed.dev.

[AI Improvement](https://zed.dev/docs/ai/ai-improvement.html "AI Improvement")
[Developing Zed](https://zed.dev/docs/development.html "Developing Zed")
