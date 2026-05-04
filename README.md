# 🌌 Manjaro Dotfiles

Modern, symlink-based configuration for Manjaro Linux (GNOME).

## 🚀 One-Line Installation

To install everything automatically on a fresh Manjaro install, run:

```bash
git clone https://github.com/ProgmRuanSilva/dotfiles.git ~/dotfiles && cd ~/dotfiles && chmod +x install.sh && ./install.sh
```

## 🛠️ What's included?

- **Core**: ZSH (Oh My Zsh + Plugins), Git, GitHub CLI, Starship, FZF.
- **Languages (ASDF)**: Node.js, Python, Ruby, Go, Rust, Lua.
- **Terminal**: Kitty, Alacritty, Tmux.
- **Dev Tools**: Docker, Ollama, Fabric, PostgreSQL, Ngrok, Lazygit, Lazydocker.
- **Editor**: Custom Neovim config (cloned from `ProgmRuanSilva/nvim`).
- **Desktop**: GNOME settings, extensions, themes, and Flatpaks (automatically restored).

## 📂 Structure

- `modules/`: Modular installation scripts.
- `config/`: The source of truth for all config files (symlinked to `~/.config`).
- `lib/`: Shared utilities and UI functions.
- `assets/`: Static resources (fonts, themes, icons, wallpapers).
- `backup/`: Scripts used to capture the current state.

## 🔗 Symlinks

This project uses symlinks (`ln -sf`). This means:
1. Your configuration files live in `~/dotfiles/config/`.
2. Any changes you make in `~/.config/` (that are symlinked) will be reflected in this repo.
3. You can easily commit and push changes back to GitHub.

## 📝 Post-Install

After the script finishes:
1. Run `gh auth login` to authenticate with GitHub.
2. Run `source ~/.zshrc` or restart your terminal.
3. Some GNOME extensions might require a logout/login to activate fully.

---
Built with ☕ and 🤖 by Antigravity for Ruan Silva.
