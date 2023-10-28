sudo pacman -S yay && sudo yay -S sqlite mariadb mariadb-libs postgresql postgresql-libs redis libxml2 zlib ncurses5-compat-libs gdbm nss openssl readline libffi xz zlib yaml-cpp unzip make gcc wget curl fzf openssl libyaml ripgrep zsh sqlite mariadb libmariadbclient mariadb-clients postgresql postgresql-libs redis memcached imagemagick ffmpeg mupdf mupdf-tools poppler yarn libxml2 memcached imagemagick ffmpeg mupdf mupdf-tools libxml2-dev build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget liblzma-dev curl gcc git vim ripgrep zsh fzf make libz-dev openssl libyaml-dev cmake

#zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
curl -sS https://starship.rs/install.sh | sh
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/MenkeTechnologies/zsh-cargo-completion $ZSH_CUSTOM/plugins/zsh-cargo-completion



# gihubcli
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y
