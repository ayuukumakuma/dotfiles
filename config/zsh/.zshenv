# Agent zsh sessions need Nix home-manager packages on PATH.
if [[ -d /run/current-system/sw/bin ]]; then
  path=("/run/current-system/sw/bin" "${path[@]}")
fi

if [[ -d "/etc/profiles/per-user/${USER}/bin" ]]; then
  path=("/etc/profiles/per-user/${USER}/bin" "${path[@]}")
fi

if [[ -d "${HOME}/.local/share/mise/shims" ]]; then
  path=("${HOME}/.local/share/mise/shims" "${path[@]}")
fi

typeset -U path PATH
export PATH
