FROM gitpod/workspace-full

# Precache NVM versions
RUN bash -c 'VERSION="16"     && source $HOME/.nvm/nvm.sh && nvm install $VERSION     && nvm use $VERSION && nvm alias default $VERSION'
RUN bash -c 'VERSION="14"     && source $HOME/.nvm/nvm.sh && nvm install $VERSION     && nvm use $VERSION && nvm alias default $VERSION'
RUN bash -c 'VERSION="12"     && source $HOME/.nvm/nvm.sh && nvm install $VERSION     && nvm use $VERSION && nvm alias default $VERSION'
RUN bash -c 'VERSION="10"     && source $HOME/.nvm/nvm.sh && nvm install $VERSION     && nvm use $VERSION && nvm alias default $VERSION'

# Install custom tools, runtime, etc.
RUN brew install drud/ddev/ddev
RUN sudo apt-get -qq update && sudo apt-get -qq install -y xdg-utils tree rsync

RUN curl -LO https://deployer.org/releases/v6.8.0/deployer.phar && sudo mv deployer.phar /usr/local/bin/dep && sudo chmod +x /usr/local/bin/dep
RUN curl -LO https://deployer.org/releases/v4.3.4/deployer.phar && sudo mv deployer.phar /usr/local/bin/dep4 && sudo chmod +x /usr/local/bin/dep4


