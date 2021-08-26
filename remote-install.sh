#!/bin/bash

function check_prerequisite() {
    if ! command -v $1 &>/dev/null; then
        echo "$1 is required"
        exit
    fi
}

# check prerequisites
for i in git curl cc gcc make; do
    check_prerequisite $i
done

curl -fLo .yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm && chmod a+x .yadm
./.yadm clone https://github.com/c2v4/dotfiles
./.yadm submodule update --init --recursive
rm .yadm

TO_INSTALL="ripgrep exa bat fd fzf git-delta tokei procs dust duf zoxide zsh progress"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
source ~/.path
source ~/.aliases
brew install $TO_INSTALL

chsh -s $(which zsh)
