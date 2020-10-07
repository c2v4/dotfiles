#!/bin/bash

# check if yadm is installed
if ! command -v COMMAND &> /dev/null
then
    curl -fLo .yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm && chmod a+x .yadm
    exit
fi

./.yadm clone https://github.com/c2v4/dotfiles
./.yadm submodule update --init --recursive`