---
title: "Authenticate | Authenticate with Zed"
source_url: "https://zed.dev/docs/authentication"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [Authenticate with Zed](https://zed.dev/docs/authentication.html#authenticate-with-zed)

Signing in to Zed is not required. You can use most features you'd expect in a code editor without ever doing so. We'll outline the few features that do require signing in, and how to do so, here.

## [What Features Require Signing In?](https://zed.dev/docs/authentication.html#what-features-require-signing-in)

1. All real-time [collaboration features](https://zed.dev/docs/collaboration/overview.html).
2. [LLM-powered features](https://zed.dev/docs/ai/overview.html), if you are using Zed as the provider of your LLM models. To use AI without signing in, you can [bring and configure your own API keys](https://zed.dev/docs/ai/llm-providers.html#use-your-own-keys).

## [Signing In](https://zed.dev/docs/authentication.html#signing-in)

Zed uses GitHub's OAuth flow to authenticate users, requiring only the `read:user` GitHub scope, which grants read-only access to your GitHub profile information.

1. Open Zed and click the `Sign In` button in the top-right corner of the window, or run the `client: sign in` command from the command palette (`cmd-shift-p` on macOS or `ctrl-shift-p` on Windows/Linux).
2. Your default web browser will open to the Zed sign-in page.
3. Authenticate with your GitHub account when prompted.
4. After successful authentication, your browser will display a confirmation, and you'll be automatically signed in to Zed.

**Note**: If you're behind a corporate firewall, ensure that connections to `zed.dev` and `collab.zed.dev` are allowed.

## [Signing Out](https://zed.dev/docs/authentication.html#signing-out)

To sign out of Zed, you can use either of these methods:

* Click on the profile icon in the upper right corner and select `Sign Out` from the dropdown menu.
* Open the command palette and run the `client: sign out` command.

## [Email Addresses](https://zed.dev/docs/authentication.html#email)

Your Zed account's email address is the address provided by GitHub OAuth. If you have a public email address then it will be used, otherwise your primary GitHub email address will be used. Changes to your email address on GitHub can be synced to your Zed account by [signing in to zed.dev](https://zed.dev/sign_in).

Stripe is used for billing, and will use your Zed account's email address when starting a subscription. Changes to your Zed account email address do not currently update the email address used in Stripe. See [Updating Billing Information](https://zed.dev/docs/ai/billing.html#updating-billing-info) for how to change this email address.

## [Hiding Sign In button from the interface](https://zed.dev/docs/authentication.html#hiding-sign-in-button-from-the-interface)

In case the Sign In feature is not used, it's possible to hide that from the interface by using `show_sign_in` settings property.
Refer to [Visual Customization page](https://zed.dev/docs/visual-customization.html) for more details.

[CLI Reference](https://zed.dev/docs/reference/cli.html "CLI Reference")
[Privacy and Security](https://zed.dev/docs/ai/privacy-and-security.html "Privacy and Security")
