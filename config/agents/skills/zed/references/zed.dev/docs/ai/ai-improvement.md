---
title: "AI Improvement | AI Improvement and Data Collection - Zed"
source_url: "https://zed.dev/docs/ai/ai-improvement"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [Zed AI Features and Privacy](https://zed.dev/docs/ai/ai-improvement.html#zed-ai-features-and-privacy)

## [Overview](https://zed.dev/docs/ai/ai-improvement.html#overview)

AI features in Zed include:

* [Agent Panel](https://zed.dev/docs/ai/agent-panel.html)
* [Edit Predictions](https://zed.dev/docs/ai/edit-prediction.html)
* [Inline Assist](https://zed.dev/docs/ai/inline-assistant.html)
* [Text Threads](https://zed.dev/docs/ai/text-threads.html)
* Auto Git Commit Message Generation

By default, Zed does not store your prompts or code context. This data is sent to your selected AI provider (e.g., Anthropic, OpenAI, Google, or xAI) to generate responses, then discarded. Zed will not use your data to evaluate or improve AI features unless you explicitly share it (see [AI Feedback with Ratings](https://zed.dev/docs/ai/ai-improvement.html#ai-feedback-with-ratings)) or you opt in to edit prediction training data collection (see [Edit Predictions](https://zed.dev/docs/ai/ai-improvement.html#edit-predictions)).

Zed is model-agnostic by design, and none of this changes based on which provider you choose. You can use your own API keys or Zed's hosted models without any data being retained.

### [Data Retention and Training](https://zed.dev/docs/ai/ai-improvement.html#data-retention-and-training)

Zed's Agent Panel can be used via:

* [Zed's hosted models](https://zed.dev/docs/ai/subscription.html)
* [connecting a non-Zed AI service via API key](https://zed.dev/docs/ai/llm-providers.html)
* using an [external agent](https://zed.dev/docs/ai/external-agents.html) via ACP

When using Zed's hosted models, we require assurances from our service providers that your user content won't be used for training models.

| Provider | No Training Guarantee | Zero-Data Retention (ZDR) |
| --- | --- | --- |
| Anthropic | [Yes](https://www.anthropic.com/legal/commercial-terms) | [Yes](https://privacy.anthropic.com/en/articles/8956058-i-have-a-zero-data-retention-agreement-with-anthropic-what-products-does-it-apply-to) |
| Google | [Yes](https://cloud.google.com/terms/service-terms) | [Yes](https://cloud.google.com/terms/service-terms), see Service Terms sections 17 and 19h |
| OpenAI | [Yes](https://openai.com/enterprise-privacy/) | [Yes](https://platform.openai.com/docs/guides/your-data) |
| xAI | [Yes](https://x.ai/legal/faq-enterprise) | [Yes](https://x.ai/legal/faq-enterprise) |

When you use your own API keys or external agents, **Zed does not have control over how your data is used by that service provider.**
You should reference your agreement with each service provider to understand what terms and conditions apply.

### [AI Feedback with Ratings](https://zed.dev/docs/ai/ai-improvement.html#ai-feedback-with-ratings)

You can provide feedback on Zed's AI features by rating specific AI responses in Zed and sharing details related to those conversations with Zed. Each share is opt-in, and sharing once will not cause future content or data to be shared again.

> **Rating = Data Sharing:** When you rate a response, your entire conversation thread is sent to Zed. This includes messages, AI responses, and thread metadata.
> ***If you don't want data persisted on Zed's servers, don't rate***. We will not collect data for improving our AI features without you explicitly rating responses.

### [Data Collected (AI Feedback)](https://zed.dev/docs/ai/ai-improvement.html#data-collected-ai-feedback)

For conversations you have explicitly shared with us via rating, Zed may store:

* All messages in the thread (your prompts and AI responses)
* Any commentary you include with your rating
* Thread metadata (model used, token counts, timestamps)
* Metadata about your Zed installation

If you do not rate responses, Zed will not store Customer Data (code, conversations, responses) related to your usage of the AI features.

Telemetry related to Zed's AI features is collected. This includes metadata such as the AI feature being used and high-level interactions with the feature to understand performance (e.g., Agent response time, edit acceptance/rejection in the Agent panel or edit completions). You can read more in Zed's [telemetry](https://zed.dev/docs/telemetry.html) documentation.

Collected data is stored in Snowflake, a private database. We periodically review this data to refine the agent's system prompt and tool use. All data is anonymized and stripped of sensitive information (access tokens, user IDs, email addresses).

## [Edit Predictions](https://zed.dev/docs/ai/ai-improvement.html#edit-predictions)

Edit predictions can be powered by **Zed's Zeta model** or by **third-party providers** like GitHub Copilot.

### [Zed's Zeta Model (Default)](https://zed.dev/docs/ai/ai-improvement.html#zeds-zeta-model-default)

Zed sends a limited context window to the model to generate predictions:

* A code excerpt around your cursor (not the full file)
* Recent edits as diffs
* Relevant excerpts from related open files

This data is processed transiently to generate predictions and is not retained afterward.

### [Third-Party Providers](https://zed.dev/docs/ai/ai-improvement.html#third-party-providers)

When using third-party providers like GitHub Copilot, **Zed does not control how your data is handled** by that provider. You should consult their Terms and Conditions directly.

Note: Zed's `disabled_globs` settings will prevent predictions from being requested, but third-party providers may receive file content when files are opened.

### [Training Data: Opt-In for Open Source Projects](https://zed.dev/docs/ai/ai-improvement.html#training-data-opt-in-for-open-source-projects)

Zed does not collect training data for our edit prediction model unless the following conditions are met:

1. **You opt in** – Toggle "Training Data Collection" under the **Privacy** section of the edit prediction status bar menu (click the edit prediction icon in the status bar).
2. **The project is open source** — detected via LICENSE file ([see detection logic](https://github.com/zed-industries/zed/blob/main/crates/edit_prediction/src/license_detection.rs))
3. **The file isn't excluded** — via `disabled_globs`

### [File Exclusions](https://zed.dev/docs/ai/ai-improvement.html#file-exclusions)

Certain files are always excluded from edit predictions—regardless of opt-in status:

```
{
  "edit_predictions": {
    "disabled_globs": [
      "**/.env*",
      "**/*.pem",
      "**/*.key",
      "**/*.cert",
      "**/*.crt",
      "**/secrets.yml"
    ]
  }
}
```

Users may explicitly exclude additional paths and/or file extensions by adding them to [`edit_predictions.disabled_globs`](https://zed.dev/docs/reference/all-settings.html#edit-predictions) in their Zed settings file ([how to edit](https://zed.dev/docs/configuring-zed.html#settings-files)):

```
{
  "edit_predictions": {
    "disabled_globs": ["secret_dir/*", "**/*.log"]
  }
}
```

### [Data Collected (Edit Prediction Training Data)](https://zed.dev/docs/ai/ai-improvement.html#data-collected-edit-prediction-training-data)

For open source projects where you've opted in, Zed may collect:

* Code excerpt around your cursor
* Recent edit diffs
* The generated prediction
* Repository URL and git revision
* Buffer outline and diagnostics

Collected data is stored in Snowflake. We periodically review this data to select training samples for inclusion in our model training dataset. We ensure any included data is anonymized and contains no sensitive information (access tokens, user IDs, email addresses, etc). This training dataset is publicly available at [huggingface.co/datasets/zed-industries/zeta](https://huggingface.co/datasets/zed-industries/zeta).

### [Model Output](https://zed.dev/docs/ai/ai-improvement.html#model-output)

We then use this training dataset to fine-tune [Qwen2.5-Coder-7B](https://huggingface.co/Qwen/Qwen2.5-Coder-7B) and make the resulting model available at [huggingface.co/zed-industries/zeta](https://huggingface.co/zed-industries/zeta).

## [Applicable terms](https://zed.dev/docs/ai/ai-improvement.html#applicable-terms)

Please see the [Zed Terms of Service](https://zed.dev/terms) for more.

[Worktree Trust](https://zed.dev/docs/worktree-trust.html "Worktree Trust")
[Telemetry](https://zed.dev/docs/telemetry.html "Telemetry")
