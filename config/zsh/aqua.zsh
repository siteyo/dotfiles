# Setup Aqua
# --------------------------------------------------------------------
if command -v aqua >/dev/null; then
  source <(aqua completion zsh)
  export PATH="${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin:$PATH"
  export AQUA_GLOBAL_CONFIG="${HOME}/.config/aqua/aqua.yaml"
  export AQUA_PROGRESS_BAR=true
  aqua i -l -a
fi
