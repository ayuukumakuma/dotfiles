---
title: "FreeBSD | Building Zed for FreeBSD"
source_url: "https://zed.dev/docs/development/freebsd"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [Building Zed for FreeBSD](https://zed.dev/docs/development/freebsd.html#building-zed-for-freebsd)

FreeBSD is not currently a supported platform, so this guide is a work in progress.

## [Repository](https://zed.dev/docs/development/freebsd.html#repository)

Clone the [Zed repository](https://github.com/zed-industries/zed).

## [Dependencies](https://zed.dev/docs/development/freebsd.html#dependencies)

* Install the necessary system packages and rustup:

  ```
  script/freebsd
  ```

  If preferred, you can inspect [`script/freebsd`](https://github.com/zed-industries/zed/blob/main/script/freebsd) and perform the steps manually.

## [Building from source](https://zed.dev/docs/development/freebsd.html#building-from-source)

Once the dependencies are installed, you can build Zed using [Cargo](https://doc.rust-lang.org/cargo/).

For a debug build of the editor:

```
cargo run
```

And to run the tests:

```
cargo test --workspace
```

In release mode, the primary user interface is the `cli` crate. You can run it in development with:

```
cargo run -p cli
```

### [WebRTC Notice](https://zed.dev/docs/development/freebsd.html#webrtc-notice)

Building `webrtc-sys` on FreeBSD currently fails due to missing upstream support and unavailable prebuilt binaries. As a result, collaboration features that depend on WebRTC (audio calls and screen sharing) are temporarily disabled.

See [Issue #15309: FreeBSD Support] and [Discussion #29550: Unofficial FreeBSD port for Zed] for more.

## [Troubleshooting](https://zed.dev/docs/development/freebsd.html#troubleshooting)

### [Cargo errors claiming that a dependency is using unstable features](https://zed.dev/docs/development/freebsd.html#cargo-errors-claiming-that-a-dependency-is-using-unstable-features)

Try `cargo clean` and `cargo build`.

[Windows](https://zed.dev/docs/development/windows.html "Windows")
[Using Debuggers](https://zed.dev/docs/development/debuggers.html "Using Debuggers")
