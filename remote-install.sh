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
./.yadm config "local.$0"
./.yadm clone https://github.com/c2v4/dotfiles
./.yadm submodule update --init --recursive
rm .yadm

