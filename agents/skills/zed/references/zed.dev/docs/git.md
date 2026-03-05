---
title: "Git | Zed Editor Git integration documentation"
source_url: "https://zed.dev/docs/git"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [Git](https://zed.dev/docs/git.html#git)

Zed has built-in Git support that lets you manage version control without leaving the editor. The Git Panel shows your working tree state, staging area, and branch information. Changes you make on the command line are reflected immediately in Zed.

For operations that Zed doesn't support natively, you can use the integrated terminal.

## [Git Panel](https://zed.dev/docs/git.html#git-panel)

The Git Panel shows the state of your working tree and Git's staging area.

You can open the Git Panel using `git panel: toggle focus`, or by clicking the Git icon in the status bar.

In the panel you can see the state of your project at a glance: which repository and branch are active, what files have changed and the current staging state of each file.

Zed monitors your repository so that changes you make on the command line are instantly reflected.

### [Configuration](https://zed.dev/docs/git.html#configuration)

Open the Settings Editor (`Cmd+,` on macOS, `Ctrl+,` on Linux/Windows) to customize Git behavior. Settings are spread across two pages:

* **Panels > Git Panel**: Panel position, tree vs flat view, status display style
* **Version Control**: Gutter indicators, inline blame, hunk styles

#### [Moving the Git Panel](https://zed.dev/docs/git.html#moving-the-git-panel)

By default, the Git Panel docks on the left. Go to **Panels > Git Panel** and change **Git Panel Dock** to move it to the right or bottom.

#### [Switching to Tree View](https://zed.dev/docs/git.html#switching-to-tree-view)

The Git Panel shows a flat list of changed files by default. To see files organized by folder hierarchy instead, toggle **Tree View** in the panel's context menu, or enable it in **Panels > Git Panel**.

#### [Inline Blame](https://zed.dev/docs/git.html#inline-blame)

Zed shows Git blame information on the current line. To turn this off or add a delay before it appears, go to **Version Control > Inline Git Blame**.

#### [Hiding the Gutter Indicators](https://zed.dev/docs/git.html#hiding-the-gutter-indicators)

The colored bars in the gutter that show added, modified, and deleted lines can be hidden. Go to **Version Control > Git Gutter** and set **Visibility** to "Hide".

#### [Commit Message Line Length](https://zed.dev/docs/git.html#commit-message-line-length)

Zed wraps commit messages at 72 characters (a Git convention). To change this, search for "Git Commit" in Settings and adjust **Preferred Line Length**.

## [Project Diff](https://zed.dev/docs/git.html#project-diff)

You can see all of the changes captured by Git in Zed by opening the Project Diff (`ctrl-g d|ctrl-g d`), accessible via the `git: diff` action in the Command Palette or the Git Panel.

All of the changes displayed in the Project Diff behave exactly the same as any other multibuffer: they are all editable excerpts of files.

You can stage or unstage each hunk as well as a whole file by hitting the buttons on the tab bar or their corresponding keybindings.

### [Word Diff Highlighting](https://zed.dev/docs/git.html#word-diff-highlighting)

By default, Zed highlights changed words within modified lines to make it easier to spot exactly what changed. To disable this globally, open the Settings Editor and go to **Languages & Tools > Miscellaneous**, then turn off **Word Diff Enabled**.

To disable word diff for specific languages only, add this to your settings.json:

```
{
  "languages": {
    "Markdown": {
      "word_diff_enabled": false
    }
  }
}
```

### [Diff View Styles](https://zed.dev/docs/git.html#diff-view-styles)

Zed displays diffs in two modes: **split** (side-by-side comparison) or **unified** (inline changes). Split view is the default.

#### [Changing the diff view](https://zed.dev/docs/git.html#changing-the-diff-view)

Open the Settings Editor (`cmd-,|ctrl-,`) and search for "diff view style". Select either **Split** or **Unified**.

To change the default, add this to your `settings.json`:

```
{
  "diff_view_style": "unified"
}
```

See [Configuring Zed](https://zed.dev/docs/configuring-zed.html) for more about the Settings Editor.

#### [Split vs unified](https://zed.dev/docs/git.html#split-vs-unified)

* **Split**: Shows the original and modified versions side by side. Useful for comparing file structure or reviewing large changes.
* **Unified**: Shows changes inline with additions and deletions in a single view. Useful for focusing on specific line changes.

You can switch between modes at any time. Your preference applies to [Project Diff](https://zed.dev/docs/git.html#project-diff), [File History](https://zed.dev/docs/git.html#file-history), and [Stash Diff View](https://zed.dev/docs/git.html#stash-diff-view). These diff views function as [multibuffers](https://zed.dev/docs/multibuffers.html), allowing you to edit multiple excerpts simultaneously.

## [File History](https://zed.dev/docs/git.html#file-history)

File History shows the commit history for an individual file. Each entry displays the commit's author, timestamp, and message. Selecting a commit opens a diff view filtered to show only the changes made to that file in that commit.

To view File History:

* Right-click on a file in the Project Panel and select "View File History"
* Right-click on a file in the Git Panel and select "View File History"
* Right-click on an editor tab and select "View File History"
* Use the Command Palette and search for "file history"

## [Fetch, Push, and Pull](https://zed.dev/docs/git.html#fetch-push-and-pull)

Fetch, push, or pull from your Git repository in Zed via the buttons available on the Git Panel or via the Command Palette by looking at the respective actions: `git: fetch`, `git: push`, and `git: pull`.

### [Push Configuration](https://zed.dev/docs/git.html#push-configuration)

Zed respects Git's push configuration. When pushing, Zed checks the following in order:

1. `pushRemote` configured for the current branch
2. `remote.pushDefault` in your Git config
3. The branch's tracking remote

This matches Git's standard behavior, so if you've configured `pushRemote` or `pushDefault` in your `.gitconfig` or via `git config`, Zed will use those settings.

## [Remotes](https://zed.dev/docs/git.html#remotes)

When your repository has multiple remotes, Zed shows a remote selector in the Git Panel. Click the remote button next to push/pull to choose which remote to use for that operation.

## [Staging Workflow](https://zed.dev/docs/git.html#staging-workflow)

Zed has two primary staging workflows, using either the Project Diff or the panel directly.

### [Using the Project Diff](https://zed.dev/docs/git.html#using-the-project-diff)

In the Project Diff view, you can focus on each hunk and stage them individually by clicking on the tab bar buttons or via the keybindings `git: stage and next` (`cmd-y|alt-y`).

Similarly, stage all hunks at the same time with the `git: stage all` (`cmd-ctrl-y|ctrl-space`) keybinding and then immediately commit with `git: commit` (`cmd-enter|ctrl-enter`).

### [Using the Git Panel](https://zed.dev/docs/git.html#using-the-git-panel)

From the panel, you can simply type a commit message and hit the commit button, or `git: commit`. This will automatically stage all tracked files (indicated by a `[·]` in the entry's checkbox) and commit them.

Entries can be staged using each individual entry's checkbox. All changes can be staged using the button at the top of the panel, or `git: stage all`.

## [Committing](https://zed.dev/docs/git.html#committing)

Zed offers two commit textareas:

1. The first one is available right at the bottom of the Git Panel. Hitting `cmd-enter|ctrl-enter` immediately commits all of your staged changes.
2. The second is available via the action `git: expand commit editor` or via hitting the `shift-escape|` while focused in the Git Panel commit textarea.

### [Undoing a Commit](https://zed.dev/docs/git.html#undoing-a-commit)

As soon as you commit in Zed, in the Git Panel, you'll see a bar right under the commit textarea, which will show the recently submitted commit.
In there, you can use the "Uncommit" button, which performs the `git reset HEADˆ--soft` command.

### [Configuring Commit Line Length](https://zed.dev/docs/git.html#configuring-commit-line-length)

By default, Zed sets the commit line length to `72` but it can be configured in your local `settings.json` file.

Find more information about setting the `preferred-line-length` in the [Configuration](https://zed.dev/docs/git.html#configuration) section.

## [Branch Management](https://zed.dev/docs/git.html#branch-management)

### [Creating and Switching Branches](https://zed.dev/docs/git.html#creating-and-switching-branches)

Create a new branch using `git: branch` or switch to an existing branch using `git: switch` or `git: checkout branch`.

### [Deleting Branches](https://zed.dev/docs/git.html#deleting-branches)

To delete a branch, open the branch switcher with `git: switch`, find the branch you want to delete, and use the delete option. Zed will confirm before deleting to prevent accidental data loss.

> **Note:** You cannot delete the branch you currently have checked out. Switch to a different branch first.

## [Merge Conflicts](https://zed.dev/docs/git.html#merge-conflicts)

When you encounter merge conflicts after a merge, rebase, or pull, Zed highlights the conflicting regions in your files and displays resolution buttons above each conflict.

### [Viewing Conflicts](https://zed.dev/docs/git.html#viewing-conflicts)

Conflicting files appear in the Git Panel with a warning icon. You can also see conflicts in the Project Diff view, where each conflict region is highlighted:

* Changes from your current branch are highlighted in green
* Changes from the incoming branch are highlighted in blue

### [Resolving Conflicts](https://zed.dev/docs/git.html#resolving-conflicts)

Each conflict shows three buttons:

* **Use [branch-name]**: Keep the changes from one branch (shows the actual branch name, like "main")
* **Use [other-branch]**: Keep the changes from the other branch (like "feature-branch")
* **Use Both**: Keep both sets of changes, with your branch's changes first

Click a button to resolve that conflict. The conflict markers are removed and replaced with your chosen content. After resolving all conflicts in a file, stage it and commit to complete the merge.

> **Tip:** For complex conflicts that need manual editing, you can edit the file directly. Remove the conflict markers (`<<<<<<<`, `=======`, `>>>>>>>`) and keep the content you want.

## [Stashing](https://zed.dev/docs/git.html#stashing)

Git stash allows you to temporarily save your uncommitted changes and revert your working directory to a clean state. This is particularly useful when you need to quickly switch branches or pull updates without committing incomplete work.

### [Creating Stashes](https://zed.dev/docs/git.html#creating-stashes)

To stash all your current changes, use the `git: stash all` action. This will save both staged and unstaged changes to a new stash entry and clean your working directory.

### [Managing Stashes](https://zed.dev/docs/git.html#managing-stashes)

Zed provides a stash picker accessible via `git: view stash` or from the Git Panel's overflow menu. From the stash picker, you can:

* **View stash list**: Browse all your saved stashes with their descriptions and timestamps
* **Open diffs**: See exactly what changes are stored in each stash
* **Apply stashes**: Apply stash changes to your working directory while keeping the stash entry
* **Pop stashes**: Apply stash changes and remove the stash entry from the list
* **Drop stashes**: Delete unwanted stash entries without applying them

### [Quick Stash Operations](https://zed.dev/docs/git.html#quick-stash-operations)

For faster workflows, Zed provides direct actions to work with the most recent stash:

* **Apply latest stash**: Use `git: stash apply` to apply the most recent stash without removing it
* **Pop latest stash**: Use `git: stash pop` to apply and remove the most recent stash

### [Stash Diff View](https://zed.dev/docs/git.html#stash-diff-view)

To view a stash's contents, select it in the stash picker and press `ctrl-shift-v|ctrl-shift-v`. From the diff view, you can use these keybindings:

| Action | Keybinding |
| --- | --- |
| Apply stash | `ctrl-space` |
| Pop stash (apply and remove) | `ctrl-shift-space` |
| Drop stash (remove without applying) | `ctrl-shift-backspace` |

## [AI Support in Git](https://zed.dev/docs/git.html#ai-support-in-git)

Zed currently supports LLM-powered commit message generation.
You can ask AI to generate a commit message by focusing on the message editor within the Git Panel and either clicking on the pencil icon in the bottom left, or reaching for the `git: generate commit message` (`alt-tab|alt-l`) keybinding.

> Note that you need to have an LLM provider configured either via your own API keys or through Zed's hosted AI models.
> Visit [the AI configuration page](https://zed.dev/docs/ai/configuration.html) to learn how to do so.

You can specify your preferred model to use by providing a `commit_message_model` agent setting.
See [Feature-specific models](https://zed.dev/docs/ai/agent-settings.html#feature-specific-models) for more information.

```
{
  "agent": {
    "commit_message_model": {
      "provider": "anthropic",
      "model": "claude-3-5-haiku"
    }
  }
}
```

To customize the format of generated commit messages, run `agent: open rules library` and select the "Commit message" rule on the left side.
From there, you can modify the prompt to match your desired format.

Any specific instructions for commit messages added to [Rules files](https://zed.dev/docs/ai/rules.html) are also picked up by the model tasked with writing your commit message.

## [Git Integrations](https://zed.dev/docs/git.html#git-integrations)

Zed integrates with popular Git hosting services to ensure that Git commit hashes and references to Issues, Pull Requests, and Merge Requests become clickable links.

Zed currently supports links to the hosted versions of
[GitHub](https://github.com),
[GitLab](https://gitlab.com),
[Bitbucket](https://bitbucket.org),
[SourceHut](https://sr.ht) and
[Codeberg](https://codeberg.org).

### [Self-Hosted Instances](https://zed.dev/docs/git.html#self-hosted-instances)

Zed automatically identifies Git hosting providers by checking for keywords in your Git remote URL. For example, if your self-hosted URL contains `gitlab`, `gitea`, or other recognized provider names, Zed will automatically register that hosting provider without any configuration needed.

However, if your self-hosted Git instance URL doesn't contain identifying keywords, you can manually configure Zed to create clickable links to your instance by adding a `git_hosting_providers` setting so commit hashes and permalinks resolve to your domain:

```
{
  "git_hosting_providers": [
    {
      "provider": "gitlab",
      "name": "Corp GitLab",
      "base_url": "https://git.example.corp"
    }
  ]
}
```

The `provider` field specifies which type of hosting service you're using. Supported `provider` values are `github`, `gitlab`, `bitbucket`, `gitea`, `forgejo`, and `sourcehut`. The `name` is optional and used as a display name for your instance, and `base_url` is the root URL of your self-hosted server.

You can configure multiple custom providers if you work with several self-hosted instances.

### [Permalinks](https://zed.dev/docs/git.html#permalinks)

Zed also has a Copy Permalink feature to create a permanent link to a code snippet on your Git hosting service.
These links are useful for sharing a specific line or range of lines in a file at a specific commit.
Trigger this action via the [Command Palette](https://zed.dev/docs/getting-started.html#command-palette) (search for `permalink`),
by creating a [custom key bindings](https://zed.dev/docs/key-bindings.html#custom-key-bindings) to the
`editor::CopyPermalinkToLine` or `editor::OpenPermalinkToLine` actions
or by simply right clicking and selecting `Copy Permalink` with line(s) selected in your editor.

## [Diff Hunk Keyboard Shortcuts](https://zed.dev/docs/git.html#diff-hunk-keyboard-shortcuts)

When viewing files with changes, Zed displays diff hunks that can be expanded or collapsed for detailed review:

* **Expand all diff hunks**: `editor: expand all diff hunks` (`cmd-"|ctrl-"`)
* **Collapse all diff hunks**: Press `Escape` (bound to `editor: cancel`)
* **Toggle selected diff hunks**: `editor: toggle selected diff hunks` (`cmd-'|ctrl-'`)
* **Navigate between hunks**: `editor: go to hunk` and `editor: go to previous hunk`

> **Tip:** The `Escape` key is the quickest way to collapse all expanded diff hunks and return to an overview of your changes.

## [Action Reference](https://zed.dev/docs/git.html#action-reference)

| Action | Keybinding |
| --- | --- |
| `git: add` | No default binding |
| `git: stage all` | `cmd-ctrl-y` |
| `git: unstage all` | `cmd-ctrl-shift-y` |
| `git: toggle staged` | `space` |
| `git: stage and next` | `cmd-y` |
| `git: unstage and next` | `cmd-shift-y` |
| `git: commit` | `cmd-enter` |
| `git: expand commit editor` | `shift-escape` |
| `git: push` | `ctrl-g up` |
| `git: force push` | `ctrl-g shift-up` |
| `git: pull` | `ctrl-g down` |
| `git: pull rebase` | `ctrl-g shift-down` |
| `git: fetch` | `ctrl-g ctrl-g` |
| `git: diff` | `ctrl-g d` |
| `git: restore` | `cmd-alt-z` |
| `git: restore file` | `cmd-delete` |
| `git: branch` | No default binding |
| `git: switch` | No default binding |
| `git: checkout branch` | No default binding |
| `git: blame` | `cmd-alt-g b` |
| `git: stash all` | No default binding |
| `git: stash pop` | No default binding |
| `git: stash apply` | No default binding |
| `git: view stash` | No default binding |
| `editor: toggle git blame inline` | No default binding |
| `editor: expand all diff hunks` | `cmd-"` |
| `editor: toggle selected diff hunks` | `cmd-'` |

> Not all actions have default keybindings, but can be bound by [customizing your keymap](https://zed.dev/docs/key-bindings.html#user-keymaps).

## [Git CLI Configuration](https://zed.dev/docs/git.html#git-cli-configuration)

If you would like to also use Zed for your [git commit message editor](https://git-scm.com/book/en/v2/Customizing-Git-Git-Configuration#_core_editor) when committing from the command line you can use `zed --wait`:

```
git config --global core.editor "zed --wait"
```

Or add the following to your shell environment (in `~/.zshrc`, `~/.bashrc`, etc):

```
export GIT_EDITOR="zed --wait"
```

[REPL](https://zed.dev/docs/repl.html "REPL")
[Overview](https://zed.dev/docs/collaboration/overview.html "Overview")
