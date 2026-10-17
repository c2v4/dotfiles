# dotfiles

Portable, **Omarchy-flavored** dotfiles for macOS and Linux, managed with
[yadm](https://yadm.io). Bash + zsh shell config, tmux, Neovim (LazyVim),
starship and OpenCode.

## What's inside

| Path | What |
| --- | --- |
| `.config/shell/omarchy/` | Omarchy's aliases, functions (`fns/*`) and completions, vendored |
| `.config/shell/envs.sh` | shared env (EDITOR/BROWSER/PATH) |
| `.config/shell/init.{bash,zsh}` | shell-specific history/completion/prompt/tool init |
| `.bashrc##~class.Omarchy`, `.zshrc` | shell entry points |
| `.config/tmux/tmux.conf` | tmux config |
| `.config/nvim/` | LazyVim config + pinned `lazy-lock.json` |
| `.config/starship.toml` | prompt |
| `.config/opencode/` | OpenCode config (no secrets) |
| `.config/yadm/bootstrap` | OS-aware tool installer |

## Install

```bash
yadm clone git@github.com:c2v4/dotfiles.git   # yadm offers to run the bootstrap
# or later:
yadm bootstrap
```

The bootstrap installs: `eza zoxide fzf bat fd ripgrep starship tmux neovim
git-delta lazygit mise` — Homebrew on macOS, `pacman`/`apt`/`dnf` on Linux.

Neovim needs no installer: launch `nvim` and LazyVim bootstraps its plugins from
`lazy-lock.json`.

## Omarchy hosts

On an Omarchy host the bootstrap runs `yadm config local.class Omarchy`, which
keeps Omarchy's own `~/.bashrc` and config in place (the generic
`.bashrc##~class.Omarchy` is not linked). Everything else — tmux, nvim,
opencode, `.config/shell` — is shared.

## Editing

```bash
yadm add -u && yadm commit -m "..." && yadm push
```
