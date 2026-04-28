{ config, local, ... }:
let
  configRoot = "${local.dotfilesRoot}/config";
  oos = config.lib.file.mkOutOfStoreSymlink;
in
{
  xdg.configFile = {
    aerospace.source = oos "${configRoot}/aerospace/private";
  };
  home.file = { };
}
