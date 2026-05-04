#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"
source "$DOTFILES_DIR/lib/utils.sh"

u_header "ZSH & Oh My Zsh"

# Install Oh My Zsh if not present
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    u_bold "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Plugins
ZSH_CUSTOM_PLUGINS="$HOME/.oh-my-zsh/custom/plugins"
mkdir -p "$ZSH_CUSTOM_PLUGINS"

u_bold "Installing ZSH plugins..."
[ ! -d "$ZSH_CUSTOM_PLUGINS/zsh-autosuggestions" ] && git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM_PLUGINS/zsh-autosuggestions"
[ ! -d "$ZSH_CUSTOM_PLUGINS/zsh-syntax-highlighting" ] && git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM_PLUGINS/zsh-syntax-highlighting"
[ ! -d "$ZSH_CUSTOM_PLUGINS/zsh-cargo-completion" ] && git clone https://github.com/MenkeTechnologies/zsh-cargo-completion "$ZSH_CUSTOM_PLUGINS/zsh-cargo-completion"

# Symlink .zshrc
u_bold "Linking .zshrc..."
ln -sf "$DOTFILES_DIR/config/zsh/.zshrc" "$HOME/.zshrc"

u_success "ZSH setup complete"
