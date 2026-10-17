# Portable environment — Omarchy-flavored, works on macOS and Linux.
# Sourced by both ~/.bashrc and ~/.zshrc.

# Editor — use Omarchy's launcher when available, else nvim.
if command -v omarchy-launch-editor >/dev/null 2>&1; then
  export EDITOR="${EDITOR:-omarchy-launch-editor --inline}"
else
  export EDITOR="${EDITOR:-nvim}"
fi
export SUDO_EDITOR="$EDITOR"

# Browser
if command -v omarchy-launch-browser >/dev/null 2>&1; then
  export BROWSER="${BROWSER:-omarchy-launch-browser}"
elif command -v xdg-open >/dev/null 2>&1; then
  export BROWSER="${BROWSER:-xdg-open}"
elif command -v open >/dev/null 2>&1; then
  export BROWSER="${BROWSER:-open}"
fi

export BAT_THEME="${BAT_THEME:-ansi}"

if command -v bat >/dev/null 2>&1 && command -v col >/dev/null 2>&1; then
  export MANROFFOPT="-c"
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi

# ~/.local/bin on PATH
case ":$PATH:" in
  *":$HOME/.local/bin:"*) ;;
  *) export PATH="$PATH:$HOME/.local/bin" ;;
esac
