---
title: "Tools | AI Agent Tools - Zed"
source_url: "https://zed.dev/docs/ai/tools"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [Tools](https://zed.dev/docs/ai/tools.html#tools)

Zed's built-in agent has access to these tools for reading, searching, and editing your codebase. These tools are used in the [Agent Panel](https://zed.dev/docs/ai/agent-panel.html) during conversations with AI agents.

You can configure permissions for tool actions, including situations where they are automatically approved, automatically denied, or require your confirmation on a case-by-case basis. See [Tool Permissions](https://zed.dev/docs/ai/tool-permissions.html) for the list of permission-gated tools and details.

To add custom tools beyond these built-in ones, see [MCP servers](https://zed.dev/docs/ai/mcp.html).

## [Read & Search Tools](https://zed.dev/docs/ai/tools.html#read--search-tools)

### [`diagnostics`](https://zed.dev/docs/ai/tools.html#diagnostics)

Gets errors and warnings for either a specific file or the entire project, useful after making edits to determine if further changes are needed.
When a path is provided, shows all diagnostics for that specific file.
When no path is provided, shows a summary of error and warning counts for all files in the project.

### [`fetch`](https://zed.dev/docs/ai/tools.html#fetch)

Fetches a URL and returns the content as Markdown. Useful for providing docs as context.

### [`find_path`](https://zed.dev/docs/ai/tools.html#find_path)

Quickly finds files by matching glob patterns (like "\**/*.js"), returning matching file paths alphabetically.

### [`grep`](https://zed.dev/docs/ai/tools.html#grep)

Searches file contents across the project using regular expressions, preferred for finding symbols in code without knowing exact file paths.

### [`list_directory`](https://zed.dev/docs/ai/tools.html#list_directory)

Lists files and directories in a given path, providing an overview of filesystem contents.

### [`now`](https://zed.dev/docs/ai/tools.html#now)

Returns the current date and time.

### [`open`](https://zed.dev/docs/ai/tools.html#open)

Opens a file or URL with the default application associated with it on the user's operating system.

### [`read_file`](https://zed.dev/docs/ai/tools.html#read_file)

Reads the content of a specified file in the project, allowing access to file contents.

### [`thinking`](https://zed.dev/docs/ai/tools.html#thinking)

Allows the Agent to work through problems, brainstorm ideas, or plan without executing actions, useful for complex problem-solving.

### [`web_search`](https://zed.dev/docs/ai/tools.html#web_search)

Searches the web for information, providing results with snippets and links from relevant web pages, useful for accessing real-time information.

## [Edit Tools](https://zed.dev/docs/ai/tools.html#edit-tools)

### [`copy_path`](https://zed.dev/docs/ai/tools.html#copy_path)

Copies a file or directory recursively in the project, more efficient than manually reading and writing files when duplicating content.

### [`create_directory`](https://zed.dev/docs/ai/tools.html#create_directory)

Creates a new directory at the specified path within the project, creating all necessary parent directories (similar to `mkdir -p`).

### [`delete_path`](https://zed.dev/docs/ai/tools.html#delete_path)

Deletes a file or directory (including contents recursively) at the specified path and confirms the deletion.

### [`edit_file`](https://zed.dev/docs/ai/tools.html#edit_file)

Edits files by replacing specific text with new content.

### [`move_path`](https://zed.dev/docs/ai/tools.html#move_path)

Moves or renames a file or directory in the project, performing a rename if only the filename differs.

### [`restore_file_from_disk`](https://zed.dev/docs/ai/tools.html#restore_file_from_disk)

Discards unsaved changes in open buffers by reloading file contents from disk. Useful for resetting files to their on-disk state before retrying an edit.

### [`save_file`](https://zed.dev/docs/ai/tools.html#save_file)

Saves files that have unsaved changes. Used when files need to be saved before further edits can be made.

### [`terminal`](https://zed.dev/docs/ai/tools.html#terminal)

Executes shell commands and returns the combined output, creating a new shell process for each invocation.

## [Other Tools](https://zed.dev/docs/ai/tools.html#other-tools)

### [`spawn_agent`](https://zed.dev/docs/ai/tools.html#spawn_agent)

Spawns a subagent with its own context window to perform a delegated task. Each subagent has access to the same tools as the parent agent.

[Agent Panel](https://zed.dev/docs/ai/agent-panel.html "Agent Panel")
[Tool Permissions](https://zed.dev/docs/ai/tool-permissions.html "Tool Permissions")
