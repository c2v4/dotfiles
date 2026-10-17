# Bash-specific init: history, completion, prompt, tools.
# macOS ships bash 3.2, so avoid bash-4-only syntax (e.g. `[[ -v var ]]`).

# History
shopt -s histappend 2>/dev/null || true
HISTCONTROL=ignoreboth
HISTSIZE=32768
HISTFILESIZE="${HISTSIZE}"

# Bash completion
if [ -z "${BASH_COMPLETION_VERSINFO:-}" ] && [ -f /usr/share/bash-completion/bash_completion ]; then
  . /usr/share/bash-completion/bash_completion
fi

# Tool integrations
if command -v mise >/dev/null 2>&1; then eval "$(mise activate bash)"; fi
if [ "${TERM:-}" != "dumb" ] && command -v starship >/dev/null 2>&1; then eval "$(starship init bash)"; fi
if command -v zoxide >/dev/null 2>&1; then eval "$(zoxide init bash)"; fi

if command -v fzf >/dev/null 2>&1; then
  [ -f /usr/share/fzf/completion.bash ] && . /usr/share/fzf/completion.bash
  [ -f /usr/share/fzf/key-bindings.bash ] && . /usr/share/fzf/key-bindings.bash
fi
