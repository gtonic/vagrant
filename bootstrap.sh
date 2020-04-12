#!/usr/bin/env bash

# basic updates/upgrades
apt-get update
#apt-get dist-upgrade -y
apt-get install -y docker.io vim curl wget openjdk-8-jdk

# have sdkman
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk version

# install stuff via sdkman
sdk install gradle 6.3
sdk install java 14.0.0.j9-adpt
sdk default java 14.0.0.j9-adpt

# install okd cli
if [[ -x "/usr/bin/oc" ]]
then
    echo "oc already installed, skipping"
else
    curl -s -S -L https://github.com/openshift/origin/releases/download/v3.11.0/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz | tar -xz
    cp openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit/oc /usr/bin/
    rm -rf openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit
fi

# install IDEs
snap install --classic eclipse
snap install --classic vscode

# set keyboard
setxkbmap de
