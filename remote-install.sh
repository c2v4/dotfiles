#!/bin/bash

function check_prerequisite() {
    if ! command -v $1 &>/dev/null; then
        echo "$1 is required"
        exit
    fi
}

# check prerequisites
for i in git zsh curl; do
    check_prerequisite $i
done

TO_INSTALL="ripgrep exa"

if command -v apt-get &> /dev/null
then
    sudo apt-get install -y apt-fast
    sudo apt-fast install -y TO_INSTALL
fi

curl -fLo .yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm && chmod a+x .yadm

./.yadm clone https://github.com/c2v4/dotfiles
./.yadm submodule update --init --recursive
rm .yadm

chsh -s $(which zsh)