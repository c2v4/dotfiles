#!/bin/bash

# check if yadm is installed
if ! command -v COMMAND &> /dev/null
then
    curl -fLo /usr/local/bin/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm && chmod a+x /usr/local/bin/yadm
    exit
fi

yadm clone https://github.com/c2v4/dotfiles
yadm submodule update --init --recursive`