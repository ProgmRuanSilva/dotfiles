#!/bin/bash

source $HOME/dotfiles/bin/utils.sh

install () {
  u_header "ZSH Installer"

  u_bold "Installing zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" ;
  git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions ;
  git clone https://github.com/zsh-users/zsh-syntax-highlighting $ZSH_CUSTOM/plugins/zsh-syntax-highlighting ;
  git clone https://github.com/MenkeTechnologies/zsh-cargo-completion $ZSH_CUSTOM/plugins/zsh-cargo-completion ;

  u_success "ZSH installed"
}

copy() {
  u_bold "Copying .zshrc..."
  cp -r ../zsh/.zshrc ~/
}

install
copy

