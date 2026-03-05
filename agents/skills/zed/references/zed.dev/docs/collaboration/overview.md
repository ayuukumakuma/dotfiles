---
title: "Overview | Collaboration"
source_url: "https://zed.dev/docs/collaboration/overview"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [Collaboration](https://zed.dev/docs/collaboration/overview.html#collaboration)

Zed supports real-time multiplayer editing. Multiple people can work in the same project simultaneously, seeing each other's cursors and edits as they happen.

Open the Collaboration Panel with `cmd-shift-c|ctrl-shift-c`. You'll need to [sign in](https://zed.dev/docs/authentication.html#signing-in) to access collaboration features.

## [Collaboration Panel](https://zed.dev/docs/collaboration/overview.html#collaboration-panel)

The Collaboration Panel has two sections:

1. [Channels](https://zed.dev/docs/collaboration/channels.html): Persistent project rooms for team collaboration, with shared projects and voice chat.
2. [Contacts and Private Calls](https://zed.dev/docs/collaboration/contacts-and-private-calls.html): Your contacts list for ad-hoc private sessions.

> **Warning:** Sharing a project gives collaborators access to your local file system within that project. Only collaborate with people you trust.

See the [Data and Privacy FAQs](https://zed.dev/faq#data-and-privacy) for more details.

## [Audio Settings](https://zed.dev/docs/collaboration/overview.html#audio-settings)

### [Selecting Audio Devices](https://zed.dev/docs/collaboration/overview.html#selecting-audio-devices)

You can select specific input and output audio devices instead of using system defaults. To configure audio devices:

1. Open `cmd-,|ctrl-,`
2. Navigate to **Collaboration** > **Experimental**
3. Use the **Output Audio Device** and **Input Audio Device** dropdowns to select your preferred devices

Changes take effect immediately. If you select a device that becomes unavailable, Zed falls back to system defaults.

To test your audio configuration, click **Test Audio** in the same section. This opens a window where you can verify your microphone and speaker work correctly with the selected devices.

**JSON configuration:**

```
{
  "audio": {
    "experimental.output_audio_device": "Device Name (device-id)",
    "experimental.input_audio_device": "Device Name (device-id)"
  }
}
```

Set either value to `null` to use system defaults.

[Git](https://zed.dev/docs/git.html "Git")
[Channels](https://zed.dev/docs/collaboration/channels.html "Channels")
