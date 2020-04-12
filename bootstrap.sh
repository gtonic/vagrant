#!/usr/bin/env bash

apt-get update
apt-get install -y docker.io vim curl wget openjdk-8-jdk

# have sdkman
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk version

# install stuff via sdk
sdk install gradle 6.3
sdk install java 14.0.0.j9-adpt
