#!/bin/bash

install() {
  source $HOME/dotfiles/bin/utils.sh

  u_header "Ollama.ai"

  u_bold "Installing Ollama.ai..."
  curl https://ollama.ai/install.sh | sh

  u_success "Ollama.ai installed"

  break
}

install
