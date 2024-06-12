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
test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bashrc
brew install git curl gcc make yadm zsh zip unzip
ZSH_LOCATION=$(which zsh)
echo $ZSH_LOCATION | sudo tee -a /etc/shells
chsh -s $ZSH_LOCATION

# curl -fLo .yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm && chmod a+x .yadm
# ./.yadm config "local.$0"
yadm clone -f https://github.com/c2v4/dotfiles
yadm submodule update --init --recursive

brew bundle install 
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

