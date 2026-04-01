---
title: "Contribution Workflow - Just Programmer's Manual"
source_url: "https://just.systems/man/en/contribution-workflow"
fetched_at: "2026-03-31T07:58:30.733796+00:00"
---



### [Contribution Workflow](https://just.systems/man/en/contribution-workflow.html#contribution-workflow)

1. Make sure the feature is wanted. There should be an open issue about the
   feature with a comment from [@casey](https://github.com/casey) saying that
   it’s a good idea or seems reasonable. If there isn’t, open a new issue and
   ask for feedback.

   There are lots of good features which can’t be merged, either because they
   aren’t backwards compatible, have an implementation which would
   overcomplicate the codebase, or go against `just`’s design philosophy.
2. Settle on the design of the feature. If the feature has multiple possible
   implementations or syntaxes, make sure to nail down the details in the
   issue.
3. Clone `just` and start hacking. The best workflow is to have the code you’re
   working on in an editor alongside a job that re-runs tests whenever a file
   changes. You can run such a job by installing
   [cargo-watch](https://github.com/watchexec/cargo-watch) with `cargo install cargo-watch` and running `just watch test`.
4. Add a failing test for your feature. Most of the time this will be an
   integration test which exercises the feature end-to-end. Look for an
   appropriate file to put the test in
   [tests](https://github.com/casey/just/blob/master/tests), or add a new file
   in [tests](https://github.com/casey/just/blob/master/tests) and add a `mod`
   statement importing that file in
   [tests/lib.rs](https://github.com/casey/just/blob/master/tests/lib.rs).
5. Implement the feature.
6. Run `just ci` to make sure that all tests, lints, and checks pass. Requires
   [mdBook](https://github.com/rust-lang/mdBook) and
   [mdbook-linkcheck](https://github.com/Michael-F-Bryan/mdbook-linkcheck).
7. Open a PR with the new code that is editable by maintainers. PRs often
   require rebasing and minor tweaks. If the PR is not editable by maintainers,
   each rebase and tweak will require a round trip of code review. Your PR may
   be summarily closed if it is not editable by maintainers.
8. Incorporate feedback.
9. Enjoy the sweet feeling of your PR getting merged!

Feel free to open a draft PR at any time for discussion and feedback.
