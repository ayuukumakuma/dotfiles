---
title: "Glossary | Zed Development: Glossary"
source_url: "https://zed.dev/docs/development/glossary"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [Zed Development: Glossary](https://zed.dev/docs/development/glossary.html#zed-development-glossary)

This page defines terms and structures used throughout the Zed codebase.

It is a best-effort list and a work in progress.

## [Naming conventions](https://zed.dev/docs/development/glossary.html#naming-conventions)

These are common naming patterns across the codebase. `Name` is a placeholder
for any type name, such as `AnyElement` or `LspStore`.

* `AnyName`: A type-erased version of *name*. Think `Box<dyn NameTrait>`.
* `NameStore`: A wrapper type which abstracts over whether operations are running locally or on a remote.

## [GPUI](https://zed.dev/docs/development/glossary.html#gpui)

### [State management](https://zed.dev/docs/development/glossary.html#state-management)

* `App`: A singleton that holds full application state, including all entities. `App` is not `Send`, so it exists only on the thread that created it (usually the main/UI thread). If you see `&mut App`, you are on the UI thread.
* `Context`: A wrapper around `App` with specialized behavior for a specific `Entity`. You can think of it as `(&mut App, Entity<V>)`. For example, `App::spawn` takes `AsyncFnOnce(AsyncApp) -> Ret`, while `Context::spawn` takes `AsyncFnOnce(WeakEntity<V>, AsyncApp) -> Ret`.
* `AsyncApp`: An owned version of `App` for async contexts. It is still not `Send`, so it still runs on the main thread, and operations may fail if the `App` has already terminated.
  `AsyncApp` exists because `App` is usually accessed as `&mut App`, which is awkward to hold across async boundaries.
* `AppContext`: A trait that abstracts over `App`, `AsyncApp`, `Context`, and their test variants.
* `Task`: A future running (or scheduled to run) on a background or foreground executor. Unlike regular futures, tasks do not need `.await` to start. You still need to await them to read their result.
* `Executor`: Used to spawn tasks that run either on the foreground or background thread. Try to run the tasks on the background thread.
  + `BackgroundExecutor`: A threadpool running `Task`s.
  + `ForegroundExecutor`: The main thread running `Task`s.
* `Entity`: A strong, well-typed reference to a struct which is managed by gpui. Effectively a pointer/map key into the `App::EntityMap`.
* `WeakEntity`: A runtime checked reference to an `Entity` which may no longer exist. Similar to [`std::rc::Weak`](https://doc.rust-lang.org/std/rc/struct.Weak.html).
* `Global`: A singleton type which has only one value, that is stored in the `App`.
* `Event`: A data type that can be sent by an `Entity` to subscribers.
* `Action`: An event that represents a user's keyboard input that can be handled by listeners
  Example: `file finder: toggle`
* `Observing`: Reacting to notifications that entities have changed.
* `Subscription`: An event handler that is used to react to the changes of state in the application.
  1. Emitted event handling
  2. Observing `{new,release,on notify}` of an entity

### [UI](https://zed.dev/docs/development/glossary.html#ui)

* `View`: An `Entity` which can produce an `Element` through its implementation of `Render`.
* `Element`: A type that can be laid out and painted to the screen.
* `element expression`: An expression that builds an element tree, example:

```
```
#![allow(unused)]
fn main() {
h_flex()
    .id(text[i])
    .relative()
    .when(selected, |this| {
        this.child(
            div()
                .h_4()
                .absolute()
                etc etc
}
```
```

* `Component`: A builder which can be rendered turning it into an `Element`.
* `Dispatch tree`: TODO
* `Focus`: The place where keystrokes are handled first
* `Focus tree`: Path from the place that has the current focus to the UI Root. Example ![]() TODO

## [Zed UI](https://zed.dev/docs/development/glossary.html#zed-ui)

* `Window`: A struct representing a Zed window in your desktop environment (see image below). You can have multiple windows open. This is mostly passed around for rendering.
* `Modal`: A UI element that floats on top of the rest of the UI
* `Picker`: A struct representing a list of items floating on top of the UI (Modal). You can select an item and confirm. What happens on select or confirm is determined by the picker's delegate. (The 'Modal' in the image below is a picker.)
* `PickerDelegate`: A trait used to specialize behavior for a `Picker`. The `Picker` stores the `PickerDelegate` in the field delegate.
* `Center`: The middle of the zed window, the center is split into multiple `Pane`s. In the codebase this is a field on the `Workspace` struct. (see image below).
* `Pane`: An area in the `Center` where we can place items, such as an editor, multi-buffer or terminal (see image below).
* `Panel`: An `Entity` implementing the `Panel` trait. Panels can be placed in a `Dock`. In the image below: `ProjectPanel` is in the left dock, `DebugPanel` is in the bottom dock, and `AgentPanel` is in the right dock. `Editor` does not implement `Panel`.
* `Dock`: A UI element similar to a `Pane` that can be opened and hidden. Up to three docks can be open at once: left, right, and bottom. A dock contains one or more `Panel`s, not `Pane`s.

![Screenshot for the Pane and Dock features](https://github.com/user-attachments/assets/2cb1170e-2850-450d-89bb-73622b5d07b2)