{
  config,
  lib,
  pkgs,
  ...
}:
let
  dataDir = "${config.xdg.dataHome}/yaskkserv2";
  cacheDir = "${config.xdg.cacheHome}/yaskkserv2";
  dummyDictionary = "${dataDir}/skk-jisyo-dummy.utf8";
  dictionary = "${dataDir}/dictionary.yaskkserv2";
  yaskkserv2 = pkgs.callPackage ../../pkgs/yaskkserv2/default.nix { };
in
{
  xdg.dataFile."yaskkserv2/skk-jisyo-dummy.utf8".text = ''
    ;; -*- mode: fundamental; coding: utf-8 -*-
    ;; okuri-ari entries.
  '';

  home.activation.yaskkserv2Dictionary = lib.hm.dag.entryAfter [ "linkGeneration" ] ''
    run ${pkgs.coreutils}/bin/mkdir -p ${lib.escapeShellArg dataDir}
    run ${pkgs.coreutils}/bin/mkdir -p ${lib.escapeShellArg cacheDir}
    run ${yaskkserv2}/bin/yaskkserv2_make_dictionary \
      --dictionary-filename=${lib.escapeShellArg dictionary} \
      ${lib.escapeShellArg dummyDictionary}
  '';
}
