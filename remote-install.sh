#!/bin/bash

function check_prerequisite() {
    if ! command -v $1 &>/dev/null; then
        echo "$1 is required"
        exit
    fi
}

# check prerequisites
for i in git zsh curl cc gcc make; do
    check_prerequisite $i
done

curl -fLo .yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm && chmod a+x .yadm
chmod +x .yadm
./.yadm clone https://github.com/c2v4/dotfiles
./.yadm submodule update --init --recursive
rm .yadm

chsh -s $(which zsh)
TO_INSTALL="ripgrep exa bat fd fzf git-delta tokei procs dust zoxide"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
source ~/.aliases
brew install $TO_INSTALL

echo "[core]
    pager = delta

[interactive]
    diffFilter = delta --color-only

[delta]
    features = side-by-side line-numbers decorations
    whitespace-error-style = 22 reverse

[delta \"decorations\"]
    commit-decoration-style = bold yellow box ul
    file-style = bold yellow ul
    file-decoration-style = none" >> ~/.gitconfig
