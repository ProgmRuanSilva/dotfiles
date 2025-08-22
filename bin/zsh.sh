#!/bin/bash

source $HOME/dotfiles/bin/utils.sh

install () {
  u_header "ZSH Installer"

  u_bold "Installing zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" ;
  
  # Set the correct path for custom plugins
  ZSH_CUSTOM_PLUGINS="$HOME/.oh-my-zsh/custom/plugins"
  
  # Create plugins directory if it doesn't exist
  mkdir -p "$ZSH_CUSTOM_PLUGINS"
  
  git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM_PLUGINS/zsh-autosuggestions" ;
  git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM_PLUGINS/zsh-syntax-highlighting" ;
  git clone https://github.com/MenkeTechnologies/zsh-cargo-completion "$ZSH_CUSTOM_PLUGINS/zsh-cargo-completion" ;

  u_success "ZSH installed"
}

copy() {
  u_bold "Copying .zshrc..."
  cp -r ../zsh/.zshrc ~/
}

install
copy

