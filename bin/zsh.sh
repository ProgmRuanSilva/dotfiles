#!/bin/bash

source $HOME/dotfiles/bin/utils.sh

install () {
  u_header "ZSH Installer"

  u_bold "Installing zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  u_success "ZSH installed"
  break
}

copy() {
  u_bold "Copying .zshrc..."
  cp -r ../zsh/.zshrc ~/

  break
}

install
copy

