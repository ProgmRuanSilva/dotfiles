yay -S sqlite mariadb mariadb-libs postgresql postgresql-libs redis libxml2 zlib ncurses5-compat-libs gdbm nss openssl readline libffi xz yaml-cpp unzip make gcc wget curl fzf openssl libyaml ripgrep zsh sqlite mariadb libmariadbclient mariadb-clients postgresql postgresql-libs redis memcached imagemagick ffmpeg mupdf mupdf-tools poppler yarn libxml2 memcached;
yay -S ffmpeg mupdf mupdf-tools wget curl gcc git vim ripgrep zsh fzf make  openssl cmake unzip mesa docker docker-compose docker-machine docker-buildx asdf-vm unixodbc sxhkd ripgrep fzf gyp bat github-cli microsoft-edge-beta neovim fd shell-color-scripts sd exa dog xh duf jq jqp netcat ansible expac

# Asdf
asdf plugin add nodejs;asdf plugin add python; asdf plugin add ruby; asdf plugin add golang; asdf plugin add rust; asdf plugin add lua asdf install nodejs latest; asdf install rust latest; asdf install lua latest; asdf install golang latest; asdf install python latest; asdf install ruby latest; asdf global nodejs latest; asdf global rust latest; asdf global lua latest; asdf global golang latest; asdf global python latest; asdf global ruby latest;

# Keygen
mkdir ~/.ssh/ && ssh-keygen

mkdir ~/projects

# Nvchad
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim && cp -r ../nvim/nvchad/custom/* ~/.config/nvim/lua/custom/ ;

# Bspwm
cp -r ../bspwm/bspwmrc ~/.config/bspwm/
cp -r ../bspwm/own ~/.config/bspwm/themes/ && sh ~/.config/bspwm/themes/own/apply.sh
cp -r ../zsh/terminals/alacritty/* ~/.config/bspwm/alacritty/

# Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
curl -sS https://starship.rs/install.sh | sh
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions ;
git clone https://github.com/zsh-users/zsh-syntax-highlighting $ZSH_CUSTOM/plugins/zsh-syntax-highlighting ;
git clone https://github.com/MenkeTechnologies/zsh-cargo-completion $ZSH_CUSTOM/plugins/zsh-cargo-completion ;
cp -r ../zsh/starship ~/.config/
cp -r ../zsh/.zshrc ~/
