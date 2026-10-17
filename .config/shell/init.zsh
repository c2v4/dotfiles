# Zsh-specific init: history, completion, prompt, tools.

autoload -Uz compinit && compinit -i
setopt HIST_IGNORE_ALL_DUPS INC_APPEND_HISTORY SHARE_HISTORY
HISTSIZE=32768
SAVEHIST=32768

if command -v mise >/dev/null 2>&1; then eval "$(mise activate zsh)"; fi
if [[ "${TERM:-}" != "dumb" ]] && command -v starship >/dev/null 2>&1; then eval "$(starship init zsh)"; fi
if command -v zoxide >/dev/null 2>&1; then eval "$(zoxide init zsh)"; fi

if command -v fzf >/dev/null 2>&1; then
  if fzf --zsh >/dev/null 2>&1; then
    source <(fzf --zsh)
  fi
fi
