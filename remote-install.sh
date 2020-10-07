#!/bin/bash

function check_prerequisite {
    if ! command -v $1 &> /dev/null
    then
        echo "$1 is required"
        exit
    fi
}

# check prerequisites
for i in git zsh curl 
do
    check_prerequisite $i
done

# check if yadm is installed
if ! command -v yadm &> /dev/null
then
    curl -fLo .yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm && chmod a+x .yadm
fi

./.yadm clone https://github.com/c2v4/dotfiles
./.yadm submodule update --init --recursive`
rm .yadm