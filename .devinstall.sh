brew install zip
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
JAVA_VERSION_TO_INSTALL=$(sdk list java |grep trava |grep 11| awk -F' ' '{print $NF}')
sdk install java $JAVA_VERSION_TO_INSTALL
sdk install gradle

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
source ~/.bashrc
nvm install 14
nvm use 14
npm install --global yarn generator-jhipster yo