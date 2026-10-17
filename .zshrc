# ~/.zshrc — portable, Omarchy-flavored.

[ -r "$HOME/.config/shell/envs.sh" ]           && . "$HOME/.config/shell/envs.sh"
[ -r "$HOME/.config/shell/init.zsh" ]          && . "$HOME/.config/shell/init.zsh"
[ -r "$HOME/.config/shell/omarchy/aliases" ]   && . "$HOME/.config/shell/omarchy/aliases"
[ -r "$HOME/.config/shell/omarchy/functions" ] && . "$HOME/.config/shell/omarchy/functions"

# Local overrides
[ -r "$HOME/.zshrc.local" ] && . "$HOME/.zshrc.local"
