---
title: "All Actions | All Actions"
source_url: "https://zed.dev/docs/all-actions"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [All Actions](https://zed.dev/docs/all-actions.html#all-actions)

`action: sequence`
:   Runs a sequence of actions.

    NOTE: This does **not** wait for asynchronous actions to complete before running the next action.
    Keymap Name: `action::Sequence`

`activity indicator: show error message`
:   Displays error messages from language servers in the status bar.
    Keymap Name: `activity_indicator::ShowErrorMessage`

`agent: add context server`
:   Adds a context server to the configuration.
    Keymap Name: `agent::AddContextServer`

`agent: add selection to thread`
:   Add the current selection as context for threads in the agent panel.
    Keymap Name: `agent::AddSelectionToThread`
    Deprecated Alias(es): `assistant::QuoteSelection`, `agent::QuoteSelection`,

`agent: allow always`
:   Allow this operation and remember the choice.
    Keymap Name: `agent::AllowAlways`

`agent: allow once`
:   Allow this operation only this time.
    Keymap Name: `agent::AllowOnce`

`agent: authorize tool call`
:   Action to authorize a tool call with a specific permission option.
    This is used by the permission granularity dropdown to authorize tool calls.
    Keymap Name: `agent::AuthorizeToolCall`

`agent: chat`
:   Starts a chat conversation with the agent.
    Keymap Name: `agent::Chat`

`agent: chat with follow`
:   Starts a chat conversation with follow-up enabled.
    Keymap Name: `agent::ChatWithFollow`

`agent: clear message queue`
:   Clears all messages from the queue.
    Keymap Name: `agent::ClearMessageQueue`

`agent: continue thread`
:   Continues the current thread.
    Keymap Name: `agent::ContinueThread`

`agent: copy thread to clipboard`
:   Copies the current thread to the clipboard as JSON for debugging.
    Keymap Name: `agent::CopyThreadToClipboard`

`agent: cycle favorite models`
:   Cycles through favorited models in the ACP model selector.
    Keymap Name: `agent::CycleFavoriteModels`

`agent: cycle mode selector`
:   Cycles through available session modes.
    Keymap Name: `agent::CycleModeSelector`

`agent: cycle next inline assist`
:   Cycles to the next inline assist suggestion.
    Keymap Name: `agent::CycleNextInlineAssist`

`agent: cycle previous inline assist`
:   Cycles to the previous inline assist suggestion.
    Keymap Name: `agent::CyclePreviousInlineAssist`

`agent: cycle thinking effort`
:   Cycles through available thinking effort levels for the current model.
    Keymap Name: `agent::CycleThinkingEffort`

`agent: edit first queued message`
:   Edits the first message in the queue (the next one to be sent).
    Keymap Name: `agent::EditFirstQueuedMessage`

`agent: expand message editor`
:   Expands the message editor to full size.
    Keymap Name: `agent::ExpandMessageEditor`

`agent: focus down`
:   Moves focus down in the interface.
    Keymap Name: `agent::FocusDown`

`agent: focus left`
:   Moves focus left in the interface.
    Keymap Name: `agent::FocusLeft`

`agent: focus right`
:   Moves focus right in the interface.
    Keymap Name: `agent::FocusRight`

`agent: focus up`
:   Moves focus up in the interface.
    Keymap Name: `agent::FocusUp`

`agent: follow`
:   Follows the agent's suggestions.
    Keymap Name: `agent::Follow`

`agent: keep`
:   Keeps the current suggestion or change.
    Keymap Name: `agent::Keep`

`agent: keep all`
:   Keeps all suggestions or changes.
    Keymap Name: `agent::KeepAll`

`agent: load thread from clipboard`
:   Loads a thread from the clipboard JSON for debugging.
    Keymap Name: `agent::LoadThreadFromClipboard`

`agent: manage profiles`
:   Opens the profile management interface for configuring agent tools and settings.
    Keymap Name: `agent::ManageProfiles`

`agent: new external agent thread`
:   Creates a new external agent conversation thread.
    Keymap Name: `agent::NewExternalAgentThread`

`agent: new native agent thread from summary`
:   Keymap Name: `agent::NewNativeAgentThreadFromSummary`

`agent: new text thread`
:   Creates a new text-based conversation thread.
    Keymap Name: `agent::NewTextThread`

`agent: new thread`
:   Creates a new conversation thread, optionally based on an existing thread.
    Keymap Name: `agent::NewThread`

`agent: open acp onboarding modal`
:   Opens the ACP onboarding modal.
    Keymap Name: `agent::OpenAcpOnboardingModal`

`agent: open active thread as markdown`
:   Opens the active thread as a markdown file.
    Keymap Name: `agent::OpenActiveThreadAsMarkdown`

`agent: open add context menu`
:   Opens the "Add Context" menu in the message editor.
    Keymap Name: `agent::OpenAddContextMenu`

`agent: open agent diff`
:   Opens the agent diff view to review changes.
    Keymap Name: `agent::OpenAgentDiff`

`agent: open claude agent onboarding modal`
:   Opens the Claude Agent onboarding modal.
    Keymap Name: `agent::OpenClaudeAgentOnboardingModal`

`agent: open history`
:   Opens the conversation history view.
    Keymap Name: `agent::OpenHistory`

`agent: open onboarding modal`
:   Opens the agent onboarding modal.
    Keymap Name: `agent::OpenOnboardingModal`

`agent: open permission dropdown`
:   Opens the permission granularity dropdown for the current tool call.
    Keymap Name: `agent::OpenPermissionDropdown`

`agent: open rules library`
:   Opens the rules library for managing agent rules and prompts.
    Keymap Name: `agent::OpenRulesLibrary`
    Deprecated Alias(es): `assistant::OpenRulesLibrary`, `assistant::DeployPromptLibrary`,

`agent: open settings`
:   Opens the agent settings panel.
    Keymap Name: `agent::OpenSettings`
    Deprecated Alias(es): `agent::OpenConfiguration`,

`agent: paste raw`
:   Pastes clipboard content without any formatting.
    Keymap Name: `agent::PasteRaw`

`agent: reauthenticate agent`
:   Triggers re-authentication on Gemini
    Keymap Name: `agent::ReauthenticateAgent`

`agent: reject`
:   Rejects the current suggestion or change.
    Keymap Name: `agent::Reject`

`agent: reject all`
:   Rejects all suggestions or changes.
    Keymap Name: `agent::RejectAll`

`agent: reject once`
:   Reject this operation only this time.
    Keymap Name: `agent::RejectOnce`

`agent: remove first queued message`
:   Removes the first message from the queue (the next one to be sent).
    Keymap Name: `agent::RemoveFirstQueuedMessage`

`agent: remove history`
:   Removes all thread history.
    Keymap Name: `agent::RemoveHistory`

`agent: remove selected thread`
:   Removes the currently selected thread.
    Keymap Name: `agent::RemoveSelectedThread`

`agent: reset agent zoom`
:   Resets the agent panel zoom levels (agent UI and buffer font sizes).
    Keymap Name: `agent::ResetAgentZoom`

`agent: reset onboarding`
:   Resets the agent onboarding state.
    Keymap Name: `agent::ResetOnboarding`

`agent: reset trial end upsell`
:   Resets the trial end upsell notification.
    Keymap Name: `agent::ResetTrialEndUpsell`

`agent: reset trial upsell`
:   Resets the trial upsell notification.
    Keymap Name: `agent::ResetTrialUpsell`

`agent: review branch diff`
:   Opens a new agent thread with the provided branch diff for review.
    Keymap Name: `agent::ReviewBranchDiff`

`agent: send immediately`
:   Interrupts the current generation and sends the message immediately.
    Keymap Name: `agent::SendImmediately`

`agent: send next queued message`
:   Sends the next queued message immediately.
    Keymap Name: `agent::SendNextQueuedMessage`

`agent: start thread in`
:   Sets where new threads will run.
    Keymap Name: `agent::StartThreadIn`

`agent: toggle`
:   Toggles the agent panel.
    Keymap Name: `agent::Toggle`

`agent: toggle fast mode`
:   Toggles fast mode for models that support it.
    Keymap Name: `agent::ToggleFastMode`

`agent: toggle focus`
:   Keymap Name: `agent::ToggleFocus`
    Deprecated Alias(es): `assistant::ToggleFocus`,

`agent: toggle model selector`
:   Toggles the language model selector dropdown.
    Keymap Name: `agent::ToggleModelSelector`
    Deprecated Alias(es): `assistant::ToggleModelSelector`, `assistant2::ToggleModelSelector`,

`agent: toggle navigation menu`
:   Toggles the navigation menu for switching between threads and views.
    Keymap Name: `agent::ToggleNavigationMenu`

`agent: toggle new thread menu`
:   Toggles the menu to create new agent threads.
    Keymap Name: `agent::ToggleNewThreadMenu`

`agent: toggle options menu`
:   Toggles the options menu for agent settings and preferences.
    Keymap Name: `agent::ToggleOptionsMenu`

`agent: toggle profile selector`
:   Toggles the profile or mode selector for switching between agent profiles.
    Keymap Name: `agent::ToggleProfileSelector`

`agent: toggle thinking effort menu`
:   Toggles the thinking effort selector menu open or closed.
    Keymap Name: `agent::ToggleThinkingEffortMenu`

`agent: toggle thinking mode`
:   Toggles thinking mode for models that support extended thinking.
    Keymap Name: `agent::ToggleThinkingMode`

`agent: undo last reject`
:   Undoes the most recent reject operation, restoring the rejected changes.
    Keymap Name: `agent::UndoLastReject`

`app menu: activate menu left`
:   Activates the menu on the left in the client-side application menu.

    Does not apply to platform menu bars (e.g. on macOS).
    Keymap Name: `app_menu::ActivateMenuLeft`

`app menu: activate menu right`
:   Activates the menu on the right in the client-side application menu.

    Does not apply to platform menu bars (e.g. on macOS).
    Keymap Name: `app_menu::ActivateMenuRight`

`app menu: open application menu`
:   Opens the named menu in the client-side application menu.

    Does not apply to platform menu bars (e.g. on macOS).
    Keymap Name: `app_menu::OpenApplicationMenu`

`assistant: assist`
:   Sends the current message to the assistant.
    Keymap Name: `assistant::Assist`

`assistant: confirm command`
:   Confirms and executes the entered slash command.
    Keymap Name: `assistant::ConfirmCommand`

`assistant: copy code`
:   Copies code from the assistant's response to the clipboard.
    Keymap Name: `assistant::CopyCode`

`assistant: cycle message role`
:   Cycles between user and assistant message roles.
    Keymap Name: `assistant::CycleMessageRole`

`assistant: inline assist`
:   Deploys the assistant interface with the specified configuration.
    Keymap Name: `assistant::InlineAssist`

`assistant: insert into editor`
:   Inserts the selected text into the active editor.
    Keymap Name: `assistant::InsertIntoEditor`

`assistant: show configuration`
:   Shows the assistant configuration panel.
    Keymap Name: `assistant::ShowConfiguration`

`assistant: split`
:   Splits the conversation at the current cursor position.
    Keymap Name: `assistant::Split`

`auto update: check`
:   Checks for available updates.
    Keymap Name: `auto_update::Check`

`auto update: dismiss message`
:   Dismisses the update error message.
    Keymap Name: `auto_update::DismissMessage`

`auto update: view release notes`
:   Opens the release notes for the current version in a browser.
    Keymap Name: `auto_update::ViewReleaseNotes`

`auto update: view release notes locally`
:   Opens the release notes for the current version in a new tab.
    Keymap Name: `auto_update::ViewReleaseNotesLocally`

`bedrock: tab`
:   Keymap Name: `bedrock::Tab`

`bedrock: tab prev`
:   Keymap Name: `bedrock::TabPrev`

`branch picker: delete branch`
:   Deletes the selected git branch or remote.
    Keymap Name: `branch_picker::DeleteBranch`

`branch picker: filter remotes`
:   Filter the list of remotes
    Keymap Name: `branch_picker::FilterRemotes`

`buffer search: deploy`
:   Opens the buffer search interface with the specified configuration.
    Keymap Name: `buffer_search::Deploy`

`buffer search: deploy replace`
:   Deploys the search and replace interface.
    Keymap Name: `buffer_search::DeployReplace`

`buffer search: dismiss`
:   Dismisses the search bar.
    Keymap Name: `buffer_search::Dismiss`

`buffer search: focus editor`
:   Focuses back on the editor.
    Keymap Name: `buffer_search::FocusEditor`

`channel modal: remove member`
:   Removes the selected member from the channel.
    Keymap Name: `channel_modal::RemoveMember`

`channel modal: select next control`
:   Selects the next control in the channel modal.
    Keymap Name: `channel_modal::SelectNextControl`

`channel modal: toggle member admin`
:   Toggles admin status for the selected member.
    Keymap Name: `channel_modal::ToggleMemberAdmin`

`channel modal: toggle mode`
:   Toggles between invite members and manage members mode.
    Keymap Name: `channel_modal::ToggleMode`

`cli: install cli binary`
:   Installs the Zed CLI tool to the system PATH.
    Keymap Name: `cli::InstallCliBinary`

`cli: register zed scheme`
:   Registers the zed:// URL scheme handler.
    Keymap Name: `cli::RegisterZedScheme`

`client: reconnect`
:   Reconnects to the collaboration server.
    Keymap Name: `client::Reconnect`

`client: sign in`
:   Signs in to Zed account.
    Keymap Name: `client::SignIn`

`client: sign out`
:   Signs out of Zed account.
    Keymap Name: `client::SignOut`

`collab: copy link`
:   Copies a link to the current position in the channel buffer.
    Keymap Name: `collab::CopyLink`

`collab: copy room id`
:   Copies the current room name and session id for debugging purposes.
    Keymap Name: `collab::CopyRoomId`

`collab: deafen`
:   Deafens yourself (mute both microphone and speakers).
    Keymap Name: `collab::Deafen`

`collab: leave call`
:   Leaves the current call.
    Keymap Name: `collab::LeaveCall`

`collab: mute`
:   Mutes your microphone.
    Keymap Name: `collab::Mute`

`collab: open channel notes`
:   Opens the channel notes for the current call.

    Use `collab_panel::OpenSelectedChannelNotes` to open the channel notes for the selected
    channel in the collab panel.

    If you want to open a specific channel, use `zed::OpenZedUrl` with a channel notes URL -
    can be copied via "Copy link to section" in the context menu of the channel notes
    buffer. These URLs look like `https://zed.dev/channel/channel-name-CHANNEL_ID/notes`.
    Keymap Name: `collab::OpenChannelNotes`

`collab: screen share`
:   Shares your screen with collaborators.
    Keymap Name: `collab::ScreenShare`

`collab: share project`
:   Shares the current project with collaborators.
    Keymap Name: `collab::ShareProject`

`collab: simulate update available`
:   A debug action to simulate an update being available to test the update banner UI.
    Keymap Name: `collab::SimulateUpdateAvailable`

`collab: switch branch`
:   Switches to a different git branch.
    Keymap Name: `collab::SwitchBranch`

`collab: toggle project menu`
:   Toggles the project menu dropdown.
    Keymap Name: `collab::ToggleProjectMenu`

`collab: toggle user menu`
:   Toggles the user menu dropdown.
    Keymap Name: `collab::ToggleUserMenu`

`collab panel: collapse selected channel`
:   Collapses the selected channel in the tree view.
    Keymap Name: `collab_panel::CollapseSelectedChannel`

`collab panel: expand selected channel`
:   Expands the selected channel in the tree view.
    Keymap Name: `collab_panel::ExpandSelectedChannel`

`collab panel: insert space`
:   Inserts a space character in the filter input.
    Keymap Name: `collab_panel::InsertSpace`

`collab panel: move channel down`
:   Moves the selected channel down in the list.
    Keymap Name: `collab_panel::MoveChannelDown`

`collab panel: move channel up`
:   Moves the selected channel up in the list.
    Keymap Name: `collab_panel::MoveChannelUp`

`collab panel: move selected`
:   Moves the selected item to the current location.
    Keymap Name: `collab_panel::MoveSelected`

`collab panel: open selected channel notes`
:   Opens the meeting notes for the selected channel in the panel.

    Use `collab::OpenChannelNotes` to open the channel notes for the current call.
    Keymap Name: `collab_panel::OpenSelectedChannelNotes`

`collab panel: remove`
:   Removes the selected channel or contact.
    Keymap Name: `collab_panel::Remove`

`collab panel: secondary`
:   Opens the context menu for the selected item.
    Keymap Name: `collab_panel::Secondary`

`collab panel: start move channel`
:   Starts moving a channel to a new location.
    Keymap Name: `collab_panel::StartMoveChannel`

`collab panel: toggle`
:   Toggles the collab panel.
    Keymap Name: `collab_panel::Toggle`

`collab panel: toggle focus`
:   Toggles focus on the collaboration panel.
    Keymap Name: `collab_panel::ToggleFocus`

`command palette: toggle`
:   Toggles the command palette.
    Keymap Name: `command_palette::Toggle`

`console: watch expression`
:   Adds an expression to the watch list.
    Keymap Name: `console::WatchExpression`

`context server: restart`
:   Restarts the context server.
    Keymap Name: `context_server::Restart`

`copilot: next suggestion`
:   Cycles to the next Copilot suggestion.
    Keymap Name: `copilot::NextSuggestion`

`copilot: previous suggestion`
:   Cycles to the previous Copilot suggestion.
    Keymap Name: `copilot::PreviousSuggestion`

`copilot: reinstall`
:   Reinstalls the Copilot language server.
    Keymap Name: `copilot::Reinstall`

`copilot: sign in`
:   Signs in to GitHub Copilot.
    Keymap Name: `copilot::SignIn`

`copilot: sign out`
:   Signs out of GitHub Copilot.
    Keymap Name: `copilot::SignOut`

`copilot: suggest`
:   Requests a code completion suggestion from Copilot.
    Keymap Name: `copilot::Suggest`

`csv: open preview`
:   Keymap Name: `csv::OpenPreview`

`csv: open preview to the side`
:   Keymap Name: `csv::OpenPreviewToTheSide`

`debug panel: toggle`
:   Toggles the debug panel.
    Keymap Name: `debug_panel::Toggle`

`debug panel: toggle focus`
:   Toggles focus on the debug panel.
    Keymap Name: `debug_panel::ToggleFocus`

`debugger: clear all breakpoints`
:   Clears all breakpoints in the project.
    Keymap Name: `debugger::ClearAllBreakpoints`

`debugger: continue`
:   Continues execution until the next breakpoint.
    Keymap Name: `debugger::Continue`

`debugger: detach`
:   Detaches the debugger from the running process.
    Keymap Name: `debugger::Detach`

`debugger: evaluate selected text`
:   Evaluates the selected text in the debugger context.
    Keymap Name: `debugger::EvaluateSelectedText`

`debugger: focus breakpoint list`
:   Focuses on the breakpoint list panel.
    Keymap Name: `debugger::FocusBreakpointList`

`debugger: focus console`
:   Focuses on the debugger console panel.
    Keymap Name: `debugger::FocusConsole`

`debugger: focus frames`
:   Focuses on the call stack frames panel.
    Keymap Name: `debugger::FocusFrames`

`debugger: focus loaded sources`
:   Focuses on the loaded sources panel.
    Keymap Name: `debugger::FocusLoadedSources`

`debugger: focus modules`
:   Focuses on the loaded modules panel.
    Keymap Name: `debugger::FocusModules`

`debugger: focus terminal`
:   Focuses on the terminal panel.
    Keymap Name: `debugger::FocusTerminal`

`debugger: focus variables`
:   Focuses on the variables panel.
    Keymap Name: `debugger::FocusVariables`

`debugger: go to selected address`
:   Keymap Name: `debugger::GoToSelectedAddress`

`debugger: next breakpoint property`
:   Navigates to the next breakpoint property in the list.
    Keymap Name: `debugger::NextBreakpointProperty`

`debugger: open project debug tasks`
:   Opens the project debug tasks configuration.
    Keymap Name: `debugger::OpenProjectDebugTasks`

`debugger: pause`
:   Pauses the currently running program.
    Keymap Name: `debugger::Pause`

`debugger: previous breakpoint property`
:   Navigates to the previous breakpoint property in the list.
    Keymap Name: `debugger::PreviousBreakpointProperty`

`debugger: rerun`
:   Reruns the last debugging session.
    Keymap Name: `debugger::Rerun`
    Deprecated Alias(es): `debugger::RerunLastSession`,

`debugger: rerun session`
:   Reruns the current debugging session with the same configuration.
    Keymap Name: `debugger::RerunSession`

`debugger: restart`
:   Restarts the current debugging session.
    Keymap Name: `debugger::Restart`

`debugger: run to cursor`
:   Runs program execution to the current cursor position.
    Keymap Name: `debugger::RunToCursor`

`debugger: start`
:   Starts a new debugging session.
    Keymap Name: `debugger::Start`

`debugger: step back`
:   Steps back to the previous statement.
    Keymap Name: `debugger::StepBack`

`debugger: step into`
:   Steps into the next function call.
    Keymap Name: `debugger::StepInto`

`debugger: step out`
:   Steps out of the current function.
    Keymap Name: `debugger::StepOut`

`debugger: step over`
:   Steps over the current line.
    Keymap Name: `debugger::StepOver`

`debugger: stop`
:   Stops the debugging session.
    Keymap Name: `debugger::Stop`

`debugger: toggle data breakpoint`
:   Set a data breakpoint on the selected variable or memory region.
    Keymap Name: `debugger::ToggleDataBreakpoint`

`debugger: toggle enable breakpoint`
:   Toggles the enabled state of a breakpoint.
    Keymap Name: `debugger::ToggleEnableBreakpoint`

`debugger: toggle expand item`
:   Toggles expansion of the selected item in the debugger UI.
    Keymap Name: `debugger::ToggleExpandItem`

`debugger: toggle ignore breakpoints`
:   Toggles whether to ignore all breakpoints.
    Keymap Name: `debugger::ToggleIgnoreBreakpoints`

`debugger: toggle session picker`
:   Toggles the session picker dropdown.
    Keymap Name: `debugger::ToggleSessionPicker`

`debugger: toggle thread picker`
:   Toggles the thread picker dropdown.
    Keymap Name: `debugger::ToggleThreadPicker`

`debugger: toggle user frames`
:   Toggle the user frame filter in the stack frame list
    When toggled on, only frames from the user's code are shown
    When toggled off, all frames are shown
    Keymap Name: `debugger::ToggleUserFrames`

`debugger: unset breakpoint`
:   Removes a breakpoint.
    Keymap Name: `debugger::UnsetBreakpoint`

`dev: capture recent audio`
:   Stores last 30s of audio from zed staff using the experimental rodio
    audio system (including yourself) on the current call in a tar file
    in the current working directory.
    Keymap Name: `dev::CaptureRecentAudio`

`dev: copy debug adapter arguments`
:   Copies debug adapter launch arguments to clipboard.
    Keymap Name: `dev::CopyDebugAdapterArguments`

`dev: edit prediction context go back`
:   Go to the previous context retrieval run
    Keymap Name: `dev::EditPredictionContextGoBack`

`dev: edit prediction context go forward`
:   Go to the next context retrieval run
    Keymap Name: `dev::EditPredictionContextGoForward`

`dev: open acp logs`
:   Keymap Name: `dev::OpenAcpLogs`

`dev: open debug adapter logs`
:   Opens the debug adapter protocol logs viewer.
    Keymap Name: `dev::OpenDebugAdapterLogs`

`dev: open edit prediction context view`
:   Opens the edit prediction context view.
    Keymap Name: `dev::OpenEditPredictionContextView`

`dev: open highlights tree view`
:   Opens the highlights tree view for the current file.
    Keymap Name: `dev::OpenHighlightsTreeView`

`dev: open key context view`
:   Opens the key context view for debugging keybindings.
    Keymap Name: `dev::OpenKeyContextView`

`dev: open language server logs`
:   Opens the language server protocol logs viewer.
    Keymap Name: `dev::OpenLanguageServerLogs`

`dev: open syntax tree view`
:   Opens the syntax tree view for the current file.
    Keymap Name: `dev::OpenSyntaxTreeView`

`dev: open theme preview`
:   Opens the theme preview window.
    Keymap Name: `dev::OpenThemePreview`

`dev: open url prompt`
:   Opens a prompt to enter a URL to open.
    Keymap Name: `dev::OpenUrlPrompt`

`dev: toggle inspector`
:   Toggles the developer inspector for debugging UI elements.
    Keymap Name: `dev::ToggleInspector`

`diagnostics: deploy`
:   Opens the project diagnostics view.
    Keymap Name: `diagnostics::Deploy`

`diagnostics: deploy current file`
:   Opens the project diagnostics view for the currently focused file.
    Keymap Name: `diagnostics::DeployCurrentFile`

`diagnostics: toggle diagnostics refresh`
:   Toggles automatic refresh of diagnostics.
    Keymap Name: `diagnostics::ToggleDiagnosticsRefresh`

`diagnostics: toggle warnings`
:   Toggles the display of warning-level diagnostics.
    Keymap Name: `diagnostics::ToggleWarnings`

`edit prediction: capture example`
:   Captures an ExampleSpec from the current editing session and opens it as Markdown.
    Keymap Name: `edit_prediction::CaptureExample`

`edit prediction: clear history`
:   Clears the edit prediction history.
    Keymap Name: `edit_prediction::ClearHistory`

`edit prediction: rate predictions`
:   Opens the rate completions modal.
    Keymap Name: `edit_prediction::RatePredictions`

`edit prediction: reset onboarding`
:   Resets the edit prediction onboarding state.
    Keymap Name: `edit_prediction::ResetOnboarding`

`edit prediction: toggle menu`
:   Toggles the edit prediction menu.
    Keymap Name: `edit_prediction::ToggleMenu`

`editor: accept edit prediction`
:   Accepts the full edit prediction.
    Keymap Name: `editor::AcceptEditPrediction`

`editor: accept next line edit prediction`
:   Keymap Name: `editor::AcceptNextLineEditPrediction`

`editor: accept next word edit prediction`
:   Accepts a partial edit prediction.
    Keymap Name: `editor::AcceptNextWordEditPrediction`
    Deprecated Alias(es): `editor::AcceptPartialCopilotSuggestion`,

`editor: add selection above`
:   Adds a cursor above the current selection.
    Keymap Name: `editor::AddSelectionAbove`

`editor: add selection below`
:   Adds a cursor below the current selection.
    Keymap Name: `editor::AddSelectionBelow`

`editor: apply all diff hunks`
:   Applies all diff hunks in the editor.
    Keymap Name: `editor::ApplyAllDiffHunks`

`editor: apply diff hunk`
:   Applies the diff hunk at the current position.
    Keymap Name: `editor::ApplyDiffHunk`

`editor: auto indent`
:   Automatically adjusts indentation based on context.
    Keymap Name: `editor::AutoIndent`

`editor: backspace`
:   Deletes the character before the cursor.
    Keymap Name: `editor::Backspace`

`editor: backtab`
:   Removes a tab character or outdents.
    Keymap Name: `editor::Backtab`

`editor: blame hover`
:   Shows git blame information for the current line.
    Keymap Name: `editor::BlameHover`

`editor: cancel`
:   Cancels the current operation.
    Keymap Name: `editor::Cancel`

`editor: cancel edit review comment`
:   Cancels an inline edit of a review comment.
    Keymap Name: `editor::CancelEditReviewComment`

`editor: cancel flycheck`
:   Cancels the running flycheck operation.
    Keymap Name: `editor::CancelFlycheck`

`editor: cancel language server work`
:   Cancels pending language server work.
    Keymap Name: `editor::CancelLanguageServerWork`

`editor: clear flycheck`
:   Clears flycheck results.
    Keymap Name: `editor::ClearFlycheck`

`editor: collapse all diff hunks`
:   Collapses all diff hunks in the editor.
    Keymap Name: `editor::CollapseAllDiffHunks`

`editor: compose completion`
:   Composes multiple completion suggestions into a single completion.
    Keymap Name: `editor::ComposeCompletion`

`editor: confirm code action`
:   Confirms and applies the currently selected code action.
    Keymap Name: `editor::ConfirmCodeAction`

`editor: confirm completion`
:   Confirms and accepts the currently selected completion suggestion.
    Keymap Name: `editor::ConfirmCompletion`

`editor: confirm completion insert`
:   Confirms completion by inserting at cursor.
    Keymap Name: `editor::ConfirmCompletionInsert`

`editor: confirm completion replace`
:   Confirms completion by replacing existing text.
    Keymap Name: `editor::ConfirmCompletionReplace`

`editor: confirm edit review comment`
:   Confirms an inline edit of a review comment.
    Keymap Name: `editor::ConfirmEditReviewComment`

`editor: confirm rename`
:   Confirms the rename operation.
    Keymap Name: `editor::ConfirmRename`

`editor: context menu first`
:   Navigates to the first item in the context menu.
    Keymap Name: `editor::ContextMenuFirst`

`editor: context menu last`
:   Navigates to the last item in the context menu.
    Keymap Name: `editor::ContextMenuLast`

`editor: context menu next`
:   Navigates to the next item in the context menu.
    Keymap Name: `editor::ContextMenuNext`

`editor: context menu previous`
:   Navigates to the previous item in the context menu.
    Keymap Name: `editor::ContextMenuPrevious`

`editor: convert indentation to spaces`
:   Converts indentation from tabs to spaces.
    Keymap Name: `editor::ConvertIndentationToSpaces`

`editor: convert indentation to tabs`
:   Converts indentation from spaces to tabs.
    Keymap Name: `editor::ConvertIndentationToTabs`

`editor: convert to kebab case`
:   Converts selected text to kebab-case.
    Keymap Name: `editor::ConvertToKebabCase`

`editor: convert to lower camel case`
:   Converts selected text to lowerCamelCase.
    Keymap Name: `editor::ConvertToLowerCamelCase`

`editor: convert to lower case`
:   Converts selected text to lowercase.
    Keymap Name: `editor::ConvertToLowerCase`

`editor: convert to opposite case`
:   Toggles the case of selected text.
    Keymap Name: `editor::ConvertToOppositeCase`

`editor: convert to rot13`
:   Applies ROT13 cipher to selected text.
    Keymap Name: `editor::ConvertToRot13`

`editor: convert to rot47`
:   Applies ROT47 cipher to selected text.
    Keymap Name: `editor::ConvertToRot47`

`editor: convert to sentence case`
:   Converts selected text to sentence case.
    Keymap Name: `editor::ConvertToSentenceCase`

`editor: convert to snake case`
:   Converts selected text to snake\_case.
    Keymap Name: `editor::ConvertToSnakeCase`

`editor: convert to title case`
:   Converts selected text to Title Case.
    Keymap Name: `editor::ConvertToTitleCase`

`editor: convert to upper camel case`
:   Converts selected text to UpperCamelCase.
    Keymap Name: `editor::ConvertToUpperCamelCase`

`editor: convert to upper case`
:   Converts selected text to UPPERCASE.
    Keymap Name: `editor::ConvertToUpperCase`

`editor: copy`
:   Copies selected text to the clipboard.
    Keymap Name: `editor::Copy`

`editor: copy and trim`
:   Copies selected text to the clipboard with leading/trailing whitespace trimmed.
    Keymap Name: `editor::CopyAndTrim`

`editor: copy file location`
:   Copies the current file location to the clipboard.
    Keymap Name: `editor::CopyFileLocation`

`editor: copy file name`
:   Copies the current file name to the clipboard.
    Keymap Name: `editor::CopyFileName`

`editor: copy file name without extension`
:   Copies the file name without extension to the clipboard.
    Keymap Name: `editor::CopyFileNameWithoutExtension`

`editor: copy highlight json`
:   Copies the highlighted text as JSON.
    Keymap Name: `editor::CopyHighlightJson`

`editor: copy permalink to line`
:   Copies a permalink to the current line.
    Keymap Name: `editor::CopyPermalinkToLine`

`editor: cut`
:   Cuts selected text to the clipboard.
    Keymap Name: `editor::Cut`

`editor: cut to end of line`
:   Cuts from cursor to end of line.
    Keymap Name: `editor::CutToEndOfLine`

`editor: delete`
:   Deletes the character after the cursor.
    Keymap Name: `editor::Delete`

`editor: delete line`
:   Deletes the current line.
    Keymap Name: `editor::DeleteLine`

`editor: delete review comment`
:   Deletes a stored review comment.
    Keymap Name: `editor::DeleteReviewComment`

`editor: delete to beginning of line`
:   Deletes from the cursor to the beginning of the current line.
    Keymap Name: `editor::DeleteToBeginningOfLine`

`editor: delete to end of line`
:   Deletes from cursor to end of line.
    Keymap Name: `editor::DeleteToEndOfLine`

`editor: delete to next subword end`
:   Deletes from the cursor to the end of the next subword.
    Stops before the end of the next subword, if whitespace sequences of length >= 2 are encountered.
    Keymap Name: `editor::DeleteToNextSubwordEnd`

`editor: delete to next word end`
:   Deletes from the cursor to the end of the next word.
    Stops before the end of the next word, if whitespace sequences of length >= 2 are encountered.
    Keymap Name: `editor::DeleteToNextWordEnd`

`editor: delete to previous subword start`
:   Deletes from the cursor to the start of the previous subword.
    Stops before the start of the previous subword, if whitespace sequences of length >= 2 are encountered.
    Keymap Name: `editor::DeleteToPreviousSubwordStart`

`editor: delete to previous word start`
:   Deletes from the cursor to the start of the previous word.
    Stops before the start of the previous word, if whitespace sequences of length >= 2 are encountered.
    Keymap Name: `editor::DeleteToPreviousWordStart`

`editor: diff clipboard with selection`
:   Diffs the text stored in the clipboard against the current selection.
    Keymap Name: `editor::DiffClipboardWithSelection`

`editor: disable breakpoint`
:   Disables the breakpoint at the current line.
    Keymap Name: `editor::DisableBreakpoint`

`editor: display cursor names`
:   Displays names of all active cursors.
    Keymap Name: `editor::DisplayCursorNames`

`editor: duplicate line down`
:   Duplicates the current line below.
    Keymap Name: `editor::DuplicateLineDown`

`editor: duplicate line up`
:   Duplicates the current line above.
    Keymap Name: `editor::DuplicateLineUp`

`editor: duplicate selection`
:   Duplicates the current selection.
    Keymap Name: `editor::DuplicateSelection`

`editor: edit log breakpoint`
:   Edits the log message for a breakpoint.
    Keymap Name: `editor::EditLogBreakpoint`

`editor: edit review comment`
:   Edits a stored review comment inline.
    Keymap Name: `editor::EditReviewComment`

`editor: enable breakpoint`
:   Enables the breakpoint at the current line.
    Keymap Name: `editor::EnableBreakpoint`

`editor: expand all diff hunks`
:   Expands all diff hunks in the editor.
    Keymap Name: `editor::ExpandAllDiffHunks`
    Deprecated Alias(es): `editor::ExpandAllHunkDiffs`,

`editor: expand excerpts`
:   Expands all excerpts in the editor.
    Keymap Name: `editor::ExpandExcerpts`

`editor: expand excerpts down`
:   Expands excerpts below the current position.
    Keymap Name: `editor::ExpandExcerptsDown`

`editor: expand excerpts up`
:   Expands excerpts above the current position.
    Keymap Name: `editor::ExpandExcerptsUp`

`editor: expand macro recursively`
:   Expands macros recursively at cursor position.
    Keymap Name: `editor::ExpandMacroRecursively`

`editor: find all references`
:   Finds all references to the symbol at cursor.
    Keymap Name: `editor::FindAllReferences`

`editor: find next match`
:   Finds the next match in the search.
    Keymap Name: `editor::FindNextMatch`

`editor: find previous match`
:   Finds the previous match in the search.
    Keymap Name: `editor::FindPreviousMatch`

`editor: fold`
:   Folds the current code block.
    Keymap Name: `editor::Fold`

`editor: fold all`
:   Folds all foldable regions in the editor.
    Keymap Name: `editor::FoldAll`

`editor: fold at level`
:   Folds all code blocks at the specified indentation level.
    Keymap Name: `editor::FoldAtLevel`

`editor: fold at level 1`
:   Folds all code blocks at indentation level 1.
    Keymap Name: `editor::FoldAtLevel_1`

`editor: fold at level 2`
:   Folds all code blocks at indentation level 2.
    Keymap Name: `editor::FoldAtLevel_2`

`editor: fold at level 3`
:   Folds all code blocks at indentation level 3.
    Keymap Name: `editor::FoldAtLevel_3`

`editor: fold at level 4`
:   Folds all code blocks at indentation level 4.
    Keymap Name: `editor::FoldAtLevel_4`

`editor: fold at level 5`
:   Folds all code blocks at indentation level 5.
    Keymap Name: `editor::FoldAtLevel_5`

`editor: fold at level 6`
:   Folds all code blocks at indentation level 6.
    Keymap Name: `editor::FoldAtLevel_6`

`editor: fold at level 7`
:   Folds all code blocks at indentation level 7.
    Keymap Name: `editor::FoldAtLevel_7`

`editor: fold at level 8`
:   Folds all code blocks at indentation level 8.
    Keymap Name: `editor::FoldAtLevel_8`

`editor: fold at level 9`
:   Folds all code blocks at indentation level 9.
    Keymap Name: `editor::FoldAtLevel_9`

`editor: fold function bodies`
:   Folds all function bodies in the editor.
    Keymap Name: `editor::FoldFunctionBodies`

`editor: fold recursive`
:   Folds the current code block and all its children.
    Keymap Name: `editor::FoldRecursive`

`editor: fold selected ranges`
:   Folds the selected ranges.
    Keymap Name: `editor::FoldSelectedRanges`

`editor: format`
:   Formats the entire document.
    Keymap Name: `editor::Format`

`editor: format selections`
:   Formats only the selected text.
    Keymap Name: `editor::FormatSelections`

`editor: go to declaration`
:   Goes to the declaration of the symbol at cursor.
    Keymap Name: `editor::GoToDeclaration`

`editor: go to declaration split`
:   Goes to declaration in a split pane.
    Keymap Name: `editor::GoToDeclarationSplit`

`editor: go to definition`
:   Goes to the definition of the symbol at cursor.
    Keymap Name: `editor::GoToDefinition`

`editor: go to definition split`
:   Goes to definition in a split pane.
    Keymap Name: `editor::GoToDefinitionSplit`

`editor: go to diagnostic`
:   Goes to the next diagnostic in the file.
    Keymap Name: `editor::GoToDiagnostic`

`editor: go to hunk`
:   Goes to the next diff hunk.
    Keymap Name: `editor::GoToHunk`

`editor: go to implementation`
:   Goes to the implementation of the symbol at cursor.
    Keymap Name: `editor::GoToImplementation`

`editor: go to implementation split`
:   Goes to implementation in a split pane.
    Keymap Name: `editor::GoToImplementationSplit`

`editor: go to next change`
:   Goes to the next change in the file.
    Keymap Name: `editor::GoToNextChange`

`editor: go to next document highlight`
:   Goes to the next document highlight.
    Keymap Name: `editor::GoToNextDocumentHighlight`

`editor: go to next reference`
:   Goes to the next reference to the symbol under the cursor.
    Keymap Name: `editor::GoToNextReference`

`editor: go to parent module`
:   Goes to the parent module of the current file.
    Keymap Name: `editor::GoToParentModule`

`editor: go to previous change`
:   Goes to the previous change in the file.
    Keymap Name: `editor::GoToPreviousChange`

`editor: go to previous diagnostic`
:   Goes to the previous diagnostic in the file.
    Keymap Name: `editor::GoToPreviousDiagnostic`

`editor: go to previous document highlight`
:   Goes to the previous document highlight.
    Keymap Name: `editor::GoToPreviousDocumentHighlight`

`editor: go to previous hunk`
:   Goes to the previous diff hunk.
    Keymap Name: `editor::GoToPreviousHunk`

`editor: go to previous reference`
:   Goes to the previous reference to the symbol under the cursor.
    Keymap Name: `editor::GoToPreviousReference`

`editor: go to type definition`
:   Goes to the type definition of the symbol at cursor.
    Keymap Name: `editor::GoToTypeDefinition`

`editor: go to type definition split`
:   Goes to type definition in a split pane.
    Keymap Name: `editor::GoToTypeDefinitionSplit`

`editor: half page down`
:   Scrolls down by half a page.
    Keymap Name: `editor::HalfPageDown`

`editor: half page up`
:   Scrolls up by half a page.
    Keymap Name: `editor::HalfPageUp`

`editor: handle input`
:   Handles text input in the editor.
    Keymap Name: `editor::HandleInput`

`editor: hover`
:   Shows hover information for the symbol at cursor.
    Keymap Name: `editor::Hover`

`editor: indent`
:   Increases indentation of selected lines.
    Keymap Name: `editor::Indent`

`editor: insert snippet`
:   Inserts a snippet at the cursor.
    Keymap Name: `editor::InsertSnippet`

`editor: insert uuid v4`
:   Inserts a UUID v4 at cursor position.
    Keymap Name: `editor::InsertUuidV4`

`editor: insert uuid v7`
:   Inserts a UUID v7 at cursor position.
    Keymap Name: `editor::InsertUuidV7`

`editor: join lines`
:   Joins the current line with the next line.
    Keymap Name: `editor::JoinLines`

`editor: kill ring cut`
:   Cuts to kill ring (Emacs-style).
    Keymap Name: `editor::KillRingCut`

`editor: kill ring yank`
:   Yanks from kill ring (Emacs-style).
    Keymap Name: `editor::KillRingYank`

`editor: line down`
:   Moves cursor down one line.
    Keymap Name: `editor::LineDown`

`editor: line up`
:   Moves cursor up one line.
    Keymap Name: `editor::LineUp`

`editor: move down`
:   Moves cursor down.
    Keymap Name: `editor::MoveDown`

`editor: move down by lines`
:   Moves the cursor down by a specified number of lines.
    Keymap Name: `editor::MoveDownByLines`

`editor: move left`
:   Moves cursor left.
    Keymap Name: `editor::MoveLeft`

`editor: move line down`
:   Moves the current line down.
    Keymap Name: `editor::MoveLineDown`

`editor: move line up`
:   Moves the current line up.
    Keymap Name: `editor::MoveLineUp`

`editor: move page down`
:   Moves the cursor down by one page.
    Keymap Name: `editor::MovePageDown`

`editor: move page up`
:   Moves the cursor up by one page.
    Keymap Name: `editor::MovePageUp`

`editor: move right`
:   Moves cursor right.
    Keymap Name: `editor::MoveRight`

`editor: move to beginning`
:   Moves cursor to the beginning of the document.
    Keymap Name: `editor::MoveToBeginning`

`editor: move to beginning of line`
:   Moves the cursor to the beginning of the current line.
    Keymap Name: `editor::MoveToBeginningOfLine`

`editor: move to enclosing bracket`
:   Moves cursor to the enclosing bracket.
    Keymap Name: `editor::MoveToEnclosingBracket`

`editor: move to end`
:   Moves cursor to the end of the document.
    Keymap Name: `editor::MoveToEnd`

`editor: move to end of excerpt`
:   Moves cursor to the end of the current excerpt.
    Keymap Name: `editor::MoveToEndOfExcerpt`

`editor: move to end of larger syntax node`
:   Moves cursor to the end of the next larger syntax node.
    Keymap Name: `editor::MoveToEndOfLargerSyntaxNode`

`editor: move to end of line`
:   Moves the cursor to the end of the current line.
    Keymap Name: `editor::MoveToEndOfLine`

`editor: move to end of paragraph`
:   Moves cursor to the end of the paragraph.
    Keymap Name: `editor::MoveToEndOfParagraph`

`editor: move to end of previous excerpt`
:   Moves cursor to the end of the previous excerpt.
    Keymap Name: `editor::MoveToEndOfPreviousExcerpt`

`editor: move to next subword end`
:   Moves cursor to the end of the next subword.
    Keymap Name: `editor::MoveToNextSubwordEnd`

`editor: move to next word end`
:   Moves cursor to the end of the next word.
    Keymap Name: `editor::MoveToNextWordEnd`

`editor: move to previous subword start`
:   Moves cursor to the start of the previous subword.
    Keymap Name: `editor::MoveToPreviousSubwordStart`

`editor: move to previous word start`
:   Moves cursor to the start of the previous word.
    Keymap Name: `editor::MoveToPreviousWordStart`

`editor: move to start of excerpt`
:   Moves cursor to the start of the current excerpt.
    Keymap Name: `editor::MoveToStartOfExcerpt`

`editor: move to start of larger syntax node`
:   Moves cursor to the start of the next larger syntax node.
    Keymap Name: `editor::MoveToStartOfLargerSyntaxNode`

`editor: move to start of next excerpt`
:   Moves cursor to the start of the next excerpt.
    Keymap Name: `editor::MoveToStartOfNextExcerpt`

`editor: move to start of paragraph`
:   Moves cursor to the start of the paragraph.
    Keymap Name: `editor::MoveToStartOfParagraph`

`editor: move up`
:   Moves cursor up.
    Keymap Name: `editor::MoveUp`

`editor: move up by lines`
:   Moves the cursor up by a specified number of lines.
    Keymap Name: `editor::MoveUpByLines`

`editor: newline`
:   Inserts a new line and moves cursor to it.
    Keymap Name: `editor::Newline`

`editor: newline above`
:   Inserts a new line above the current line.
    Keymap Name: `editor::NewlineAbove`

`editor: newline below`
:   Inserts a new line below the current line.
    Keymap Name: `editor::NewlineBelow`

`editor: next edit prediction`
:   Navigates to the next edit prediction.
    Keymap Name: `editor::NextEditPrediction`

`editor: next screen`
:   Scrolls to the next screen.
    Keymap Name: `editor::NextScreen`

`editor: next snippet tabstop`
:   Goes to the next snippet tabstop if one exists.
    Keymap Name: `editor::NextSnippetTabstop`

`editor: open context menu`
:   Opens the context menu at cursor position.
    Keymap Name: `editor::OpenContextMenu`

`editor: open docs`
:   Opens documentation for the symbol at cursor.
    Keymap Name: `editor::OpenDocs`

`editor: open excerpts`
:   Opens excerpts from the current file.
    Keymap Name: `editor::OpenExcerpts`

`editor: open excerpts split`
:   Opens excerpts in a split pane.
    Keymap Name: `editor::OpenExcerptsSplit`

`editor: open git blame commit`
:   Opens the git commit for the blame at cursor.
    Keymap Name: `editor::OpenGitBlameCommit`

`editor: open permalink to line`
:   Opens a permalink to the current line.
    Keymap Name: `editor::OpenPermalinkToLine`

`editor: open proposed changes editor`
:   Opens the proposed changes editor.
    Keymap Name: `editor::OpenProposedChangesEditor`

`editor: open selected filename`
:   Opens the file whose name is selected in the editor.
    Keymap Name: `editor::OpenSelectedFilename`
    Deprecated Alias(es): `editor::OpenFile`,

`editor: open selections in multibuffer`
:   Opens all selections in a multibuffer.
    Keymap Name: `editor::OpenSelectionsInMultibuffer`

`editor: open url`
:   Opens the URL at cursor position.
    Keymap Name: `editor::OpenUrl`

`editor: organize imports`
:   Organizes import statements.
    Keymap Name: `editor::OrganizeImports`

`editor: outdent`
:   Decreases indentation of selected lines.
    Keymap Name: `editor::Outdent`

`editor: page down`
:   Scrolls down by one page.
    Keymap Name: `editor::PageDown`

`editor: page up`
:   Scrolls up by one page.
    Keymap Name: `editor::PageUp`

`editor: paste`
:   Pastes from clipboard.
    Keymap Name: `editor::Paste`

`editor: previous edit prediction`
:   Navigates to the previous edit prediction.
    Keymap Name: `editor::PreviousEditPrediction`

`editor: previous snippet tabstop`
:   Goes to the previous snippet tabstop if one exists.
    Keymap Name: `editor::PreviousSnippetTabstop`

`editor: redo`
:   Redoes the last undone edit.
    Keymap Name: `editor::Redo`

`editor: redo selection`
:   Redoes the last selection change.
    Keymap Name: `editor::RedoSelection`

`editor: reload file`
:   Reloads the file from disk.
    Keymap Name: `editor::ReloadFile`

`editor: rename`
:   Renames the symbol at cursor.
    Keymap Name: `editor::Rename`

`editor: restart language server`
:   Restarts the language server for the current file.
    Keymap Name: `editor::RestartLanguageServer`

`editor: reveal in file manager`
:   Reveals the current file in the system file manager.
    Keymap Name: `editor::RevealInFileManager`

`editor: reverse lines`
:   Reverses the order of selected lines.
    Keymap Name: `editor::ReverseLines`

`editor: rewrap`
:   Rewraps text to fit within the preferred line length.
    Keymap Name: `editor::Rewrap`

`editor: rotate selections backward`
:   Rotates selections or lines backward.
    Keymap Name: `editor::RotateSelectionsBackward`

`editor: rotate selections forward`
:   Rotates selections or lines forward.
    Keymap Name: `editor::RotateSelectionsForward`

`editor: run flycheck`
:   Runs flycheck diagnostics.
    Keymap Name: `editor::RunFlycheck`

`editor: scroll cursor bottom`
:   Scrolls the cursor to the bottom of the viewport.
    Keymap Name: `editor::ScrollCursorBottom`

`editor: scroll cursor center`
:   Scrolls the cursor to the center of the viewport.
    Keymap Name: `editor::ScrollCursorCenter`

`editor: scroll cursor center top bottom`
:   Cycles cursor position between center, top, and bottom.
    Keymap Name: `editor::ScrollCursorCenterTopBottom`

`editor: scroll cursor top`
:   Scrolls the cursor to the top of the viewport.
    Keymap Name: `editor::ScrollCursorTop`

`editor: select all`
:   Selects all text in the editor.
    Keymap Name: `editor::SelectAll`

`editor: select all matches`
:   Selects all matches of the current selection.
    Keymap Name: `editor::SelectAllMatches`

`editor: select down`
:   Extends selection down.
    Keymap Name: `editor::SelectDown`

`editor: select down by lines`
:   Extends selection down by a specified number of lines.
    Keymap Name: `editor::SelectDownByLines`

`editor: select enclosing symbol`
:   Selects the enclosing symbol.
    Keymap Name: `editor::SelectEnclosingSymbol`

`editor: select larger syntax node`
:   Selects the next larger syntax node.
    Keymap Name: `editor::SelectLargerSyntaxNode`

`editor: select left`
:   Extends selection left.
    Keymap Name: `editor::SelectLeft`

`editor: select line`
:   Selects the current line.
    Keymap Name: `editor::SelectLine`

`editor: select next`
:   Selects the next occurrence of the current selection.
    Keymap Name: `editor::SelectNext`

`editor: select next syntax node`
:   Selects the next syntax node sibling.
    Keymap Name: `editor::SelectNextSyntaxNode`

`editor: select page down`
:   Extends selection down by one page.
    Keymap Name: `editor::SelectPageDown`

`editor: select page up`
:   Extends selection up by one page.
    Keymap Name: `editor::SelectPageUp`

`editor: select previous`
:   Selects the previous occurrence of the current selection.
    Keymap Name: `editor::SelectPrevious`

`editor: select previous syntax node`
:   Selects the previous syntax node sibling.
    Keymap Name: `editor::SelectPreviousSyntaxNode`

`editor: select right`
:   Extends selection right.
    Keymap Name: `editor::SelectRight`

`editor: select smaller syntax node`
:   Selects the next smaller syntax node.
    Keymap Name: `editor::SelectSmallerSyntaxNode`

`editor: select to beginning`
:   Selects to the beginning of the document.
    Keymap Name: `editor::SelectToBeginning`

`editor: select to beginning of line`
:   Selects from the cursor to the beginning of the current line.
    Keymap Name: `editor::SelectToBeginningOfLine`

`editor: select to end`
:   Selects to the end of the document.
    Keymap Name: `editor::SelectToEnd`

`editor: select to end of excerpt`
:   Selects to the end of the current excerpt.
    Keymap Name: `editor::SelectToEndOfExcerpt`

`editor: select to end of larger syntax node`
:   Selects to the end of the next larger syntax node.
    Keymap Name: `editor::SelectToEndOfLargerSyntaxNode`

`editor: select to end of line`
:   Selects from the cursor to the end of the current line.
    Keymap Name: `editor::SelectToEndOfLine`

`editor: select to end of paragraph`
:   Selects to the end of the paragraph.
    Keymap Name: `editor::SelectToEndOfParagraph`

`editor: select to end of previous excerpt`
:   Selects to the end of the previous excerpt.
    Keymap Name: `editor::SelectToEndOfPreviousExcerpt`

`editor: select to next subword end`
:   Selects to the end of the next subword.
    Keymap Name: `editor::SelectToNextSubwordEnd`

`editor: select to next word end`
:   Selects to the end of the next word.
    Keymap Name: `editor::SelectToNextWordEnd`

`editor: select to previous subword start`
:   Selects to the start of the previous subword.
    Keymap Name: `editor::SelectToPreviousSubwordStart`

`editor: select to previous word start`
:   Selects to the start of the previous word.
    Keymap Name: `editor::SelectToPreviousWordStart`

`editor: select to start of excerpt`
:   Selects to the start of the current excerpt.
    Keymap Name: `editor::SelectToStartOfExcerpt`

`editor: select to start of larger syntax node`
:   Selects to the start of the next larger syntax node.
    Keymap Name: `editor::SelectToStartOfLargerSyntaxNode`

`editor: select to start of next excerpt`
:   Selects to the start of the next excerpt.
    Keymap Name: `editor::SelectToStartOfNextExcerpt`

`editor: select to start of paragraph`
:   Selects to the start of the paragraph.
    Keymap Name: `editor::SelectToStartOfParagraph`

`editor: select up`
:   Extends selection up.
    Keymap Name: `editor::SelectUp`

`editor: select up by lines`
:   Extends selection up by a specified number of lines.
    Keymap Name: `editor::SelectUpByLines`

`editor: send review to agent`
:   Sends all stored review comments to the Agent panel.
    Keymap Name: `editor::SendReviewToAgent`

`editor: set mark`
:   Sets a mark at the current position.
    Keymap Name: `editor::SetMark`

`editor: show character palette`
:   Shows the system character palette.
    Keymap Name: `editor::ShowCharacterPalette`

`editor: show completions`
:   Shows code completion suggestions at the cursor position.
    Keymap Name: `editor::ShowCompletions`

`editor: show edit prediction`
:   Shows edit prediction at cursor.
    Keymap Name: `editor::ShowEditPrediction`

`editor: show signature help`
:   Shows signature help for the current function.
    Keymap Name: `editor::ShowSignatureHelp`

`editor: show word completions`
:   Shows word completions.
    Keymap Name: `editor::ShowWordCompletions`

`editor: shuffle lines`
:   Randomly shuffles selected lines.
    Keymap Name: `editor::ShuffleLines`

`editor: signature help next`
:   Navigates to the next signature in the signature help popup.
    Keymap Name: `editor::SignatureHelpNext`

`editor: signature help previous`
:   Navigates to the previous signature in the signature help popup.
    Keymap Name: `editor::SignatureHelpPrevious`

`editor: sort lines by length`
:   Sorts selected lines by length.
    Keymap Name: `editor::SortLinesByLength`

`editor: sort lines case insensitive`
:   Sorts selected lines case-insensitively.
    Keymap Name: `editor::SortLinesCaseInsensitive`

`editor: sort lines case sensitive`
:   Sorts selected lines case-sensitively.
    Keymap Name: `editor::SortLinesCaseSensitive`

`editor: spawn nearest task`
:   Spawns the nearest available task from the current cursor position.
    Keymap Name: `editor::SpawnNearestTask`

`editor: split selection into lines`
:   Splits selection into individual lines.
    Keymap Name: `editor::SplitSelectionIntoLines`

`editor: stop language server`
:   Stops the language server for the current file.
    Keymap Name: `editor::StopLanguageServer`

`editor: submit diff review comment`
:   Stores the diff review comment locally (for later batch submission).
    Keymap Name: `editor::SubmitDiffReviewComment`

`editor: swap selection ends`
:   Swaps the start and end of the current selection.
    Keymap Name: `editor::SwapSelectionEnds`

`editor: switch source header`
:   Switches between source and header files.
    Keymap Name: `editor::SwitchSourceHeader`

`editor: tab`
:   Inserts a tab character or indents.
    Keymap Name: `editor::Tab`

`editor: toggle auto signature help`
:   Toggles automatic signature help.
    Keymap Name: `editor::ToggleAutoSignatureHelp`

`editor: toggle breakpoint`
:   Toggles a breakpoint at the current line.
    Keymap Name: `editor::ToggleBreakpoint`

`editor: toggle case`
:   Toggles the case of selected text.
    Keymap Name: `editor::ToggleCase`

`editor: toggle code actions`
:   Toggles the display of available code actions at the cursor position.
    Keymap Name: `editor::ToggleCodeActions`

`editor: toggle comments`
:   Toggles comment markers for the selected lines.
    Keymap Name: `editor::ToggleComments`

`editor: toggle diagnostics`
:   Toggles the diagnostics panel.
    Keymap Name: `editor::ToggleDiagnostics`

`editor: toggle edit prediction`
:   Toggles edit prediction feature.
    Keymap Name: `editor::ToggleEditPrediction`

`editor: toggle focus`
:   Toggles focus back to the last active buffer.
    Keymap Name: `editor::ToggleFocus`

`editor: toggle fold`
:   Toggles folding at the current position.
    Keymap Name: `editor::ToggleFold`

`editor: toggle fold all`
:   Toggles all folds in a buffer or all excerpts in multibuffer.
    Keymap Name: `editor::ToggleFoldAll`

`editor: toggle fold recursive`
:   Toggles recursive folding at the current position.
    Keymap Name: `editor::ToggleFoldRecursive`

`editor: toggle git blame inline`
:   Toggles inline git blame display.
    Keymap Name: `editor::ToggleGitBlameInline`

`editor: toggle indent guides`
:   Toggles indent guides display.
    Keymap Name: `editor::ToggleIndentGuides`

`editor: toggle inlay hints`
:   Toggles inlay hints display.
    Keymap Name: `editor::ToggleInlayHints`

`editor: toggle inline diagnostics`
:   Toggles inline diagnostics display.
    Keymap Name: `editor::ToggleInlineDiagnostics`

`editor: toggle inline values`
:   Toggles inline values display.
    Keymap Name: `editor::ToggleInlineValues`

`editor: toggle line numbers`
:   Toggles line numbers display.
    Keymap Name: `editor::ToggleLineNumbers`

`editor: toggle minimap`
:   Toggles the minimap display.
    Keymap Name: `editor::ToggleMinimap`

`editor: toggle relative line numbers`
:   Toggles relative line numbers display.
    Keymap Name: `editor::ToggleRelativeLineNumbers`

`editor: toggle review comments expanded`
:   Toggles the expanded state of the comments section in the overlay.
    Keymap Name: `editor::ToggleReviewCommentsExpanded`

`editor: toggle selected diff hunks`
:   Toggles diff display for selected hunks.
    Keymap Name: `editor::ToggleSelectedDiffHunks`
    Deprecated Alias(es): `editor::ToggleHunkDiff`,

`editor: toggle selection menu`
:   Toggles the selection menu.
    Keymap Name: `editor::ToggleSelectionMenu`

`editor: toggle semantic highlights`
:   Toggles semantic highlights display.
    Keymap Name: `editor::ToggleSemanticHighlights`

`editor: toggle soft wrap`
:   Toggles soft wrap mode.
    Keymap Name: `editor::ToggleSoftWrap`

`editor: toggle split diff`
:   Keymap Name: `editor::ToggleSplitDiff`

`editor: toggle tab bar`
:   Toggles the tab bar display.
    Keymap Name: `editor::ToggleTabBar`

`editor: transpose`
:   Transposes characters around cursor.
    Keymap Name: `editor::Transpose`

`editor: undo`
:   Undoes the last edit.
    Keymap Name: `editor::Undo`

`editor: undo selection`
:   Undoes the last selection change.
    Keymap Name: `editor::UndoSelection`

`editor: unfold all`
:   Unfolds all folded regions.
    Keymap Name: `editor::UnfoldAll`

`editor: unfold lines`
:   Unfolds lines at cursor.
    Keymap Name: `editor::UnfoldLines`

`editor: unfold recursive`
:   Unfolds recursively at cursor.
    Keymap Name: `editor::UnfoldRecursive`

`editor: unique lines case insensitive`
:   Removes duplicate lines (case-insensitive).
    Keymap Name: `editor::UniqueLinesCaseInsensitive`

`editor: unique lines case sensitive`
:   Removes duplicate lines (case-sensitive).
    Keymap Name: `editor::UniqueLinesCaseSensitive`

`editor: unwrap syntax node`
:   Removes the surrounding syntax node (for example brackets, or closures)
    from the current selections.
    Keymap Name: `editor::UnwrapSyntaxNode`

`editor: wrap selections in tag`
:   Wraps selections in tag specified by language.
    Keymap Name: `editor::WrapSelectionsInTag`

`encoding selector: toggle`
:   Toggles the encoding selector modal.
    Keymap Name: `encoding_selector::Toggle`

`feedback: email zed`
:   Opens email client to send feedback to Zed support.
    Keymap Name: `feedback::EmailZed`

`feedback: file bug report`
:   Opens the bug report form.
    Keymap Name: `feedback::FileBugReport`

`feedback: request feature`
:   Opens the feature request form.
    Keymap Name: `feedback::RequestFeature`

`file finder: select previous`
:   Selects the previous item in the file finder.
    Keymap Name: `file_finder::SelectPrevious`

`file finder: toggle`
:   Toggles the file finder interface.
    Keymap Name: `file_finder::Toggle`

`file finder: toggle filter menu`
:   Toggles the file filter menu.
    Keymap Name: `file_finder::ToggleFilterMenu`

`file finder: toggle split menu`
:   Toggles the split direction menu.
    Keymap Name: `file_finder::ToggleSplitMenu`

`git: add`
:   Adds files to the git staging area.
    Keymap Name: `git::Add`

`git: add to gitignore`
:   Adds a file to .gitignore.
    Keymap Name: `git::AddToGitignore`

`git: amend`
:   Amends the last commit with staged changes.
    Keymap Name: `git::Amend`

`git: apply current stash`
:   Keymap Name: `git::ApplyCurrentStash`

`git: blame`
:   Shows git blame information for the current file.
    Keymap Name: `git::Blame`
    Deprecated Alias(es): `editor::ToggleGitBlame`,

`git: branch`
:   Opens the git branch selector.
    Keymap Name: `git::Branch`
    Deprecated Alias(es): `branches::OpenRecent`,

`git: branch diff`
:   Shows the diff between the working directory and your default
    branch (typically main or master).
    Keymap Name: `git::BranchDiff`

`git: cancel`
:   Cancels the current git operation.
    Keymap Name: `git::Cancel`

`git: checkout branch`
:   Checks out a different git branch.
    Keymap Name: `git::CheckoutBranch`

`git: clone`
:   Clones a repository.
    Keymap Name: `git::Clone`

`git: commit`
:   Creates a new commit with staged changes.
    Keymap Name: `git::Commit`

`git: create pull request`
:   Creates a pull request for the current branch.
    Keymap Name: `git::CreatePullRequest`

`git: create remote`
:   Create a git remote.
    Keymap Name: `git::CreateRemote`

`git: delete worktree`
:   Keymap Name: `git::DeleteWorktree`

`git: diff`
:   Shows the diff between the working directory and the index.
    Keymap Name: `git::Diff`

`git: drop current stash`
:   Keymap Name: `git::DropCurrentStash`

`git: expand commit editor`
:   Expands the commit message editor.
    Keymap Name: `git::ExpandCommitEditor`

`git: fetch`
:   Fetches changes from the remote repository.
    Keymap Name: `git::Fetch`

`git: fetch from`
:   Fetches changes from a specific remote.
    Keymap Name: `git::FetchFrom`

`git: file history`
:   Shows the git history for the current file.
    Keymap Name: `git::FileHistory`

`git: filter remotes`
:   Filter remotes.
    Keymap Name: `git::FilterRemotes`

`git: force push`
:   Force pushes commits to the remote repository.
    Keymap Name: `git::ForcePush`

`git: generate commit message`
:   Generates a commit message using AI.
    Keymap Name: `git::GenerateCommitMessage`

`git: init`
:   Initializes a new git repository.
    Keymap Name: `git::Init`

`git: leader and follower`
:   Keymap Name: `git::LeaderAndFollower`

`git: open modified files`
:   Opens all modified files in the editor.
    Keymap Name: `git::OpenModifiedFiles`

`git: pop current stash`
:   Keymap Name: `git::PopCurrentStash`

`git: pull`
:   Pulls changes from the remote repository.
    Keymap Name: `git::Pull`

`git: pull rebase`
:   Pulls changes from the remote repository with rebase.
    Keymap Name: `git::PullRebase`

`git: push`
:   Pushes commits to the remote repository.
    Keymap Name: `git::Push`

`git: push to`
:   Pushes commits to a specific remote branch.
    Keymap Name: `git::PushTo`

`git: rename branch`
:   Renames a git branch.
    Keymap Name: `git::RenameBranch`

`git: restore`
:   Restores the selected hunks to their original state.
    Keymap Name: `git::Restore`
    Deprecated Alias(es): `editor::RevertSelectedHunks`,

`git: restore file`
:   Restores a file to its last committed state, discarding local changes.
    Keymap Name: `git::RestoreFile`
    Deprecated Alias(es): `editor::RevertFile`,

`git: restore tracked files`
:   Restores all tracked files to their last committed state.
    Keymap Name: `git::RestoreTrackedFiles`

`git: review diff`
:   Opens a new agent thread with the branch diff for review.
    Keymap Name: `git::ReviewDiff`

`git: select repo`
:   Selects a different repository.
    Keymap Name: `git::SelectRepo`

`git: signoff`
:   Enable the --signoff option.
    Keymap Name: `git::Signoff`

`git: stage all`
:   Stages all changes in the repository.
    Keymap Name: `git::StageAll`

`git: stage and next`
:   Stages the current hunk and moves to the next one.
    Keymap Name: `git::StageAndNext`

`git: stage file`
:   Stages the current file.
    Keymap Name: `git::StageFile`

`git: stage range`
:   Stage status entries between an anchor entry and the cursor.
    Keymap Name: `git::StageRange`

`git: stash all`
:   Stashes all changes in the repository, including untracked files.
    Keymap Name: `git::StashAll`

`git: stash apply`
:   Apply the most recent stash.
    Keymap Name: `git::StashApply`

`git: stash pop`
:   Pops the most recent stash.
    Keymap Name: `git::StashPop`

`git: switch`
:   Switches to a different git branch.
    Keymap Name: `git::Switch`

`git: toggle staged`
:   Toggles the staged state of the hunk or status entry at cursor.
    Keymap Name: `git::ToggleStaged`

`git: trash untracked files`
:   Moves all untracked files to trash.
    Keymap Name: `git::TrashUntrackedFiles`

`git: uncommit`
:   Undoes the last commit, keeping changes in the working directory.
    Keymap Name: `git::Uncommit`

`git: unstage all`
:   Unstages all changes in the repository.
    Keymap Name: `git::UnstageAll`

`git: unstage and next`
:   Unstages the current hunk and moves to the next one.
    Keymap Name: `git::UnstageAndNext`

`git: unstage file`
:   Unstages the current file.
    Keymap Name: `git::UnstageFile`

`git: view stash`
:   Opens the git stash selector.
    Keymap Name: `git::ViewStash`

`git: worktree`
:   Opens the git worktree selector.
    Keymap Name: `git::Worktree`

`git: worktree from default`
:   Keymap Name: `git::WorktreeFromDefault`

`git: worktree from default on window`
:   Keymap Name: `git::WorktreeFromDefaultOnWindow`

`git graph: open`
:   Opens the Git Graph Tab.
    Keymap Name: `git_graph::Open`

`git graph: open at commit`
:   Opens the Git Graph Tab at a specific commit.
    Keymap Name: `git_graph::OpenAtCommit`

`git graph: open commit view`
:   Opens the commit view for the selected commit.
    Keymap Name: `git_graph::OpenCommitView`

`git onboarding: open git integration onboarding`
:   Opens the git integration onboarding modal.
    Keymap Name: `git_onboarding::OpenGitIntegrationOnboarding`

`git panel: close`
:   Closes the git panel.
    Keymap Name: `git_panel::Close`

`git panel: collapse selected entry`
:   Collapses the selected entry to hide its children.
    Keymap Name: `git_panel::CollapseSelectedEntry`

`git panel: expand selected entry`
:   Expands the selected entry to show its children.
    Keymap Name: `git_panel::ExpandSelectedEntry`

`git panel: first entry`
:   Select first git panel menu item, and show it in the diff view
    Keymap Name: `git_panel::FirstEntry`

`git panel: focus changes`
:   Focuses on the changes list.
    Keymap Name: `git_panel::FocusChanges`

`git panel: focus editor`
:   Focuses on the commit message editor.
    Keymap Name: `git_panel::FocusEditor`

`git panel: last entry`
:   Select last git panel menu item, and show it in the diff view
    Keymap Name: `git_panel::LastEntry`

`git panel: next entry`
:   Select next git panel menu item, and show it in the diff view
    Keymap Name: `git_panel::NextEntry`

`git panel: open menu`
:   Opens the git panel menu.
    Keymap Name: `git_panel::OpenMenu`

`git panel: previous entry`
:   Select previous git panel menu item, and show it in the diff view
    Keymap Name: `git_panel::PreviousEntry`

`git panel: toggle`
:   Toggles the git panel.
    Keymap Name: `git_panel::Toggle`

`git panel: toggle fill co authors`
:   Toggles automatic co-author suggestions.
    Keymap Name: `git_panel::ToggleFillCoAuthors`

`git panel: toggle focus`
:   Toggles focus on the git panel.
    Keymap Name: `git_panel::ToggleFocus`

`git panel: toggle sort by path`
:   Toggles sorting entries by path vs status.
    Keymap Name: `git_panel::ToggleSortByPath`

`git panel: toggle tree view`
:   Toggles showing entries in tree vs flat view.
    Keymap Name: `git_panel::ToggleTreeView`

`git picker: activate branches tab`
:   Keymap Name: `git_picker::ActivateBranchesTab`

`git picker: activate stash tab`
:   Keymap Name: `git_picker::ActivateStashTab`

`git picker: activate worktrees tab`
:   Keymap Name: `git_picker::ActivateWorktreesTab`

`go to line: toggle`
:   Toggles the go to line dialog.
    Keymap Name: `go_to_line::Toggle`

`highlights tree view: toggle semantic tokens`
:   Toggles showing semantic token highlights.
    Keymap Name: `highlights_tree_view::ToggleSemanticTokens`

`highlights tree view: toggle syntax tokens`
:   Toggles showing syntax token highlights.
    Keymap Name: `highlights_tree_view::ToggleSyntaxTokens`

`highlights tree view: toggle text highlights`
:   Toggles showing text highlights.
    Keymap Name: `highlights_tree_view::ToggleTextHighlights`

`icon theme selector: toggle`
:   Toggles the icon theme selector interface.
    Keymap Name: `icon_theme_selector::Toggle`

`image viewer: fit to view`
:   Fit the image to view.
    Keymap Name: `image_viewer::FitToView`

`image viewer: reset zoom`
:   Reset zoom to 100%.
    Keymap Name: `image_viewer::ResetZoom`

`image viewer: zoom in`
:   Zoom in the image.
    Keymap Name: `image_viewer::ZoomIn`

`image viewer: zoom out`
:   Zoom out the image.
    Keymap Name: `image_viewer::ZoomOut`

`image viewer: zoom to actual size`
:   Zoom to actual size (100%).
    Keymap Name: `image_viewer::ZoomToActualSize`

`inline assistant: thumbs down result`
:   Keymap Name: `inline_assistant::ThumbsDownResult`

`inline assistant: thumbs up result`
:   Keymap Name: `inline_assistant::ThumbsUpResult`

`journal: new journal entry`
:   Creates a new journal entry for today.
    Keymap Name: `journal::NewJournalEntry`

`keymap editor: copy action`
:   Copies the action name to clipboard.
    Keymap Name: `keymap_editor::CopyAction`

`keymap editor: copy context`
:   Copies the context predicate to clipboard.
    Keymap Name: `keymap_editor::CopyContext`

`keymap editor: create binding`
:   Creates a new key binding for the selected action.
    Keymap Name: `keymap_editor::CreateBinding`

`keymap editor: delete binding`
:   Deletes the selected key binding.
    Keymap Name: `keymap_editor::DeleteBinding`

`keymap editor: edit binding`
:   Edits the selected key binding.
    Keymap Name: `keymap_editor::EditBinding`

`keymap editor: open create keybinding modal`
:   Creates a new key binding from scratch, prompting for the action.
    Keymap Name: `keymap_editor::OpenCreateKeybindingModal`

`keymap editor: show matching keybinds`
:   Shows matching keystrokes for the currently selected binding
    Keymap Name: `keymap_editor::ShowMatchingKeybinds`

`keymap editor: toggle conflict filter`
:   Toggles Conflict Filtering
    Keymap Name: `keymap_editor::ToggleConflictFilter`

`keymap editor: toggle exact keystroke matching`
:   Toggles exact matching for keystroke search
    Keymap Name: `keymap_editor::ToggleExactKeystrokeMatching`

`keymap editor: toggle keystroke search`
:   Toggle Keystroke search
    Keymap Name: `keymap_editor::ToggleKeystrokeSearch`

`keystroke input: clear keystrokes`
:   Clears the recorded keystrokes
    Keymap Name: `keystroke_input::ClearKeystrokes`

`keystroke input: start recording`
:   Starts recording keystrokes
    Keymap Name: `keystroke_input::StartRecording`

`keystroke input: stop recording`
:   Stops recording keystrokes
    Keymap Name: `keystroke_input::StopRecording`

`language selector: toggle`
:   Toggles the language selector modal.
    Keymap Name: `language_selector::Toggle`

`line ending selector: toggle`
:   Toggles the line ending selector modal.
    Keymap Name: `line_ending_selector::Toggle`

`lsp tool: toggle menu`
:   Toggles the language server tool menu.
    Keymap Name: `lsp_tool::ToggleMenu`

`markdown: copy`
:   Copies the selected text to the clipboard.
    Keymap Name: `markdown::Copy`

`markdown: copy as markdown`
:   Copies the selected text as markdown to the clipboard.
    Keymap Name: `markdown::CopyAsMarkdown`

`markdown: open following preview`
:   Opens a following markdown preview that syncs with the editor.
    Keymap Name: `markdown::OpenFollowingPreview`

`markdown: open preview`
:   Opens a markdown preview for the current file.
    Keymap Name: `markdown::OpenPreview`

`markdown: open preview to the side`
:   Opens a markdown preview in a split pane.
    Keymap Name: `markdown::OpenPreviewToTheSide`

`markdown: scroll down`
:   Scrolls down by approximately one visual line.
    Keymap Name: `markdown::ScrollDown`

`markdown: scroll down by item`
:   Scrolls down by one markdown element in the markdown preview
    Keymap Name: `markdown::ScrollDownByItem`

`markdown: scroll page down`
:   Scrolls down by one page in the markdown preview.
    Keymap Name: `markdown::ScrollPageDown`
    Deprecated Alias(es): `markdown::MovePageDown`,

`markdown: scroll page up`
:   Scrolls up by one page in the markdown preview.
    Keymap Name: `markdown::ScrollPageUp`
    Deprecated Alias(es): `markdown::MovePageUp`,

`markdown: scroll up`
:   Scrolls up by approximately one visual line.
    Keymap Name: `markdown::ScrollUp`

`markdown: scroll up by item`
:   Scrolls up by one markdown element in the markdown preview
    Keymap Name: `markdown::ScrollUpByItem`

`menu: cancel`
:   Cancels the current menu operation.
    Keymap Name: `menu::Cancel`

`menu: confirm`
:   Confirms the selected menu item.
    Keymap Name: `menu::Confirm`

`menu: end slot`
:   Keymap Name: `menu::EndSlot`

`menu: restart`
:   Restarts the menu from the beginning.
    Keymap Name: `menu::Restart`

`menu: secondary confirm`
:   Performs secondary confirmation action.
    Keymap Name: `menu::SecondaryConfirm`

`menu: select child`
:   Enters a submenu (navigates to child menu).
    Keymap Name: `menu::SelectChild`

`menu: select first`
:   Selects the first item in the menu.
    Keymap Name: `menu::SelectFirst`

`menu: select last`
:   Selects the last item in the menu.
    Keymap Name: `menu::SelectLast`

`menu: select next`
:   Selects the next item in the menu.
    Keymap Name: `menu::SelectNext`

`menu: select parent`
:   Exits a submenu (navigates to parent menu).
    Keymap Name: `menu::SelectParent`

`menu: select previous`
:   Selects the previous item in the menu.
    Keymap Name: `menu::SelectPrevious`

`multi workspace: focus workspace sidebar`
:   Moves focus to or from the workspace sidebar without closing it.
    Keymap Name: `multi_workspace::FocusWorkspaceSidebar`

`multi workspace: new workspace in window`
:   Creates a new workspace within the current window.
    Keymap Name: `multi_workspace::NewWorkspaceInWindow`

`multi workspace: next workspace in window`
:   Switches to the next workspace within the current window.
    Keymap Name: `multi_workspace::NextWorkspaceInWindow`

`multi workspace: previous workspace in window`
:   Switches to the previous workspace within the current window.
    Keymap Name: `multi_workspace::PreviousWorkspaceInWindow`

`multi workspace: toggle workspace sidebar`
:   Toggles the workspace switcher sidebar.
    Keymap Name: `multi_workspace::ToggleWorkspaceSidebar`

`new process modal: activate attach tab`
:   Keymap Name: `new_process_modal::ActivateAttachTab`

`new process modal: activate debug tab`
:   Keymap Name: `new_process_modal::ActivateDebugTab`

`new process modal: activate launch tab`
:   Keymap Name: `new_process_modal::ActivateLaunchTab`

`new process modal: activate task tab`
:   Keymap Name: `new_process_modal::ActivateTaskTab`

`notebook: add code block`
:   Adds a new code cell.
    Keymap Name: `notebook::AddCodeBlock`

`notebook: add markdown block`
:   Adds a new markdown cell.
    Keymap Name: `notebook::AddMarkdownBlock`

`notebook: clear outputs`
:   Clears all cell outputs.
    Keymap Name: `notebook::ClearOutputs`

`notebook: interrupt kernel`
:   Interrupts the current execution.
    Keymap Name: `notebook::InterruptKernel`

`notebook: move cell down`
:   Moves the current cell down.
    Keymap Name: `notebook::MoveCellDown`

`notebook: move cell up`
:   Moves the current cell up.
    Keymap Name: `notebook::MoveCellUp`

`notebook: notebook move down`
:   Move to down in cells
    Keymap Name: `notebook::NotebookMoveDown`

`notebook: notebook move up`
:   Move to up in cells
    Keymap Name: `notebook::NotebookMoveUp`

`notebook: open notebook`
:   Opens a Jupyter notebook file.
    Keymap Name: `notebook::OpenNotebook`

`notebook: restart kernel`
:   Restarts the kernel.
    Keymap Name: `notebook::RestartKernel`

`notebook: run`
:   Runs the current cell.
    Keymap Name: `notebook::Run`

`notebook: run all`
:   Runs all cells in the notebook.
    Keymap Name: `notebook::RunAll`

`notification panel: toggle`
:   Toggles the notification panel.
    Keymap Name: `notification_panel::Toggle`

`notification panel: toggle focus`
:   Toggles focus on the notification panel.
    Keymap Name: `notification_panel::ToggleFocus`

`onboarding: finish`
:   Finish the onboarding process.
    Keymap Name: `onboarding::Finish`

`onboarding: open account`
:   Open the user account in zed.dev while in the onboarding flow.
    Keymap Name: `onboarding::OpenAccount`

`onboarding: reset hints`
:   Resets the welcome screen hints to their initial state.
    Keymap Name: `onboarding::ResetHints`

`onboarding: sign in`
:   Sign in while in the onboarding flow.
    Keymap Name: `onboarding::SignIn`

`outline: toggle`
:   Keymap Name: `outline::Toggle`

`outline panel: collapse all entries`
:   Collapses all entries in the outline tree.
    Keymap Name: `outline_panel::CollapseAllEntries`

`outline panel: collapse selected entry`
:   Collapses the currently selected entry.
    Keymap Name: `outline_panel::CollapseSelectedEntry`

`outline panel: expand all entries`
:   Expands all entries in the outline tree.
    Keymap Name: `outline_panel::ExpandAllEntries`

`outline panel: expand selected entry`
:   Expands the currently selected entry.
    Keymap Name: `outline_panel::ExpandSelectedEntry`

`outline panel: fold directory`
:   Folds the selected directory.
    Keymap Name: `outline_panel::FoldDirectory`

`outline panel: open selected entry`
:   Opens the selected entry in the editor.
    Keymap Name: `outline_panel::OpenSelectedEntry`

`outline panel: reveal in file manager`
:   Reveals the selected item in the system file manager.
    Keymap Name: `outline_panel::RevealInFileManager`

`outline panel: scroll cursor bottom`
:   Scroll until the cursor displays at the bottom
    Keymap Name: `outline_panel::ScrollCursorBottom`

`outline panel: scroll cursor center`
:   Scroll until the cursor displays at the center
    Keymap Name: `outline_panel::ScrollCursorCenter`

`outline panel: scroll cursor top`
:   Scroll until the cursor displays at the top
    Keymap Name: `outline_panel::ScrollCursorTop`

`outline panel: scroll down`
:   Scroll half a page downwards
    Keymap Name: `outline_panel::ScrollDown`

`outline panel: scroll up`
:   Scroll half a page upwards
    Keymap Name: `outline_panel::ScrollUp`

`outline panel: select parent`
:   Selects the parent of the current entry.
    Keymap Name: `outline_panel::SelectParent`

`outline panel: toggle`
:   Toggles the outline panel.
    Keymap Name: `outline_panel::Toggle`

`outline panel: toggle active editor pin`
:   Toggles the pin status of the active editor.
    Keymap Name: `outline_panel::ToggleActiveEditorPin`

`outline panel: toggle focus`
:   Toggles focus on the outline panel.
    Keymap Name: `outline_panel::ToggleFocus`

`outline panel: unfold directory`
:   Unfolds the selected directory.
    Keymap Name: `outline_panel::UnfoldDirectory`

`pane: activate item`
:   Activates a specific item in the pane by its index.
    Keymap Name: `pane::ActivateItem`

`pane: activate last item`
:   Activates the last item in the pane.
    Keymap Name: `pane::ActivateLastItem`

`pane: activate next item`
:   Activates the next item in the pane.
    Keymap Name: `pane::ActivateNextItem`

`pane: activate previous item`
:   Activates the previous item in the pane.
    Keymap Name: `pane::ActivatePreviousItem`

`pane: alternate file`
:   Switches to the alternate file.
    Keymap Name: `pane::AlternateFile`

`pane: close active item`
:   Closes the currently active item in the pane.
    Keymap Name: `pane::CloseActiveItem`

`pane: close all items`
:   Closes all items in the pane.
    Keymap Name: `pane::CloseAllItems`

`pane: close clean items`
:   Closes all items that have no unsaved changes.
    Keymap Name: `pane::CloseCleanItems`

`pane: close items to the left`
:   Closes all items to the left of the current item.
    Keymap Name: `pane::CloseItemsToTheLeft`

`pane: close items to the right`
:   Closes all items to the right of the current item.
    Keymap Name: `pane::CloseItemsToTheRight`

`pane: close multibuffer items`
:   Closes all multibuffers in the pane.
    Keymap Name: `pane::CloseMultibufferItems`

`pane: close other items`
:   Closes all inactive items in the pane.
    Keymap Name: `pane::CloseOtherItems`
    Deprecated Alias(es): `pane::CloseInactiveItems`,

`pane: deploy search`
:   Opens the search interface with the specified configuration.
    Keymap Name: `pane::DeploySearch`

`pane: go back`
:   Navigates back in history.
    Keymap Name: `pane::GoBack`

`pane: go forward`
:   Navigates forward in history.
    Keymap Name: `pane::GoForward`

`pane: go to newer tag`
:   Navigates forward in the tag stack.
    Keymap Name: `pane::GoToNewerTag`

`pane: go to older tag`
:   Navigates back in the tag stack.
    Keymap Name: `pane::GoToOlderTag`

`pane: join all`
:   Joins all panes into one.
    Keymap Name: `pane::JoinAll`

`pane: join into next`
:   Joins this pane into the next pane.
    Keymap Name: `pane::JoinIntoNext`

`pane: reopen closed item`
:   Reopens the most recently closed item.
    Keymap Name: `pane::ReopenClosedItem`

`pane: reveal in project panel`
:   Reveals the current item in the project panel.
    Keymap Name: `pane::RevealInProjectPanel`

`pane: split and move down`
:   Splits the pane downward, moving the current item.
    Keymap Name: `pane::SplitAndMoveDown`

`pane: split and move left`
:   Splits the pane to the left, moving the current item.
    Keymap Name: `pane::SplitAndMoveLeft`

`pane: split and move right`
:   Splits the pane to the right, moving the current item.
    Keymap Name: `pane::SplitAndMoveRight`

`pane: split and move up`
:   Splits the pane upward, moving the current item.
    Keymap Name: `pane::SplitAndMoveUp`

`pane: split down`
:   Splits the pane downward.
    Keymap Name: `pane::SplitDown`

`pane: split horizontal`
:   Splits the pane horizontally.
    Keymap Name: `pane::SplitHorizontal`

`pane: split left`
:   Splits the pane to the left.
    Keymap Name: `pane::SplitLeft`

`pane: split right`
:   Splits the pane to the right.
    Keymap Name: `pane::SplitRight`

`pane: split up`
:   Splits the pane upward.
    Keymap Name: `pane::SplitUp`

`pane: split vertical`
:   Splits the pane vertically.
    Keymap Name: `pane::SplitVertical`

`pane: swap item left`
:   Swaps the current item with the one to the left.
    Keymap Name: `pane::SwapItemLeft`

`pane: swap item right`
:   Swaps the current item with the one to the right.
    Keymap Name: `pane::SwapItemRight`

`pane: toggle pin tab`
:   Toggles pin status for the current tab.
    Keymap Name: `pane::TogglePinTab`

`pane: toggle preview tab`
:   Toggles preview mode for the current tab.
    Keymap Name: `pane::TogglePreviewTab`

`pane: unpin all tabs`
:   Unpins all tabs in the pane.
    Keymap Name: `pane::UnpinAllTabs`

`panel: next panel tab`
:   Navigates to the next tab in the panel.
    Keymap Name: `panel::NextPanelTab`

`panel: previous panel tab`
:   Navigates to the previous tab in the panel.
    Keymap Name: `panel::PreviousPanelTab`

`picker: confirm completion`
:   Confirms the selected completion in the picker.
    Keymap Name: `picker::ConfirmCompletion`

`picker: confirm input`
:   ConfirmInput is an alternative editor action which - instead of selecting active picker entry - treats pickers editor input literally,
    performing some kind of action on it.
    Keymap Name: `picker::ConfirmInput`

`project panel: collapse all entries`
:   Collapses all entries in the project tree.
    Keymap Name: `project_panel::CollapseAllEntries`

`project panel: collapse selected entry`
:   Collapses the selected entry in the project tree.
    Keymap Name: `project_panel::CollapseSelectedEntry`

`project panel: collapse selected entry and children`
:   Collapses the selected entry and its children in the project tree.
    Keymap Name: `project_panel::CollapseSelectedEntryAndChildren`

`project panel: compare marked files`
:   Opens a diff view to compare two marked files.
    Keymap Name: `project_panel::CompareMarkedFiles`

`project panel: copy`
:   Copies the selected file or directory.
    Keymap Name: `project_panel::Copy`

`project panel: cut`
:   Cuts the selected file or directory.
    Keymap Name: `project_panel::Cut`

`project panel: delete`
:   Permanently deletes the selected file or directory.
    Keymap Name: `project_panel::Delete`

`project panel: download from remote`
:   Downloads the selected remote file
    Keymap Name: `project_panel::DownloadFromRemote`

`project panel: duplicate`
:   Duplicates the selected file or directory.
    Keymap Name: `project_panel::Duplicate`

`project panel: expand selected entry`
:   Expands the selected entry in the project tree.
    Keymap Name: `project_panel::ExpandSelectedEntry`

`project panel: fold directory`
:   Folds the selected directory.
    Keymap Name: `project_panel::FoldDirectory`

`project panel: new directory`
:   Creates a new directory.
    Keymap Name: `project_panel::NewDirectory`

`project panel: new file`
:   Creates a new file.
    Keymap Name: `project_panel::NewFile`

`project panel: new search in directory`
:   Starts a new search in the selected directory.
    Keymap Name: `project_panel::NewSearchInDirectory`

`project panel: open`
:   Opens the selected file in the editor.
    Keymap Name: `project_panel::Open`

`project panel: open permanent`
:   Opens the selected file in a permanent tab.
    Keymap Name: `project_panel::OpenPermanent`

`project panel: open split horizontal`
:   Opens the selected file in a horizontal split.
    Keymap Name: `project_panel::OpenSplitHorizontal`

`project panel: open split vertical`
:   Opens the selected file in a vertical split.
    Keymap Name: `project_panel::OpenSplitVertical`

`project panel: paste`
:   Pastes the previously cut or copied item.
    Keymap Name: `project_panel::Paste`

`project panel: remove from project`
:   Removes the selected folder from the project.
    Keymap Name: `project_panel::RemoveFromProject`

`project panel: rename`
:   Renames the selected file or directory.
    Keymap Name: `project_panel::Rename`

`project panel: reveal in file manager`
:   Reveals the selected item in the system file manager.
    Keymap Name: `project_panel::RevealInFileManager`

`project panel: scroll cursor bottom`
:   Scroll until the cursor displays at the bottom
    Keymap Name: `project_panel::ScrollCursorBottom`

`project panel: scroll cursor center`
:   Scroll until the cursor displays at the center
    Keymap Name: `project_panel::ScrollCursorCenter`

`project panel: scroll cursor top`
:   Scroll until the cursor displays at the top
    Keymap Name: `project_panel::ScrollCursorTop`

`project panel: scroll down`
:   Scroll half a page downwards
    Keymap Name: `project_panel::ScrollDown`

`project panel: scroll up`
:   Scroll half a page upwards
    Keymap Name: `project_panel::ScrollUp`

`project panel: select next diagnostic`
:   Selects the next entry with diagnostics.
    Keymap Name: `project_panel::SelectNextDiagnostic`

`project panel: select next directory`
:   Selects the next directory.
    Keymap Name: `project_panel::SelectNextDirectory`

`project panel: select next git entry`
:   Selects the next entry with git changes.
    Keymap Name: `project_panel::SelectNextGitEntry`

`project panel: select parent`
:   Selects the parent directory.
    Keymap Name: `project_panel::SelectParent`

`project panel: select prev diagnostic`
:   Selects the previous entry with diagnostics.
    Keymap Name: `project_panel::SelectPrevDiagnostic`

`project panel: select prev directory`
:   Selects the previous directory.
    Keymap Name: `project_panel::SelectPrevDirectory`

`project panel: select prev git entry`
:   Selects the previous entry with git changes.
    Keymap Name: `project_panel::SelectPrevGitEntry`

`project panel: toggle`
:   Toggles the project panel.
    Keymap Name: `project_panel::Toggle`

`project panel: toggle focus`
:   Toggles focus on the project panel.
    Keymap Name: `project_panel::ToggleFocus`

`project panel: toggle hide git ignore`
:   Toggles visibility of git-ignored files.
    Keymap Name: `project_panel::ToggleHideGitIgnore`

`project panel: toggle hide hidden`
:   Toggles visibility of hidden files.
    Keymap Name: `project_panel::ToggleHideHidden`

`project panel: trash`
:   Moves the selected file or directory to the system trash.
    Keymap Name: `project_panel::Trash`

`project panel: unfold directory`
:   Unfolds the selected directory.
    Keymap Name: `project_panel::UnfoldDirectory`

`project search: next field`
:   Moves to the next input field.
    Keymap Name: `project_search::NextField`

`project search: search in new`
:   Searches in a new project search tab.
    Keymap Name: `project_search::SearchInNew`

`project search: toggle all search results`
:   Toggles collapse/expand state of all search result excerpts.
    Keymap Name: `project_search::ToggleAllSearchResults`

`project search: toggle filters`
:   Toggles the search filters panel.
    Keymap Name: `project_search::ToggleFilters`

`project search: toggle focus`
:   Toggles focus between the search bar and the search results.
    Keymap Name: `project_search::ToggleFocus`

`project symbols: toggle`
:   Toggles the project symbols search.
    Keymap Name: `project_symbols::Toggle`

`projects: initialize dev container`
:   Keymap Name: `projects::InitializeDevContainer`

`projects: open dev container`
:   Opens the dev container connection modal.
    Keymap Name: `projects::OpenDevContainer`

`projects: open recent`
:   Opens the recent projects interface.
    Keymap Name: `projects::OpenRecent`

`projects: open remote`
:   Creates a project from a selected template.
    Keymap Name: `projects::OpenRemote`

`recent projects: toggle actions menu`
:   Keymap Name: `recent_projects::ToggleActionsMenu`

`remote debug: simulate disconnect`
:   Simulates a disconnection from the remote server for testing purposes.
    This will trigger the reconnection logic.
    Keymap Name: `remote_debug::SimulateDisconnect`

`remote debug: simulate timeout`
:   Simulates a timeout/slow connection to the remote server for testing purposes.
    This will cause heartbeat failures and trigger reconnection.
    Keymap Name: `remote_debug::SimulateTimeout`

`remote debug: simulate timeout exhausted`
:   Simulates a timeout/slow connection to the remote server for testing purposes.
    This will cause heartbeat failures and attempting a reconnection while having exhausted all attempts.
    Keymap Name: `remote_debug::SimulateTimeoutExhausted`

`repl: clear current output`
:   Clears the output of the cell at the current cursor position.
    Keymap Name: `repl::ClearCurrentOutput`

`repl: clear outputs`
:   Clears all outputs in the REPL.
    Keymap Name: `repl::ClearOutputs`

`repl: interrupt`
:   Interrupts the currently running kernel.
    Keymap Name: `repl::Interrupt`

`repl: refresh kernelspecs`
:   Refreshes the list of available kernelspecs.
    Keymap Name: `repl::RefreshKernelspecs`

`repl: restart`
:   Restarts the current kernel.
    Keymap Name: `repl::Restart`

`repl: run`
:   Runs the current cell and advances to the next one.
    Keymap Name: `repl::Run`

`repl: run in place`
:   Runs the current cell without advancing.
    Keymap Name: `repl::RunInPlace`

`repl: sessions`
:   Opens the REPL sessions panel.
    Keymap Name: `repl::Sessions`

`repl: shutdown`
:   Shuts down the current kernel.
    Keymap Name: `repl::Shutdown`

`rules library: delete rule`
:   Deletes the selected rule.
    Keymap Name: `rules_library::DeleteRule`

`rules library: duplicate rule`
:   Duplicates the selected rule.
    Keymap Name: `rules_library::DuplicateRule`

`rules library: new rule`
:   Creates a new rule in the rules library.
    Keymap Name: `rules_library::NewRule`

`rules library: restore default content`
:   Restores a built-in rule to its default content.
    Keymap Name: `rules_library::RestoreDefaultContent`

`rules library: toggle default rule`
:   Toggles whether the selected rule is a default rule.
    Keymap Name: `rules_library::ToggleDefaultRule`

`search: cycle mode`
:   Cycles through search modes.
    Keymap Name: `search::CycleMode`

`search: focus search`
:   Focuses on the search input field.
    Keymap Name: `search::FocusSearch`

`search: next history query`
:   Navigates to the next query in search history.
    Keymap Name: `search::NextHistoryQuery`

`search: previous history query`
:   Navigates to the previous query in search history.
    Keymap Name: `search::PreviousHistoryQuery`

`search: replace all`
:   Replaces all matches.
    Keymap Name: `search::ReplaceAll`

`search: replace next`
:   Replaces the next match.
    Keymap Name: `search::ReplaceNext`

`search: select all matches`
:   Selects all search matches.
    Keymap Name: `search::SelectAllMatches`

`search: select next match`
:   Selects the next search match.
    Keymap Name: `search::SelectNextMatch`

`search: select previous match`
:   Selects the previous search match.
    Keymap Name: `search::SelectPreviousMatch`

`search: toggle case sensitive`
:   Toggles case-sensitive search.
    Keymap Name: `search::ToggleCaseSensitive`

`search: toggle include ignored`
:   Toggles searching in ignored files.
    Keymap Name: `search::ToggleIncludeIgnored`

`search: toggle regex`
:   Toggles regular expression mode.
    Keymap Name: `search::ToggleRegex`

`search: toggle replace`
:   Toggles the replace interface.
    Keymap Name: `search::ToggleReplace`

`search: toggle selection`
:   Toggles searching within selection only.
    Keymap Name: `search::ToggleSelection`

`search: toggle whole word`
:   Toggles whole word matching.
    Keymap Name: `search::ToggleWholeWord`

`settings editor: collapse nav entry`
:   Collapses the navigation entry.
    Keymap Name: `settings_editor::CollapseNavEntry`

`settings editor: expand nav entry`
:   Expands the navigation entry.
    Keymap Name: `settings_editor::ExpandNavEntry`

`settings editor: focus file`
:   Keymap Name: `settings_editor::FocusFile`

`settings editor: focus first nav entry`
:   Focuses the first navigation entry.
    Keymap Name: `settings_editor::FocusFirstNavEntry`

`settings editor: focus last nav entry`
:   Focuses the last navigation entry.
    Keymap Name: `settings_editor::FocusLastNavEntry`

`settings editor: focus next file`
:   Focuses the next file in the file list.
    Keymap Name: `settings_editor::FocusNextFile`

`settings editor: focus next nav entry`
:   Focuses and opens the next navigation entry without moving focus to content.
    Keymap Name: `settings_editor::FocusNextNavEntry`

`settings editor: focus next root nav entry`
:   Focuses the next root navigation entry.
    Keymap Name: `settings_editor::FocusNextRootNavEntry`

`settings editor: focus previous file`
:   Focuses the previous file in the file list.
    Keymap Name: `settings_editor::FocusPreviousFile`

`settings editor: focus previous nav entry`
:   Focuses and opens the previous navigation entry without moving focus to content.
    Keymap Name: `settings_editor::FocusPreviousNavEntry`

`settings editor: focus previous root nav entry`
:   Focuses the previous root navigation entry.
    Keymap Name: `settings_editor::FocusPreviousRootNavEntry`

`settings editor: minimize`
:   Minimizes the settings UI window.
    Keymap Name: `settings_editor::Minimize`

`settings editor: open current file`
:   Opens an editor for the current file
    Keymap Name: `settings_editor::OpenCurrentFile`

`settings editor: toggle focus nav`
:   Toggles focus between the navbar and the main content.
    Keymap Name: `settings_editor::ToggleFocusNav`

`settings profile selector: toggle`
:   Keymap Name: `settings_profile_selector::Toggle`

`snippets: configure snippets`
:   Opens the snippets configuration file.
    Keymap Name: `snippets::ConfigureSnippets`

`snippets: open folder`
:   Opens the snippets folder in the file manager.
    Keymap Name: `snippets::OpenFolder`

`stash picker: drop stash item`
:   Drop the selected stash entry.
    Keymap Name: `stash_picker::DropStashItem`

`stash picker: show stash item`
:   Show the diff view of the selected stash entry.
    Keymap Name: `stash_picker::ShowStashItem`

`svg: open following preview`
:   Opens a following SVG preview that syncs with the editor.
    Keymap Name: `svg::OpenFollowingPreview`

`svg: open preview`
:   Opens an SVG preview for the current file.
    Keymap Name: `svg::OpenPreview`

`svg: open preview to the side`
:   Opens an SVG preview in a split pane.
    Keymap Name: `svg::OpenPreviewToTheSide`

`syntax tree view: use active editor`
:   Update the syntax tree view to show the last focused file.
    Keymap Name: `syntax_tree_view::UseActiveEditor`

`tab switcher: close selected item`
:   Closes the selected item in the tab switcher.
    Keymap Name: `tab_switcher::CloseSelectedItem`

`tab switcher: open in active pane`
:   Toggles the tab switcher showing all tabs across all panes, deduplicated by path.
    Opens selected items in the active pane.
    Keymap Name: `tab_switcher::OpenInActivePane`

`tab switcher: toggle`
:   Toggles the tab switcher interface.
    Keymap Name: `tab_switcher::Toggle`

`tab switcher: toggle all`
:   Toggles between showing all tabs or just the current pane's tabs.
    Keymap Name: `tab_switcher::ToggleAll`

`task: rerun`
:   Reruns the last task.
    Keymap Name: `task::Rerun`

`task: spawn`
:   Spawns a task with name or opens tasks modal.
    Keymap Name: `task::Spawn`

`terminal: clear`
:   Clears the terminal screen.
    Keymap Name: `terminal::Clear`

`terminal: copy`
:   Copies selected text to the clipboard.
    Keymap Name: `terminal::Copy`

`terminal: paste`
:   Pastes from the clipboard.
    Keymap Name: `terminal::Paste`

`terminal: rename terminal`
:   Renames the terminal tab.
    Keymap Name: `terminal::RenameTerminal`

`terminal: rerun task`
:   Reruns the last executed task in the terminal.
    Keymap Name: `terminal::RerunTask`

`terminal: scroll half page down`
:   Scrolls down by half a page.
    Keymap Name: `terminal::ScrollHalfPageDown`

`terminal: scroll half page up`
:   Scrolls up by half a page.
    Keymap Name: `terminal::ScrollHalfPageUp`

`terminal: scroll line down`
:   Scrolls down by one line.
    Keymap Name: `terminal::ScrollLineDown`

`terminal: scroll line up`
:   Scrolls up by one line.
    Keymap Name: `terminal::ScrollLineUp`

`terminal: scroll page down`
:   Scrolls down by one page.
    Keymap Name: `terminal::ScrollPageDown`

`terminal: scroll page up`
:   Scrolls up by one page.
    Keymap Name: `terminal::ScrollPageUp`

`terminal: scroll to bottom`
:   Scrolls to the bottom of the terminal buffer.
    Keymap Name: `terminal::ScrollToBottom`

`terminal: scroll to top`
:   Scrolls to the top of the terminal buffer.
    Keymap Name: `terminal::ScrollToTop`

`terminal: search test`
:   Searches for text in the terminal.
    Keymap Name: `terminal::SearchTest`

`terminal: select all`
:   Selects all text in the terminal.
    Keymap Name: `terminal::SelectAll`

`terminal: send keystroke`
:   Sends a keystroke sequence to the terminal.
    Keymap Name: `terminal::SendKeystroke`

`terminal: send text`
:   Sends the specified text directly to the terminal.
    Keymap Name: `terminal::SendText`

`terminal: show character palette`
:   Shows the character palette for special characters.
    Keymap Name: `terminal::ShowCharacterPalette`

`terminal: toggle vi mode`
:   Toggles vi mode in the terminal.
    Keymap Name: `terminal::ToggleViMode`

`terminal panel: toggle`
:   Toggles the terminal panel.
    Keymap Name: `terminal_panel::Toggle`

`terminal panel: toggle focus`
:   Toggles focus on the terminal panel.
    Keymap Name: `terminal_panel::ToggleFocus`

`theme selector: reload`
:   Reloads all themes from disk.
    Keymap Name: `theme_selector::Reload`

`theme selector: toggle`
:   Toggles the theme selector interface.
    Keymap Name: `theme_selector::Toggle`

`toast: run action`
:   Runs the action associated with a toast notification.
    Keymap Name: `toast::RunAction`

`toolchain: add toolchain`
:   Adds a new toolchain for the current project.
    Keymap Name: `toolchain::AddToolchain`

`toolchain: select`
:   Selects a toolchain for the current project.
    Keymap Name: `toolchain::Select`

`variable list: add watch`
:   Adds the selected variable to the watch list.
    Keymap Name: `variable_list::AddWatch`

`variable list: collapse selected entry`
:   Collapses the selected variable entry to hide its children.
    Keymap Name: `variable_list::CollapseSelectedEntry`

`variable list: copy variable name`
:   Copies the variable name to the clipboard.
    Keymap Name: `variable_list::CopyVariableName`

`variable list: copy variable value`
:   Copies the variable value to the clipboard.
    Keymap Name: `variable_list::CopyVariableValue`

`variable list: edit variable`
:   Edits the value of the selected variable.
    Keymap Name: `variable_list::EditVariable`

`variable list: expand selected entry`
:   Expands the selected variable entry to show its children.
    Keymap Name: `variable_list::ExpandSelectedEntry`

`variable list: go to memory`
:   Jump to variable's memory location.
    Keymap Name: `variable_list::GoToMemory`

`variable list: remove watch`
:   Removes the selected variable from the watch list.
    Keymap Name: `variable_list::RemoveWatch`

`vim: angle brackets`
:   Operates on text within or around angle brackets `<>`.
    Keymap Name: `vim::AngleBrackets`

`vim: any brackets`
:   Selects text within any type of brackets.
    Keymap Name: `vim::AnyBrackets`

`vim: any quotes`
:   Selects text within any type of quotes.
    Keymap Name: `vim::AnyQuotes`

`vim: argument`
:   Selects a function argument.
    Keymap Name: `vim::Argument`

`vim: argument required`
:   Indicates that an argument is required for the command.
    Keymap Name: `vim::ArgumentRequired`

`vim: auto indent`
:   Automatically adjusts indentation based on syntax.
    Keymap Name: `vim::AutoIndent`

`vim: back quotes`
:   Selects text within backticks.
    Keymap Name: `vim::BackQuotes`

`vim: change case`
:   Toggles the case of selected text.
    Keymap Name: `vim::ChangeCase`

`vim: change list newer`
:   Navigates to a newer position in the change list.
    Keymap Name: `vim::ChangeListNewer`

`vim: change list older`
:   Navigates to an older position in the change list.
    Keymap Name: `vim::ChangeListOlder`

`vim: change to end of line`
:   Changes from cursor to end of line.
    Keymap Name: `vim::ChangeToEndOfLine`

`vim: class`
:   Selects a class definition.
    Keymap Name: `vim::Class`

`vim: clear exchange`
:   Clears the exchange register.
    Keymap Name: `vim::ClearExchange`

`vim: clear operators`
:   Clears any pending operators.
    Keymap Name: `vim::ClearOperators`

`vim: column left`
:   Scrolls left by one column.
    Keymap Name: `vim::ColumnLeft`

`vim: column right`
:   Scrolls right by one column.
    Keymap Name: `vim::ColumnRight`

`vim: comment`
:   Selects a comment block.
    Keymap Name: `vim::Comment`

`vim: convert to lower case`
:   Converts selected text to lowercase.
    Keymap Name: `vim::ConvertToLowerCase`

`vim: convert to rot13`
:   Applies ROT13 cipher to selected text.
    Keymap Name: `vim::ConvertToRot13`

`vim: convert to rot47`
:   Applies ROT47 cipher to selected text.
    Keymap Name: `vim::ConvertToRot47`

`vim: convert to upper case`
:   Converts selected text to uppercase.
    Keymap Name: `vim::ConvertToUpperCase`

`vim: count command`
:   Executes a command with a count prefix.
    Keymap Name: `vim::CountCommand`

`vim: curly brackets`
:   Operates on text within or around curly brackets `{}`.
    Keymap Name: `vim::CurlyBrackets`

`vim: current line`
:   Selects the current line.
    Keymap Name: `vim::CurrentLine`

`vim: decrement`
:   Decrements the number under the cursor or toggles boolean values.
    Keymap Name: `vim::Decrement`

`vim: delete left`
:   Deletes character to the left.
    Keymap Name: `vim::DeleteLeft`

`vim: delete right`
:   Deletes character to the right.
    Keymap Name: `vim::DeleteRight`

`vim: delete to end of line`
:   Deletes from cursor to end of line.
    Keymap Name: `vim::DeleteToEndOfLine`

`vim: double quotes`
:   Selects text within double quotes.
    Keymap Name: `vim::DoubleQuotes`

`vim: down`
:   Moves cursor down by the specified number of lines.
    Keymap Name: `vim::Down`

`vim: end of document`
:   Moves to the end of the document.
    Keymap Name: `vim::EndOfDocument`

`vim: end of line`
:   Moves to the end of the current line.
    Keymap Name: `vim::EndOfLine`

`vim: end of line downward`
:   Moves to the end of a line downward.
    Keymap Name: `vim::EndOfLineDownward`

`vim: end of paragraph`
:   Moves to the end of the paragraph.
    Keymap Name: `vim::EndOfParagraph`

`vim: end repeat`
:   Ends the repeat recording.
    Keymap Name: `vim::EndRepeat`

`vim: enter`
:   Inserts a newline.
    Keymap Name: `vim::Enter`

`vim: entire file`
:   Selects the entire file.
    Keymap Name: `vim::EntireFile`

`vim: exchange`
:   Exchanges text regions.
    Keymap Name: `vim::Exchange`

`vim: find command`
:   Executes a find command to search for patterns in the buffer.
    Keymap Name: `vim::FindCommand`

`vim: first non whitespace`
:   Moves to the first non-whitespace character on the current line.
    Keymap Name: `vim::FirstNonWhitespace`

`vim: go to column`
:   Goes to a specific column number.
    Keymap Name: `vim::GoToColumn`

`vim: go to next reference`
:   Goes to the next reference to the symbol under the cursor.
    Keymap Name: `vim::GoToNextReference`

`vim: go to percentage`
:   Goes to a percentage position in the file.
    Keymap Name: `vim::GoToPercentage`

`vim: go to previous reference`
:   Goes to the previous reference to the symbol under the cursor.
    Keymap Name: `vim::GoToPreviousReference`

`vim: go to previous tab`
:   Go to previous tab page (with count support).
    Keymap Name: `vim::GoToPreviousTab`

`vim: go to tab`
:   Go to tab page (with count support).
    Keymap Name: `vim::GoToTab`

`vim: half page left`
:   Scrolls left by half a page's width.
    Keymap Name: `vim::HalfPageLeft`

`vim: half page right`
:   Scrolls right by half a page's width.
    Keymap Name: `vim::HalfPageRight`

`vim: helix append`
:   Appends at the end of the selection.
    Keymap Name: `vim::HelixAppend`

`vim: helix collapse selection`
:   Collapse the current selection
    Keymap Name: `vim::HelixCollapseSelection`

`vim: helix delete`
:   Deletes using Helix-style behavior.
    Keymap Name: `vim::HelixDelete`

`vim: helix duplicate above`
:   Copies all selections above.
    Keymap Name: `vim::HelixDuplicateAbove`

`vim: helix duplicate below`
:   Copies all selections below.
    Keymap Name: `vim::HelixDuplicateBelow`

`vim: helix goto last modification`
:   Goes to the location of the last modification.
    Keymap Name: `vim::HelixGotoLastModification`

`vim: helix insert`
:   Inserts at the beginning of the selection.
    Keymap Name: `vim::HelixInsert`

`vim: helix keep newest selection`
:   Removes all but the one selection that was created last.
    `Newest` can eventually be `Primary`.
    Keymap Name: `vim::HelixKeepNewestSelection`

`vim: helix paste`
:   Pastes text from the specified register at the cursor position.
    Keymap Name: `vim::HelixPaste`

`vim: helix select line`
:   Select entire line or multiple lines, extending downwards.
    Keymap Name: `vim::HelixSelectLine`

`vim: helix select next`
:   Select the next match for the current search query.
    Keymap Name: `vim::HelixSelectNext`

`vim: helix select previous`
:   Select the previous match for the current search query.
    Keymap Name: `vim::HelixSelectPrevious`

`vim: helix select regex`
:   Select all matches of a given pattern within the current selection.
    Keymap Name: `vim::HelixSelectRegex`

`vim: helix substitute`
:   Delete the selection and enter edit mode.
    Keymap Name: `vim::HelixSubstitute`

`vim: helix substitute no yank`
:   Delete the selection and enter edit mode, without yanking the selection.
    Keymap Name: `vim::HelixSubstituteNoYank`

`vim: helix yank`
:   Yanks the current selection or character if no selection.
    Keymap Name: `vim::HelixYank`

`vim: increment`
:   Increments the number under the cursor or toggles boolean values.
    Keymap Name: `vim::Increment`

`vim: indent`
:   Increases indentation of selected lines.
    Keymap Name: `vim::Indent`

`vim: indent obj`
:   Selects text at the same indentation level.
    Keymap Name: `vim::IndentObj`

`vim: inner object`
:   Selects inner text object.
    Keymap Name: `vim::InnerObject`

`vim: insert after`
:   Inserts text after the cursor.
    Keymap Name: `vim::InsertAfter`

`vim: insert at previous`
:   Inserts at the previous insert position.
    Keymap Name: `vim::InsertAtPrevious`

`vim: insert before`
:   Inserts text before the cursor.
    Keymap Name: `vim::InsertBefore`

`vim: insert empty line above`
:   Inserts an empty line above without entering insert mode.
    Keymap Name: `vim::InsertEmptyLineAbove`

`vim: insert empty line below`
:   Inserts an empty line below without entering insert mode.
    Keymap Name: `vim::InsertEmptyLineBelow`

`vim: insert end of line`
:   Inserts at the end of the line.
    Keymap Name: `vim::InsertEndOfLine`

`vim: insert first non whitespace`
:   Inserts at the first non-whitespace character.
    Keymap Name: `vim::InsertFirstNonWhitespace`

`vim: insert from above`
:   Inserts the next character from the line above into the current line.
    Keymap Name: `vim::InsertFromAbove`

`vim: insert from below`
:   Inserts the next character from the line below into the current line.
    Keymap Name: `vim::InsertFromBelow`

`vim: insert line above`
:   Inserts a new line above the current line.
    Keymap Name: `vim::InsertLineAbove`

`vim: insert line below`
:   Inserts a new line below the current line.
    Keymap Name: `vim::InsertLineBelow`

`vim: join lines`
:   Joins the current line with the next line.
    Keymap Name: `vim::JoinLines`

`vim: join lines no whitespace`
:   Joins lines without adding whitespace.
    Keymap Name: `vim::JoinLinesNoWhitespace`

`vim: left`
:   Moves cursor left one character.
    Keymap Name: `vim::Left`

`vim: line down`
:   Scrolls down by one line.
    Keymap Name: `vim::LineDown`

`vim: line up`
:   Scrolls up by one line.
    Keymap Name: `vim::LineUp`

`vim: literal`
:   Keymap Name: `vim::Literal`

`vim: matching`
:   Moves to the matching bracket or delimiter.
    Keymap Name: `vim::Matching`

`vim: maximize pane`
:   Maximizes the current pane.
    Keymap Name: `vim::MaximizePane`

`vim: menu select next`
:   Selects (count) next menu item
    Keymap Name: `vim::MenuSelectNext`

`vim: menu select previous`
:   Selects (count) previous menu item
    Keymap Name: `vim::MenuSelectPrevious`

`vim: method`
:   Selects a method or function.
    Keymap Name: `vim::Method`

`vim: middle of line`
:   Moves to the middle of the current line.
    Keymap Name: `vim::MiddleOfLine`

`vim: mini brackets`
:   Selects text within the nearest brackets.
    Keymap Name: `vim::MiniBrackets`

`vim: mini quotes`
:   Selects text within the nearest quotes (single or double).
    Keymap Name: `vim::MiniQuotes`

`vim: move to next`
:   Moves to the next search match.
    Keymap Name: `vim::MoveToNext`

`vim: move to next match`
:   Moves to the next search match.
    Keymap Name: `vim::MoveToNextMatch`

`vim: move to previous`
:   Moves to the previous search match.
    Keymap Name: `vim::MoveToPrevious`

`vim: move to previous match`
:   Moves to the previous search match.
    Keymap Name: `vim::MoveToPreviousMatch`

`vim: next comment`
:   Moves to the next comment.
    Keymap Name: `vim::NextComment`

`vim: next greater indent`
:   Moves to the next line with greater indentation.
    Keymap Name: `vim::NextGreaterIndent`

`vim: next lesser indent`
:   Moves to the next line with lesser indentation.
    Keymap Name: `vim::NextLesserIndent`

`vim: next line start`
:   Moves to the start of the next line.
    Keymap Name: `vim::NextLineStart`

`vim: next method end`
:   Moves to the end of the next method.
    Keymap Name: `vim::NextMethodEnd`

`vim: next method start`
:   Moves to the start of the next method.
    Keymap Name: `vim::NextMethodStart`

`vim: next same indent`
:   Moves to the next line with the same indentation.
    Keymap Name: `vim::NextSameIndent`

`vim: next section end`
:   Moves to the end of the next section.
    Keymap Name: `vim::NextSectionEnd`

`vim: next section start`
:   Moves to the start of the next section.
    Keymap Name: `vim::NextSectionStart`

`vim: next subword end`
:   Moves to the end of the next subword.
    Keymap Name: `vim::NextSubwordEnd`

`vim: next subword start`
:   Moves to the start of the next subword.
    Keymap Name: `vim::NextSubwordStart`

`vim: next word end`
:   Moves to the end of the next word.
    Keymap Name: `vim::NextWordEnd`

`vim: next word start`
:   Moves to the start of the next word.
    Keymap Name: `vim::NextWordStart`

`vim: normal before`
:   Switches to normal mode with cursor positioned before the current character.
    Keymap Name: `vim::NormalBefore`

`vim: number`
:   Number is used to manage vim's count. Pushing a digit
    multiplies the current value by 10 and adds the digit.
    Keymap Name: `vim::Number`

`vim: open default keymap`
:   Opens the default keymap file.
    Keymap Name: `vim::OpenDefaultKeymap`

`vim: other end`
:   Moves cursor to the other end of the selection.
    Keymap Name: `vim::OtherEnd`

`vim: other end row aware`
:   Moves cursor to the other end of the selection (row-aware).
    Keymap Name: `vim::OtherEndRowAware`

`vim: outdent`
:   Decreases indentation of selected lines.
    Keymap Name: `vim::Outdent`

`vim: page down`
:   Scrolls down by one page.
    Keymap Name: `vim::PageDown`

`vim: page up`
:   Scrolls up by one page.
    Keymap Name: `vim::PageUp`

`vim: paragraph`
:   Selects a paragraph text object.
    Keymap Name: `vim::Paragraph`

`vim: parentheses`
:   Operates on text within or around parentheses `()`.
    Keymap Name: `vim::Parentheses`

`vim: paste`
:   Pastes text from the specified register at the cursor position.
    Keymap Name: `vim::Paste`

`vim: previous comment`
:   Moves to the previous comment.
    Keymap Name: `vim::PreviousComment`

`vim: previous greater indent`
:   Moves to the previous line with greater indentation.
    Keymap Name: `vim::PreviousGreaterIndent`

`vim: previous lesser indent`
:   Moves to the previous line with lesser indentation.
    Keymap Name: `vim::PreviousLesserIndent`

`vim: previous line start`
:   Moves to the start of the previous line.
    Keymap Name: `vim::PreviousLineStart`

`vim: previous method end`
:   Moves to the end of the previous method.
    Keymap Name: `vim::PreviousMethodEnd`

`vim: previous method start`
:   Moves to the start of the previous method.
    Keymap Name: `vim::PreviousMethodStart`

`vim: previous same indent`
:   Moves to the previous line with the same indentation.
    Keymap Name: `vim::PreviousSameIndent`

`vim: previous section end`
:   Moves to the end of the previous section.
    Keymap Name: `vim::PreviousSectionEnd`

`vim: previous section start`
:   Moves to the start of the previous section.
    Keymap Name: `vim::PreviousSectionStart`

`vim: previous subword end`
:   Moves to the end of the previous subword.
    Keymap Name: `vim::PreviousSubwordEnd`

`vim: previous subword start`
:   Moves to the start of the previous subword.
    Keymap Name: `vim::PreviousSubwordStart`

`vim: previous word end`
:   Moves to the end of the previous word.
    Keymap Name: `vim::PreviousWordEnd`

`vim: previous word start`
:   Moves to the start of the previous word.
    Keymap Name: `vim::PreviousWordStart`

`vim: push add surrounds`
:   Keymap Name: `vim::PushAddSurrounds`

`vim: push auto indent`
:   Starts an auto-indent operation.
    Keymap Name: `vim::PushAutoIndent`

`vim: push change`
:   Starts a change operation.
    Keymap Name: `vim::PushChange`

`vim: push change surrounds`
:   Keymap Name: `vim::PushChangeSurrounds`

`vim: push delete`
:   Starts a delete operation.
    Keymap Name: `vim::PushDelete`

`vim: push delete surrounds`
:   Deletes surrounding characters.
    Keymap Name: `vim::PushDeleteSurrounds`

`vim: push digraph`
:   Keymap Name: `vim::PushDigraph`

`vim: push find backward`
:   Keymap Name: `vim::PushFindBackward`

`vim: push find forward`
:   Keymap Name: `vim::PushFindForward`

`vim: push forced motion`
:   Starts a forced motion.
    Keymap Name: `vim::PushForcedMotion`

`vim: push helix match`
:   Starts a match operation.
    Keymap Name: `vim::PushHelixMatch`

`vim: push helix next`
:   Selects the next object.
    Keymap Name: `vim::PushHelixNext`

`vim: push helix previous`
:   Selects the previous object.
    Keymap Name: `vim::PushHelixPrevious`

`vim: push helix surround add`
:   Adds surrounding characters in Helix mode.
    Keymap Name: `vim::PushHelixSurroundAdd`

`vim: push helix surround delete`
:   Deletes surrounding characters in Helix mode.
    Keymap Name: `vim::PushHelixSurroundDelete`

`vim: push helix surround replace`
:   Replaces surrounding characters in Helix mode.
    Keymap Name: `vim::PushHelixSurroundReplace`

`vim: push indent`
:   Starts an indent operation.
    Keymap Name: `vim::PushIndent`

`vim: push jump`
:   Keymap Name: `vim::PushJump`

`vim: push literal`
:   Keymap Name: `vim::PushLiteral`

`vim: push lowercase`
:   Converts to lowercase.
    Keymap Name: `vim::PushLowercase`

`vim: push mark`
:   Sets a mark at the current position.
    Keymap Name: `vim::PushMark`

`vim: push object`
:   Keymap Name: `vim::PushObject`

`vim: push opposite case`
:   Toggles case.
    Keymap Name: `vim::PushOppositeCase`

`vim: push outdent`
:   Starts an outdent operation.
    Keymap Name: `vim::PushOutdent`

`vim: push record register`
:   Starts recording to a register.
    Keymap Name: `vim::PushRecordRegister`

`vim: push register`
:   Selects a register.
    Keymap Name: `vim::PushRegister`

`vim: push replace`
:   Starts a replace operation.
    Keymap Name: `vim::PushReplace`

`vim: push replace with register`
:   Replaces with register contents.
    Keymap Name: `vim::PushReplaceWithRegister`

`vim: push replay register`
:   Replays a register.
    Keymap Name: `vim::PushReplayRegister`

`vim: push rewrap`
:   Starts a rewrap operation.
    Keymap Name: `vim::PushRewrap`

`vim: push rot13`
:   Applies ROT13 encoding.
    Keymap Name: `vim::PushRot13`

`vim: push rot47`
:   Applies ROT47 encoding.
    Keymap Name: `vim::PushRot47`

`vim: push shell command`
:   Starts a shell command operation.
    Keymap Name: `vim::PushShellCommand`

`vim: push sneak`
:   Keymap Name: `vim::PushSneak`

`vim: push sneak backward`
:   Keymap Name: `vim::PushSneakBackward`

`vim: push toggle comments`
:   Toggles comments.
    Keymap Name: `vim::PushToggleComments`

`vim: push uppercase`
:   Converts to uppercase.
    Keymap Name: `vim::PushUppercase`

`vim: push yank`
:   Starts a yank operation.
    Keymap Name: `vim::PushYank`

`vim: quotes`
:   Selects text within single quotes.
    Keymap Name: `vim::Quotes`

`vim: redo`
:   Redoes the last undone change.
    Keymap Name: `vim::Redo`

`vim: repeat`
:   Repeats the last change.
    Keymap Name: `vim::Repeat`

`vim: repeat find`
:   Repeats the last character find.
    Keymap Name: `vim::RepeatFind`

`vim: repeat find reversed`
:   Repeats the last character find in reverse.
    Keymap Name: `vim::RepeatFindReversed`

`vim: replay last recording`
:   Replays the last recorded macro.
    Keymap Name: `vim::ReplayLastRecording`

`vim: reset pane sizes`
:   Resets all pane sizes to default.
    Keymap Name: `vim::ResetPaneSizes`

`vim: resize pane down`
:   Resizes the pane downward.
    Keymap Name: `vim::ResizePaneDown`

`vim: resize pane left`
:   Resizes the pane to the left.
    Keymap Name: `vim::ResizePaneLeft`

`vim: resize pane right`
:   Resizes the pane to the right.
    Keymap Name: `vim::ResizePaneRight`

`vim: resize pane up`
:   Resizes the pane upward.
    Keymap Name: `vim::ResizePaneUp`

`vim: restore visual selection`
:   Restores the previous visual selection.
    Keymap Name: `vim::RestoreVisualSelection`

`vim: rewrap`
:   Rewraps the selected text to fit within the line width.
    Keymap Name: `vim::Rewrap`

`vim: right`
:   Moves cursor right one character.
    Keymap Name: `vim::Right`

`vim: scroll down`
:   Scrolls down by half a page.
    Keymap Name: `vim::ScrollDown`

`vim: scroll up`
:   Scrolls up by half a page.
    Keymap Name: `vim::ScrollUp`

`vim: search`
:   Initiates a search operation with the specified parameters.
    Keymap Name: `vim::Search`

`vim: search submit`
:   Submits the current search query.
    Keymap Name: `vim::SearchSubmit`

`vim: search under cursor`
:   Searches for the word under the cursor without moving.
    Keymap Name: `vim::SearchUnderCursor`

`vim: search under cursor previous`
:   Searches for the word under the cursor without moving (backwards).
    Keymap Name: `vim::SearchUnderCursorPrevious`

`vim: select larger syntax node`
:   Selects the next larger syntax node.
    Keymap Name: `vim::SelectLargerSyntaxNode`

`vim: select next`
:   Selects the next occurrence of the current selection.
    Keymap Name: `vim::SelectNext`

`vim: select next match`
:   Selects the next match of the current selection.
    Keymap Name: `vim::SelectNextMatch`

`vim: select next syntax node`
:   Selects the next syntax node sibling.
    Keymap Name: `vim::SelectNextSyntaxNode`

`vim: select previous`
:   Selects the previous occurrence of the current selection.
    Keymap Name: `vim::SelectPrevious`

`vim: select previous match`
:   Selects the previous match of the current selection.
    Keymap Name: `vim::SelectPreviousMatch`

`vim: select previous syntax node`
:   Selects the previous syntax node sibling.
    Keymap Name: `vim::SelectPreviousSyntaxNode`

`vim: select register`
:   Keymap Name: `vim::SelectRegister`

`vim: select smaller syntax node`
:   Selects the next smaller syntax node.
    Keymap Name: `vim::SelectSmallerSyntaxNode`

`vim: sentence`
:   Selects a sentence text object.
    Keymap Name: `vim::Sentence`

`vim: sentence backward`
:   Moves to the start of the previous sentence.
    Keymap Name: `vim::SentenceBackward`

`vim: sentence forward`
:   Moves to the start of the next sentence.
    Keymap Name: `vim::SentenceForward`

`vim: shell command`
:   Executes a shell command.
    Keymap Name: `vim::ShellCommand`

`vim: show location`
:   Shows the current location in the file.
    Keymap Name: `vim::ShowLocation`

`vim: square brackets`
:   Operates on text within or around square brackets `[]`.
    Keymap Name: `vim::SquareBrackets`

`vim: start of document`
:   Moves to the start of the document.
    Keymap Name: `vim::StartOfDocument`

`vim: start of line`
:   Moves to the start of the current line.
    Keymap Name: `vim::StartOfLine`

`vim: start of line downward`
:   Moves to the start of a line downward.
    Keymap Name: `vim::StartOfLineDownward`

`vim: start of paragraph`
:   Moves to the start of the paragraph.
    Keymap Name: `vim::StartOfParagraph`

`vim: substitute`
:   Substitutes characters in the current selection.
    Keymap Name: `vim::Substitute`

`vim: substitute line`
:   Substitutes the entire line.
    Keymap Name: `vim::SubstituteLine`

`vim: subword`
:   Selects a subword text object.
    Keymap Name: `vim::Subword`

`vim: switch to helix normal mode`
:   Switches to Helix-style normal mode.
    Keymap Name: `vim::SwitchToHelixNormalMode`

`vim: switch to insert mode`
:   Switches to insert mode.
    Keymap Name: `vim::SwitchToInsertMode`

`vim: switch to normal mode`
:   Switches to normal mode.
    Keymap Name: `vim::SwitchToNormalMode`

`vim: switch to replace mode`
:   Switches to replace mode.
    Keymap Name: `vim::SwitchToReplaceMode`

`vim: switch to visual block mode`
:   Switches to visual block mode.
    Keymap Name: `vim::SwitchToVisualBlockMode`

`vim: switch to visual line mode`
:   Switches to visual line mode.
    Keymap Name: `vim::SwitchToVisualLineMode`

`vim: switch to visual mode`
:   Switches to visual mode.
    Keymap Name: `vim::SwitchToVisualMode`

`vim: tab`
:   Inserts a tab character.
    Keymap Name: `vim::Tab`

`vim: tag`
:   Selects an HTML/XML tag.
    Keymap Name: `vim::Tag`

`vim: temporary normal`
:   Temporarily switches to normal mode for one command.
    Keymap Name: `vim::TemporaryNormal`

`vim: toggle comments`
:   Toggles comments for selected lines.
    Keymap Name: `vim::ToggleComments`

`vim: toggle marks view`
:   Toggles the marks view.
    Keymap Name: `vim::ToggleMarksView`

`vim: toggle project panel focus`
:   Clears count or toggles project panel focus
    Keymap Name: `vim::ToggleProjectPanelFocus`

`vim: toggle record`
:   Toggles macro recording.
    Keymap Name: `vim::ToggleRecord`

`vim: toggle registers view`
:   Toggles the registers view.
    Keymap Name: `vim::ToggleRegistersView`

`vim: toggle replace`
:   Toggles replace mode.
    Keymap Name: `vim::ToggleReplace`

`vim: toggle visual`
:   Toggles visual mode.
    Keymap Name: `vim::ToggleVisual`

`vim: toggle visual block`
:   Toggles visual block mode.
    Keymap Name: `vim::ToggleVisualBlock`

`vim: toggle visual line`
:   Toggles visual line mode.
    Keymap Name: `vim::ToggleVisualLine`

`vim: undo`
:   Undoes the last change.
    Keymap Name: `vim::Undo`

`vim: undo last line`
:   Undoes all changes to the most recently changed line.
    Keymap Name: `vim::UndoLastLine`

`vim: undo replace`
:   Undoes the last replacement.
    Keymap Name: `vim::UndoReplace`

`vim: unmatched backward`
:   Finds the previous unmatched bracket or delimiter.
    Keymap Name: `vim::UnmatchedBackward`

`vim: unmatched forward`
:   Finds the next unmatched bracket or delimiter.
    Keymap Name: `vim::UnmatchedForward`

`vim: up`
:   Moves cursor up by the specified number of lines.
    Keymap Name: `vim::Up`

`vim: vertical bars`
:   Selects text within vertical bars (pipes).
    Keymap Name: `vim::VerticalBars`

`vim: visual command`
:   Executes a command in visual mode.
    Keymap Name: `vim::VisualCommand`

`vim: visual delete`
:   Deletes the visual selection.
    Keymap Name: `vim::VisualDelete`

`vim: visual delete line`
:   Deletes entire lines in visual selection.
    Keymap Name: `vim::VisualDeleteLine`

`vim: visual insert end of line`
:   Inserts at the end of each line in visual selection.
    Keymap Name: `vim::VisualInsertEndOfLine`

`vim: visual insert first non white space`
:   Inserts at the first non-whitespace character of each line.
    Keymap Name: `vim::VisualInsertFirstNonWhiteSpace`

`vim: visual yank`
:   Yanks (copies) the visual selection.
    Keymap Name: `vim::VisualYank`

`vim: visual yank line`
:   Yanks entire lines in visual selection.
    Keymap Name: `vim::VisualYankLine`

`vim: window bottom`
:   Moves to the bottom of the window.
    Keymap Name: `vim::WindowBottom`

`vim: window middle`
:   Moves to the middle of the window.
    Keymap Name: `vim::WindowMiddle`

`vim: window top`
:   Moves to the top of the window.
    Keymap Name: `vim::WindowTop`

`vim: word`
:   Selects a word text object.
    Keymap Name: `vim::Word`

`vim: wrapping left`
:   Moves cursor left one character, wrapping to previous line.
    Keymap Name: `vim::WrappingLeft`
    Deprecated Alias(es): `vim::Backspace`,

`vim: wrapping right`
:   Moves cursor right one character, wrapping to next line.
    Keymap Name: `vim::WrappingRight`
    Deprecated Alias(es): `vim::Space`,

`vim: yank`
:   Yanks (copies) the selected text.
    Keymap Name: `vim::Yank`

`vim: yank line`
:   Yanks the entire line.
    Keymap Name: `vim::YankLine`

`vim: yank to end of line`
:   Yanks from cursor to end of line.
    Keymap Name: `vim::YankToEndOfLine`

`welcome: open recent project`
:   Keymap Name: `welcome::OpenRecentProject`

`window: merge all windows`
:   Keymap Name: `window::MergeAllWindows`

`window: move tab to new window`
:   Keymap Name: `window::MoveTabToNewWindow`

`window: show next window tab`
:   Keymap Name: `window::ShowNextWindowTab`

`window: show previous window tab`
:   Keymap Name: `window::ShowPreviousWindowTab`

`workspace: activate last pane`
:   Activates the last pane in the workspace.
    Keymap Name: `workspace::ActivateLastPane`

`workspace: activate next pane`
:   Activates the next pane in the workspace.
    Keymap Name: `workspace::ActivateNextPane`

`workspace: activate next window`
:   Switches to the next window.
    Keymap Name: `workspace::ActivateNextWindow`

`workspace: activate pane`
:   Activates a specific pane by its index.
    Keymap Name: `workspace::ActivatePane`

`workspace: activate pane down`
:   Activates the pane below.
    Keymap Name: `workspace::ActivatePaneDown`

`workspace: activate pane left`
:   Activates the pane to the left.
    Keymap Name: `workspace::ActivatePaneLeft`

`workspace: activate pane right`
:   Activates the pane to the right.
    Keymap Name: `workspace::ActivatePaneRight`

`workspace: activate pane up`
:   Activates the pane above.
    Keymap Name: `workspace::ActivatePaneUp`

`workspace: activate previous pane`
:   Activates the previous pane in the workspace.
    Keymap Name: `workspace::ActivatePreviousPane`

`workspace: activate previous window`
:   Switches to the previous window.
    Keymap Name: `workspace::ActivatePreviousWindow`

`workspace: add folder to project`
:   Adds a folder to the current project.
    Keymap Name: `workspace::AddFolderToProject`

`workspace: clear all notifications`
:   Clears all notifications.
    Keymap Name: `workspace::ClearAllNotifications`

`workspace: clear navigation history`
:   Clears all navigation history, including forward/backward navigation, recently opened files, and recently closed tabs. \*\*This action is irreversible\*\*.
    Keymap Name: `workspace::ClearNavigationHistory`

`workspace: clear trusted worktrees`
:   Clears all trusted worktrees, placing them in restricted mode on next open.
    Requires restart to take effect on already opened projects.
    Keymap Name: `workspace::ClearTrustedWorktrees`

`workspace: close active dock`
:   Closes the active dock.
    Keymap Name: `workspace::CloseActiveDock`

`workspace: close all docks`
:   Closes all docks.
    Keymap Name: `workspace::CloseAllDocks`

`workspace: close all items and panes`
:   Closes all items and panes in the workspace.
    Keymap Name: `workspace::CloseAllItemsAndPanes`

`workspace: close inactive tabs and panes`
:   Closes all inactive tabs and panes in the workspace.
    Keymap Name: `workspace::CloseInactiveTabsAndPanes`

`workspace: close item in all panes`
:   Closes the active item across all panes.
    Keymap Name: `workspace::CloseItemInAllPanes`

`workspace: close project`
:   Closes the current project.
    Keymap Name: `workspace::CloseProject`

`workspace: close window`
:   Closes the current window.
    Keymap Name: `workspace::CloseWindow`

`workspace: copy path`
:   Keymap Name: `workspace::CopyPath`
    Deprecated Alias(es): `editor::CopyPath`, `outline_panel::CopyPath`, `project_panel::CopyPath`,

`workspace: copy relative path`
:   Keymap Name: `workspace::CopyRelativePath`
    Deprecated Alias(es): `editor::CopyRelativePath`, `outline_panel::CopyRelativePath`, `project_panel::CopyRelativePath`,

`workspace: decrease active dock size`
:   Decreases size of a currently focused dock by a given amount of pixels.
    Keymap Name: `workspace::DecreaseActiveDockSize`

`workspace: decrease open docks size`
:   Decreases size of all currently visible docks uniformly, by a given amount of pixels.
    Keymap Name: `workspace::DecreaseOpenDocksSize`

`workspace: feedback`
:   Opens the feedback dialog.
    Keymap Name: `workspace::Feedback`

`workspace: follow next collaborator`
:   Follows the next collaborator in the session.
    Keymap Name: `workspace::FollowNextCollaborator`

`workspace: increase active dock size`
:   Increases size of a currently focused dock by a given amount of pixels.
    Keymap Name: `workspace::IncreaseActiveDockSize`

`workspace: increase open docks size`
:   Increases size of all currently visible docks uniformly, by a given amount of pixels.
    Keymap Name: `workspace::IncreaseOpenDocksSize`

`workspace: move focused panel to next position`
:   Moves the focused panel to the next position.
    Keymap Name: `workspace::MoveFocusedPanelToNextPosition`

`workspace: move item to pane`
:   Moves an item to a specific pane by index.
    Keymap Name: `workspace::MoveItemToPane`

`workspace: move item to pane in direction`
:   Moves an item to a pane in the specified direction.
    Keymap Name: `workspace::MoveItemToPaneInDirection`

`workspace: move pane down`
:   Move the current pane to be at the very bottom.
    Keymap Name: `workspace::MovePaneDown`

`workspace: move pane left`
:   Move the current pane to be at the far left.
    Keymap Name: `workspace::MovePaneLeft`

`workspace: move pane right`
:   Move the current pane to be at the far right.
    Keymap Name: `workspace::MovePaneRight`

`workspace: move pane up`
:   Move the current pane to be at the very top.
    Keymap Name: `workspace::MovePaneUp`

`workspace: new center terminal`
:   Opens a new terminal in the center.
    Keymap Name: `workspace::NewCenterTerminal`

`workspace: new file`
:   Creates a new file.
    Keymap Name: `workspace::NewFile`

`workspace: new file split`
:   Creates a new file in a split of the desired direction.
    Keymap Name: `workspace::NewFileSplit`

`workspace: new file split horizontal`
:   Creates a new file in a horizontal split.
    Keymap Name: `workspace::NewFileSplitHorizontal`

`workspace: new file split vertical`
:   Creates a new file in a vertical split.
    Keymap Name: `workspace::NewFileSplitVertical`

`workspace: new search`
:   Opens a new search.
    Keymap Name: `workspace::NewSearch`

`workspace: new terminal`
:   Opens a new terminal.
    Keymap Name: `workspace::NewTerminal`

`workspace: new window`
:   Opens a new window.
    Keymap Name: `workspace::NewWindow`

`workspace: open`
:   Opens a file or directory.
    Keymap Name: `workspace::Open`

`workspace: open component preview`
:   Opens the component preview.
    Keymap Name: `workspace::OpenComponentPreview`

`workspace: open files`
:   Opens multiple files.
    Keymap Name: `workspace::OpenFiles`

`workspace: open in terminal`
:   Opens the current location in terminal.
    Keymap Name: `workspace::OpenInTerminal`

`workspace: open terminal`
:   Opens a new terminal with the specified working directory.
    Keymap Name: `workspace::OpenTerminal`

`workspace: open with system`
:   Opens the selected file with the system's default application.
    Keymap Name: `workspace::OpenWithSystem`
    Deprecated Alias(es): `project_panel::OpenWithSystem`,

`workspace: reload`
:   Reloads the application
    Keymap Name: `workspace::Reload`

`workspace: reload active item`
:   Reloads the active item.
    Keymap Name: `workspace::ReloadActiveItem`

`workspace: reset active dock size`
:   Resets the active dock to its default size.
    Keymap Name: `workspace::ResetActiveDockSize`

`workspace: reset open docks size`
:   Resets all open docks to their default sizes.
    Keymap Name: `workspace::ResetOpenDocksSize`

`workspace: restore banner`
:   Restores the banner.
    Keymap Name: `workspace::RestoreBanner`

`workspace: save`
:   Saves the current file with the specified options.
    Keymap Name: `workspace::Save`

`workspace: save all`
:   Saves all open files in the workspace.
    Keymap Name: `workspace::SaveAll`

`workspace: save as`
:   Saves the current file with a new name.
    Keymap Name: `workspace::SaveAs`

`workspace: save without format`
:   Saves without formatting.
    Keymap Name: `workspace::SaveWithoutFormat`

`workspace: send keystrokes`
:   Sends a sequence of keystrokes to the active element.
    Keymap Name: `workspace::SendKeystrokes`

`workspace: shutdown debug adapters`
:   Shuts down all debug adapters.
    Keymap Name: `workspace::ShutdownDebugAdapters`

`workspace: suppress notification`
:   Suppresses the current notification.
    Keymap Name: `workspace::SuppressNotification`

`workspace: swap pane adjacent`
:   Keymap Name: `workspace::SwapPaneAdjacent`

`workspace: swap pane down`
:   Swaps the current pane with the one below.
    Keymap Name: `workspace::SwapPaneDown`

`workspace: swap pane left`
:   Swaps the current pane with the one to the left.
    Keymap Name: `workspace::SwapPaneLeft`

`workspace: swap pane right`
:   Swaps the current pane with the one to the right.
    Keymap Name: `workspace::SwapPaneRight`

`workspace: swap pane up`
:   Swaps the current pane with the one above.
    Keymap Name: `workspace::SwapPaneUp`

`workspace: toggle all docks`
:   Toggles all docks.
    Keymap Name: `workspace::ToggleAllDocks`

`workspace: toggle bottom dock`
:   Toggles the bottom dock.
    Keymap Name: `workspace::ToggleBottomDock`

`workspace: toggle centered layout`
:   Toggles centered layout mode.
    Keymap Name: `workspace::ToggleCenteredLayout`

`workspace: toggle edit prediction`
:   Toggles edit prediction feature globally for all files.
    Keymap Name: `workspace::ToggleEditPrediction`

`workspace: toggle expand item`
:   Toggles expansion of the selected item.
    Keymap Name: `workspace::ToggleExpandItem`

`workspace: toggle helix mode`
:   Toggles Helix mode on or off.
    Keymap Name: `workspace::ToggleHelixMode`

`workspace: toggle left dock`
:   Toggles the left dock.
    Keymap Name: `workspace::ToggleLeftDock`

`workspace: toggle read only file`
:   Toggles read-only mode for the active item (if supported by that item).
    Keymap Name: `workspace::ToggleReadOnlyFile`

`workspace: toggle right dock`
:   Toggles the right dock.
    Keymap Name: `workspace::ToggleRightDock`

`workspace: toggle vim mode`
:   Toggles Vim mode on or off.
    Keymap Name: `workspace::ToggleVimMode`

`workspace: toggle worktree security`
:   If any worktrees are in restricted mode, shows a modal with possible actions.
    If the modal is shown already, closes it without trusting any worktree.
    Keymap Name: `workspace::ToggleWorktreeSecurity`

`workspace: toggle zoom`
:   Toggles zoom on the active pane.
    Keymap Name: `workspace::ToggleZoom`

`workspace: unfollow`
:   Stops following a collaborator.
    Keymap Name: `workspace::Unfollow`

`workspace: zoom in`
:   Zooms in on the active pane.
    Keymap Name: `workspace::ZoomIn`

`workspace: zoom out`
:   Zooms out of the active pane.
    Keymap Name: `workspace::ZoomOut`

`zed: about`
:   Shows information about Zed.
    Keymap Name: `zed::About`

`zed: acp registry`
:   Opens the ACP registry.
    Keymap Name: `zed::AcpRegistry`

`zed: copy system specs into clipboard`
:   Copies system specifications to the clipboard for bug reports.
    Keymap Name: `zed::CopySystemSpecsIntoClipboard`

`zed: debug elements`
:   Opens the element inspector for debugging UI.
    Keymap Name: `zed::DebugElements`

`zed: decrease buffer font size`
:   Decreases the font size in the editor buffer.
    Keymap Name: `zed::DecreaseBufferFontSize`

`zed: decrease ui font size`
:   Decreases the font size of the user interface.
    Keymap Name: `zed::DecreaseUiFontSize`

`zed: extensions`
:   Opens the extensions management interface.
    Keymap Name: `zed::Extensions`

`zed: hide`
:   Hides the application window.
    Keymap Name: `zed::Hide`

`zed: hide others`
:   Hides all other application windows.
    Keymap Name: `zed::HideOthers`

`zed: import cursor settings`
:   Imports settings from Cursor editor.
    Keymap Name: `zed::ImportCursorSettings`

`zed: import vs code settings`
:   Imports settings from Visual Studio Code.
    Keymap Name: `zed::ImportVsCodeSettings`

`zed: increase buffer font size`
:   Increases the font size in the editor buffer.
    Keymap Name: `zed::IncreaseBufferFontSize`

`zed: increase ui font size`
:   Increases the font size of the user interface.
    Keymap Name: `zed::IncreaseUiFontSize`

`zed: install dev extension`
:   Installs an extension from a local directory for development.
    Keymap Name: `zed::InstallDevExtension`

`zed: minimize`
:   Minimizes the current window.
    Keymap Name: `zed::Minimize`

`zed: no action`
:   Action with special handling which unbinds the keybinding this is associated with,
    if it is the highest precedence match.
    Keymap Name: `zed::NoAction`

`zed: open account settings`
:   Opens account settings.
    Keymap Name: `zed::OpenAccountSettings`

`zed: open browser`
:   Opens a URL in the system's default web browser.
    Keymap Name: `zed::OpenBrowser`

`zed: open debug tasks`
:   Opens debug tasks configuration.
    Keymap Name: `zed::OpenDebugTasks`

`zed: open default keymap`
:   Opens the default keymap file.
    Keymap Name: `zed::OpenDefaultKeymap`

`zed: open default settings`
:   Opens the default settings file.
    Keymap Name: `zed::OpenDefaultSettings`

`zed: open docs`
:   Opens the documentation website.
    Keymap Name: `zed::OpenDocs`

`zed: open keymap`
:   Opens the keymap editor.
    Keymap Name: `zed::OpenKeymap`
    Deprecated Alias(es): `zed_actions::OpenKeymapEditor`,

`zed: open keymap file`
:   Opens the user keymap file.
    Keymap Name: `zed::OpenKeymapFile`
    Deprecated Alias(es): `zed_actions::OpenKeymap`,

`zed: open licenses`
:   Views open source licenses.
    Keymap Name: `zed::OpenLicenses`

`zed: open log`
:   Opens the Zed log file.
    Keymap Name: `zed::OpenLog`

`zed: open onboarding`
:   Opens the onboarding view.
    Keymap Name: `zed::OpenOnboarding`

`zed: open performance profiler`
:   Opens the performance profiler.
    Keymap Name: `zed::OpenPerformanceProfiler`

`zed: open project settings`
:   Opens project-specific settings.
    Keymap Name: `zed::OpenProjectSettings`
    Deprecated Alias(es): `zed_actions::OpenProjectSettings`,

`zed: open project settings file`
:   Opens project-specific settings file.
    Keymap Name: `zed::OpenProjectSettingsFile`

`zed: open project tasks`
:   Opens the project tasks configuration.
    Keymap Name: `zed::OpenProjectTasks`

`zed: open server settings`
:   Opens server settings.
    Keymap Name: `zed::OpenServerSettings`

`zed: open settings`
:   Opens the settings editor.
    Keymap Name: `zed::OpenSettings`
    Deprecated Alias(es): `zed_actions::OpenSettingsEditor`,

`zed: open settings at`
:   Opens the settings editor at a specific path.
    Keymap Name: `zed::OpenSettingsAt`

`zed: open settings file`
:   Opens the settings JSON file.
    Keymap Name: `zed::OpenSettingsFile`
    Deprecated Alias(es): `zed_actions::OpenSettings`,

`zed: open tasks`
:   Opens the tasks panel.
    Keymap Name: `zed::OpenTasks`

`zed: open telemetry log`
:   Opens the telemetry log.
    Keymap Name: `zed::OpenTelemetryLog`

`zed: open zed repo`
:   Opens the Zed repository on GitHub.
    Keymap Name: `zed::OpenZedRepo`

`zed: open zed url`
:   Opens a zed:// URL within the application.
    Keymap Name: `zed::OpenZedUrl`

`zed: quit`
:   Quits the application.
    Keymap Name: `zed::Quit`

`zed: reload extensions`
:   Reloads all installed extensions.
    Keymap Name: `zed::ReloadExtensions`

`zed: reset all zoom`
:   Resets all zoom levels (UI and buffer font sizes, including in the agent panel) to their default values.
    Keymap Name: `zed::ResetAllZoom`

`zed: reset buffer font size`
:   Resets the buffer font size to the default value.
    Keymap Name: `zed::ResetBufferFontSize`

`zed: reset database`
:   Resets the application database.
    Keymap Name: `zed::ResetDatabase`

`zed: reset ui font size`
:   Resets the UI font size to the default value.
    Keymap Name: `zed::ResetUiFontSize`

`zed: reveal log in file manager`
:   Reveals the Zed log file in the system file manager.
    Keymap Name: `zed::RevealLogInFileManager`

`zed: show all`
:   Shows all hidden windows.
    Keymap Name: `zed::ShowAll`

`zed: show default semantic token rules`
:   Shows the default semantic token rules (read-only).
    Keymap Name: `zed::ShowDefaultSemanticTokenRules`

`zed: show welcome`
:   Show the Zed welcome screen
    Keymap Name: `zed::ShowWelcome`

`zed: test crash`
:   Triggers a hard crash for debugging.
    Keymap Name: `zed::TestCrash`

`zed: test panic`
:   Triggers a test panic for debugging.
    Keymap Name: `zed::TestPanic`

`zed: toggle base keymap selector`
:   Toggles the base keymap selector modal.
    Keymap Name: `zed::ToggleBaseKeymapSelector`

`zed: toggle full screen`
:   Toggles fullscreen mode.
    Keymap Name: `zed::ToggleFullScreen`

`zed: zoom`
:   Zooms the window.
    Keymap Name: `zed::Zoom`

`zed predict onboarding: open zed predict onboarding`
:   Opens the Zed Predict onboarding modal.
    Keymap Name: `zed_predict_onboarding::OpenZedPredictOnboarding`

`zeta: focus predictions`
:   Focuses on the completions list.
    Keymap Name: `zeta::FocusPredictions`

`zeta: next edit`
:   Navigates to the next edit in the completion history.
    Keymap Name: `zeta::NextEdit`

`zeta: preview prediction`
:   Previews the selected completion.
    Keymap Name: `zeta::PreviewPrediction`

`zeta: previous edit`
:   Navigates to the previous edit in the completion history.
    Keymap Name: `zeta::PreviousEdit`

`zeta: thumbs down active prediction`
:   Rates the active completion with a thumbs down.
    Keymap Name: `zeta::ThumbsDownActivePrediction`

`zeta: thumbs up active prediction`
:   Rates the active completion with a thumbs up.
    Keymap Name: `zeta::ThumbsUpActivePrediction`

[All Settings](https://zed.dev/docs/reference/all-settings.html "All Settings")
[CLI Reference](https://zed.dev/docs/reference/cli.html "CLI Reference")
