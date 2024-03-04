#!/bin/bash


starship() {
  source $HOME/dotfiles/bin/utils.sh

  u_header "Starship Installer"

  u_bold "Installing starship..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  curl -sS https://starship.rs/install.sh | sh

  u_bold "Making ~/.config/starship..."
  if [ ! -d ~/.config/starship ]; then
    mkdir ~/.config/starship
  fi

  u_bold "Copying starship.toml..."
  if [ ! -f ~/.config/starship/starship.toml ]; then
    cp -r ../starship/starship.toml ~/.config/starship/
  fi

  u_success "Starship installed"
  break
}

starship
