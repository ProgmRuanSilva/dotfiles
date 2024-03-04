#!/bin/bash

tmux() {
  source $HOME/dotfiles/bin/utils.sh

  u_header "Tmux Installer"

  u_bold "Installing Tmux..."
  sudo pacman -S --noconfirm tmux

  u_bold "Creating .config/tmux..."
  if [ ! -d ~/.config/tmux ]; then
    mkdir ~/.config/tmux/
  fi
}

copy(){
  u_bold "Copying .tmux.conf..."
  cp -r ../tmux/tmux.conf ~/.config/tmux/
}

tpm(){
  u_bold "Installing Tpm..."
  if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  fi
}

end(){
  u_warning "Run Ctrl + B and I to install plugins" 
  u_success "Tmux Installed"
  exit 0
}

tmux
copy
tpm
end
