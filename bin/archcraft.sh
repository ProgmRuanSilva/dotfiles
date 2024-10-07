#!/bin/bash

# the pakage of new alacritty is  alacritty-smooth-cursor-git
# mdlees

source $HOME/dotfiles/bin/utils.sh

setup() {

	u_header "Archcraft"

	u_bold "Updating..."
	source $HOME/dotfiles/bin/update.sh
	u_success "Completed"

	u_bold "Installing Asdf..."
	source $HOME/dotfiles/bin/asdf.sh
	u_success "Asdf installed"

	u_bold "Installing Packages..."
	seek_confirmation "Do you want to install packages?"
	yay -S --noconfirm sqlite libxml2 zlib ncurses5-compat-libs gdbm nss readline libffi yaml-cpp unzip gcc wget curl openssl libyaml ripgrep zsh memcached imagemagick ffmpeg mupdf mupdf-tools poppler yarn libxml2 ffmpeg mupdf mupdf-tools wget curl gcc git vim make cmake unzip mesa docker docker-compose docker-machine docker-buildx unixodbc sxhkd fzf gyp bat github-cli microsoft-edge-beta neovim fd shell-color-scripts sd exa dog xh duf jq jqp netcat ansible expac mariadb mariadb-libs libmariadbclient mariadb-clients lazygit tmux entr w3m parallel docker-scout zoxide picom-ibhagwan-git btop
	u_success "Packages installed"

	u_bold "Installing Ollama.."
	source $HOME/dotfiles/bin/ollama.sh
	u_success "Ollama installed"

	u_bold "Installing Lazygit.."
	source $HOME/dotfiles/bin/lazygit.sh
	u_success "Lazygit installed"

	u_bold "Installing Lazydocker.."
	source $HOME/dotfiles/bin/lazydocker.sh
	u_success "Lazydocker installed"

	u_bold "Installing Starship.."
	source $HOME/dotfiles/bin/starship.sh
	u_success "Starship installed"

	u_bold "Installign Tmux..."
	source $HOME/dotfiles/bin/tmux.sh
	u_success "Tmux installed"

	u_bold "Installing Tpm..."
	source $HOME/dotfiles/bin/tpm.sh
	u_success "Tpm installed"

	u_bold "Installing Nvim..."
	source $HOME/dotfiles/bin/nvim.sh
	u_success "Nvim installed"

	u_bold "Installing Docker..."
	source $HOME/dotfiles/bin/docker.sh
	u_success "Docker installed"

	u_bold "Installing Bspwm..."
	source $HOME/dotfiles/bin/bspwm.sh
	u_success "Bspwm installed"

	u_bold "Installing Psql..."
	source $HOME/dotfiles/bin/psql.sh
	u_success "Psql installed"
}

setup

# Projects
mkdir ~/projects
