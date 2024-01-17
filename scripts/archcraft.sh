yay -Syu  ;

yay -S asdf-vm --noconfirm ;

# Asdf
asdf plugin add nodejs;asdf plugin add python; asdf plugin add ruby; asdf plugin add golang; asdf plugin add rust; asdf plugin add lua; asdf install nodejs latest; asdf install rust latest; asdf install lua latest; asdf install golang latest; asdf install python latest; asdf install ruby latest; asdf global nodejs latest; asdf global rust latest; asdf global lua latest; asdf global golang latest; asdf global python latest; asdf global ruby latest;

# Proceed installation
yay -S --noconfirm sqlite  postgresql postgresql-libs redis libxml2 zlib ncurses5-compat-libs gdbm nss readline libffi yaml-cpp unzip gcc wget curl openssl libyaml ripgrep zsh memcached imagemagick ffmpeg mupdf mupdf-tools poppler yarn libxml2 ffmpeg mupdf mupdf-tools wget curl gcc git vim make cmake unzip mesa docker docker-compose docker-machine docker-buildx  unixodbc sxhkd fzf gyp bat github-cli microsoft-edge-beta neovim fd shell-color-scripts sd exa dog xh duf jq jqp netcat ansible expac mariadb mariadb-libs libmariadbclient mariadb-clients lazygit tmux entr w3m parallel

# Bspwm
cp -r ../bspwm/bspwmrc ~/.config/bspwm/
cp -r ../bspwm/sxhkdrc ~/.config/bspwm/
cp -r ../alacritty/* ~/.config/bspwm/alacritty/
cp -r ../bspwm/own ~/.config/bspwm/themes/ && sh ~/.config/bspwm/themes/own/apply.sh

# Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
curl -sS https://starship.rs/install.sh | sh

# Starship
cp -r ../starship/starship.toml ~/.config/starship/ ;

# Lazygit
cp -r ../lazygit/config.yml ~/.config/lazygit/ ;

# Lazydocker
cp -r ../lazydocker/config.yml ~/.config/lazydocker/ ;

# Zsh
cp -r ../zsh/.zshrc ~/ ;

# Psql
cp -r ../psql/config/.psqlrc ~/ ;

# Git
cp -r ../git/.gitconfig ~/ ;

# Fzf
cp -r ../fzf/.fzf.zsh ~/ ;

# Tmux
cp -r ../tmux/tmux.conf ~/ ;

# Nvchad
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim && cp -r ../nvchad/custom/* ~/.config/nvim/lua/custom/ ;

# Keygen
mkdir ~/.ssh/ && ssh-keygen ;

# Oh-my-zsh Plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions ;
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/plugins/zsh-syntax-highlighting ;
git clone https://github.com/MenkeTechnologies/zsh-cargo-completion ~/.oh-my-zsh/plugins/zsh-cargo-completion ;

# Projects
mkdir ~/projects
