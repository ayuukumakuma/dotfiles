---
title: "MCP Server Extensions | MCP Server Extensions"
source_url: "https://zed.dev/docs/extensions/mcp-extensions"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [MCP Server Extensions](https://zed.dev/docs/extensions/mcp-extensions.html#mcp-server-extensions)

[Model Context Protocol servers](https://zed.dev/docs/ai/mcp.html) can be exposed as extensions for use in the Agent Panel.

## [Defining MCP Extensions](https://zed.dev/docs/extensions/mcp-extensions.html#defining-mcp-extensions)

A given extension may provide one or more MCP servers.
Each MCP server must be registered in the `extension.toml`:

```
[context_servers.my-context-server]
```

Then, in the Rust code for your extension, implement the `context_server_command` method on your extension:

```
```
#![allow(unused)]
fn main() {
impl zed::Extension for MyExtension {
    fn context_server_command(
        &mut self,
        context_server_id: &ContextServerId,
        project: &zed::Project,
    ) -> Result<zed::Command> {
        Ok(zed::Command {
            command: get_path_to_context_server_executable()?,
            args: get_args_for_context_server()?,
            env: get_env_for_context_server()?,
        })
    }
}
}
```
```

This method should return the command to start up an MCP server, along with any arguments or environment variables necessary for it to function.

If you need to download the MCP server from an external source (GitHub Releases, npm, etc.), you can also do that in this function.

## [Available Extensions](https://zed.dev/docs/extensions/mcp-extensions.html#available-extensions)

See MCP servers published as extensions [on Zed's site](https://zed.dev/extensions?filter=context-servers).

Review their repositories to see common implementation patterns and structure.

## [Testing](https://zed.dev/docs/extensions/mcp-extensions.html#testing)

To test your new MCP server extension, you can [install it as a dev extension](https://zed.dev/docs/extensions/developing-extensions.html#developing-an-extension-locally).

[Agent Server Extensions](https://zed.dev/docs/extensions/agent-servers.html "Agent Server Extensions")
[VS Code](https://zed.dev/docs/migrate/vs-code.html "VS Code")
