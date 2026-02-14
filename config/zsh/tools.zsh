# Tools
# --------------------------------------------------------------------

## aqua
if command -v aqua >/dev/null; then
  source <(aqua completion zsh)
  export PATH="${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin:$PATH"
  export AQUA_GLOBAL_CONFIG="${HOME}/.config/aqua/aqua.yaml"
  export AQUA_PROGRESS_BAR=true
  aqua i -l -a
fi

# fzf
if command -v fzf >/dev/null; then
  source <(fzf --zsh)
fi

## zoxide
if command -v zoxide >/dev/null; then
  eval "$(zoxide init zsh)"
fi

## zellij
if command -v zellij >/dev/null; then
  eval "$(zellij setup --generate-auto-start zsh)"
  # source <(zellij setup --generate-completion zsh)
  [ ! -f "{COMPLETIONS_PATH}/_zellij" ] &&
    $(command -v zellij) setup --generate-completion zsh >"${COMPLETIONS_PATH}/_zellij"
fi

## cargo (Rust)
if [ -d "${HOME}/.cargo" ]; then
  source "${HOME}/.cargo/env"
  [ ! -f "${COMPLETIONS_PATH}/_rustup" ] &&
    $(command -v rustup) completions zsh >"${COMPLETIONS_PATH}/_rustup"
  [ ! -f "${COMPLETIONS_PATH}/_cargo" ] &&
    $(command -v rustup) completions zsh cargo >"${COMPLETIONS_PATH}/_cargo"
fi

## rye (Python)
if [ -d "${HOME}/.rye" ]; then
  source "${HOME}/.rye/env"
  [ ! -f "${COMPLETIONS_PATH}/_rye" ] &&
    $(command -v rye) self completion -s zsh >"${COMPLETIONS_PATH}/_rye"
fi

## mise
if command -v mise >/dev/null; then
  eval "$(mise activate zsh)"
fi

## yazi
if command -v yazi >/dev/null; then
  function ya() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
      cd -- "$cwd"
    fi
    rm -f -- "$tmp"
  }
fi

## psql (PostgreSQL Client)
if [ -d "${HOMEBREW_PREFIX}/opt/libpq/bin" ]; then
  export PATH="${HOMEBREW_PREFIX}/opt/libpq/bin:$PATH"
fi

if [[ -n $ZENO_LOADED ]]; then
  bindkey ' ' zeno-auto-snippet
  bindkey '^m' accept-line
  bindkey '^i' zeno-completion

  bindkey '^e^m' zeno-auto-snippet-and-accept-line
  bindkey '^e ' zeno-insert-space
  bindkey '^es' zeno-insert-snippet
  bindkey '^eo' zeno-toggle-auto-snippet

  bindkey '^ep' zeno-preprompt
  bindkey '^es' zeno-preprompt-snippet
fi
