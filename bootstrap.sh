#!/usr/bin/env bash

# basic updates/upgrades
sudo apt-get update
#apt-get dist-upgrade -y
sudo apt-get install -y docker.io vim curl wget openjdk-8-jdk nodejs

# have sdkman
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk version

# install stuff via sdkman
sdk install gradle 6.3
sdk install java 14.0.0.j9-adpt
sdk default java 14.0.0.j9-adpt

# have ms stuff
if [[ -x ".dotnet/dotnet" ]]
then
    echo "dotnet already installed, skipping"
else
    wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh && chmod +x dotnet-install.sh && ./dotnet-install.sh
    echo "export PATH=$PATH:~/.dotnet" >> ~/.bashrc
fi
# does not work yet on 20.04
#~/.dotnet/dotnet tool install --global PowerShell

# install okd cli
if [[ -x "/usr/bin/oc" ]]
then
    echo "oc already installed, skipping"
else
    curl -s -S -L https://github.com/openshift/origin/releases/download/v3.11.0/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz | tar -xz
    sudo cp openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit/oc /usr/bin/
    rm -rf openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit
fi

# install IDEs
sudo snap install --classic eclipse
sudo snap install --classic code

# set keyboard
setxkbmap de
echo "setxkbmap de" >> ~/.bashrc
