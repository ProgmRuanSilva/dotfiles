#!/bin/bash

source $HOME/dotfiles/bin/utils.sh

install () {
  u_header "Docker"

  u_bold "Installing Docker..."
  sudo pacman -S --noconfirm docker docker-compose docker-machine docker-buildx docker-scout

  u_success "Docker installed"
}

make_user(){
  u_bold "Adding user to docker group..."

  sudo groupadd docker
  sudo usermod -aG docker $USER

  u_success "User added to docker group"
}

restart() {
  u_bold "Enabling Docker to start on boot..."
  systemctl enable docker
  systemctl enable containerd

  u_success "Docker enabled to start on boot"

  u_bold "Restarting Docker..."
  systemctl restart docker
  systemctl restart containerd

  u_success "Docker restarted"
  exit 0
}

install
make_user
restart

