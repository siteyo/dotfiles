# Tools
# --------------------------------------------------------------------

# fzf
if command -v fzf >/dev/null; then
  export FZF_CTRL_T_COMMAND=""
  source <(fzf --zsh)
fi

## zoxide
if command -v zoxide >/dev/null; then
  eval "$(zoxide init zsh)"
fi

## zellij
# if command -v zellij >/dev/null; then
#   eval "$(zellij setup --generate-auto-start zsh)"
#   # source <(zellij setup --generate-completion zsh)
#   [ ! -f "{COMPLETIONS_PATH}/_zellij" ] &&
#     $(command -v zellij) setup --generate-completion zsh >"${COMPLETIONS_PATH}/_zellij"
# fi

## cargo (Rust)
if [ -d "${HOME}/.cargo" ]; then
  source "${HOME}/.cargo/env"
  [ ! -f "${COMPLETIONS_PATH}/_rustup" ] &&
    $(command -v rustup) completions zsh >"${COMPLETIONS_PATH}/_rustup"
  [ ! -f "${COMPLETIONS_PATH}/_cargo" ] &&
    $(command -v rustup) completions zsh cargo >"${COMPLETIONS_PATH}/_cargo"
fi

## mise
if command -v mise >/dev/null; then
  eval "$(mise activate zsh)"
fi

## yazi
if command -v yazi >/dev/null; then
  function ya() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
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

## workmux
if command -v workmux >/dev/null; then
  eval "$(workmux completions zsh)"
fi
