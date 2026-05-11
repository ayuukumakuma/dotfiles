{ config, local, ... }:
let
  configRoot = "${local.dotfilesRoot}/config";
  oos = config.lib.file.mkOutOfStoreSymlink;
in
{
  xdg.configFile = {
    aerospace.source = oos "${configRoot}/aerospace/work";
  };
  home.file = {
    ".codex/config.toml".source = oos "${configRoot}/codex/work/config.toml";
    ".claude/settings.json".source = oos "${configRoot}/claude/settings.json";
    ".claude/statusline.py".source = oos "${configRoot}/claude/statusline.py";
    ".claude/hooks".source = oos "${configRoot}/claude/hooks";
    ".claude/skills".source = oos "${configRoot}/agents/skills";
    ".claude/CLAUDE.md".source = oos "${configRoot}/claude/CLAUDE.md";
    ".cursor/skills".source = oos "${configRoot}/agents/skills";
  };
}
