#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"
source "$DOTFILES_DIR/lib/utils.sh"

u_header "Docker"

u_bold "Installing Docker..."
sudo pacman -S --noconfirm docker docker-compose docker-machine docker-buildx

u_bold "Adding user to docker group..."
sudo groupadd docker 2>/dev/null
sudo usermod -aG docker $USER

u_bold "Enabling and restarting Docker..."
sudo systemctl enable --now docker
sudo systemctl enable --now containerd

u_success "Docker setup complete"
