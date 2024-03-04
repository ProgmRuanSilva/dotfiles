#!/bin/bash

source $HOME/dotfiles/bin/utils.sh

setup() {
  u_header "Github CLI"

  u_bold "Installing Github CLI..."

  type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)

  curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
  && sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
  && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

  u_bold "Github keyring installed"
}

install() {
  setup
  u_bold "Installing Github CLI..."

  sudo apt update
  sudo apt install gh -y

  u_success "Github CLI installed"
}

auth(){
  u_bold "Authenticating with Github CLI..."
  gh auth login
}


setup
install
auth
