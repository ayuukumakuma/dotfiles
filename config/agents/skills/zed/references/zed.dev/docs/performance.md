---
title: "Performance | Rough quick CPU profiling (Flamechart)"
source_url: "https://zed.dev/docs/performance"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



How to use our internal tools to profile and keep Zed fast.

# [Rough quick CPU profiling (Flamechart)](https://zed.dev/docs/performance.html#rough-quick-cpu-profiling-flamechart)

See what the CPU spends the most time on. Strongly recommend you use
[samply](https://github.com/mstange/samply). It opens an interactive profile in
the browser (specifically a local instance of [firefox\_profiler](https://profiler.firefox.com/)).

See [samply](https://github.com/mstange/samply)'s README on how to install and run.

The profile.json does not contain any symbols. Firefox profiler can add the local symbols to the profile for for. To do that hit the upload local profile button in the top right corner.

![image](https://github.com/user-attachments/assets/cbef2b51-0442-4ee9-bc5c-95f6ccf9be2c)