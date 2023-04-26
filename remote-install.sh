#!/bin/bash

# function check_prerequisite() {
#     if ! command -v $1 &>/dev/null; then
#         echo "$1 is required"
#         exit
#     fi
# }

# # check prerequisites
# for i in git curl cc gcc make; do
#     check_prerequisite $i
# done
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
brew install git curl gcc make yadm zsh
ZSH_LOCATION=$(which zsh)
echo $ZSH_LOCATION | sudo tee -a /etc/shells
chsh -s $ZSH_LOCATION

# curl -fLo .yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm && chmod a+x .yadm
# ./.yadm config "local.$0"
yadm clone https://github.com/c2v4/dotfiles
yadm submodule update --init --recursive

brew bundle install 
