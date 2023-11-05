# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
export asdf="$HOME/.asdf/asdf.sh"
export MANPATH="/usr/local/man:$MANPATH"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
export FZF_BASE="/$HOME/.fzf/"
export FLYCTL_INSTALL="/home/dev/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="dracula"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Default Editor
export EDITOR="/usr/bin/nvim"
export VISUAL="/usr/bin/nvim"

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Mapping for Abnt keyborad (if u are ussing)
setxkbmap -model abnt2 -layout br -variant abnt2
setxkbmap -option terminate:ctrl_alt_bksp

# Plugins
# See configs oh-my-zsh plugins
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/`jump`

# Remember to install fzf
# https://github.com/junegunn/fzf#installation

plugins=(
    git
    ruby
    asdf
    rails
    golang
    heroku
    bundler
    postgres
    gitignore
    jsontools
    docker-machine
    alias-finder
    ansible
    catimg
    copyfile
    extract
    fzf
    jump
    sudo
    singlechar
    starship
    systemd
    web-search
    last-working-dir
    command-not-found
    zsh-interactive-cd
    zsh-autosuggestions
    zsh-cargo-completion
    zsh-syntax-highlighting
    zsh-interactive-cd # fzf required
)

source $ZSH/oh-my-zsh.sh
source $HOME/.oh-my-zsh/plugins/zsh-interactive-cd/zsh-interactive-cd.plugin.zsh

# Shell Colored Scripts
colorscript random

# session_name="sesh"
#
# # 1. First you check if a tmux session exists with a given name.
# tmux has-session -t=$session_name 2> /dev/null
#
# # 2. Create the session if it doesn't exists.
# if [[ $? -ne 0 ]]; then
#   TMUX='' tmux new-session -d -s "$session_name"
# fi
#
# # 3. Attach if outside of tmux, switch if you're in tmux.
# if [[ -z "$TMUX" ]]; then
#   tmux attach -t "$session_name"
# else
#   tmux switch-client -t "$session_name"
# fi

# Alias-finder
  # zstyle ':omz:plugins:alias-finder' autoload yes
  # zstyle ':omz:plugins:alias-finder' longer yes
  # zstyle ':omz:plugins:alias-finder' exact yes
  # zstyle ':omz:plugins:alias-finder' cheaper yes


# Command-Line Mappings #zle -al to see all widgets avalible
  bindkey '^[j' accept-line

  bindkey '^[w' delete-word
  bindkey '^[q' backward-delete-word

  bindkey '^[p' backward-delete-char
  bindkey '^[e' kill-buffer

  bindkey '^[k' forward-char
  bindkey '^[h' backward-char

  bindkey '^[m' forward-word
  bindkey '^[n' backward-word

  bindkey '^[l' clear-screen

  bindkey '^[s' end-of-line
  bindkey '^[a' beginning-of-line

  bindkey '^[,' up-line-or-history
  bindkey '^[.' down-line-or-history


# Defaults Commands
    alias killp='kill -9'
    alias jctl="journalctl -xb"
    alias cleanup='sudo pacman -Rns $(pacman -Qtdq);yay -c' # cleanup orphaned packages
    alias showbinds='zle -al'

  # Grep
    alias grep='grep --color=auto'

  # XH
    alias http='xh'
    alias httph='xh --help | bat'

  # Duf
    alias dufh='duf --help | bat'

  # Jqp
    alias jqph='jqp --help | bat'

  # Find
    alias find='fd'

  # Bat
    alias less='bat  --theme=Dracula --color always'
    alias cat='bat --theme=Dracula --color always '

  # Exa List
    alias l='exa -DF --color=always --icons --sort=size --group-directories-first'
    alias ls="exa -T --color=always --icons --group-directories-first"
    alias le='exa -GFA --color=always --icons --sort=size --group-directories-first'
    alias lej="exa -GFA --color=always --icons --sort=size --group-directories-first"
    alias lst='exa -lahFT --color=always --icons --sort=size --group-directories-first'

# System Information
  alias cpu="ps axch -o cmd:15,%cpu --sort=-%cpu | head"
  alias df='df -h'
  alias mem="ps axch -o cmd:15,%mem --sort=-%mem | head"

# List Rececents Packages
  alias lspkg="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
  alias lspkglong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"

# Zsh
  alias q='exit'
  alias mv='mv -i'
  alias hm='cd ~/'
  alias rm='rm -rf'
  alias rst='touch ~/.zshsrc'
  alias update='sudo pacman -Syu'
  alias backup="sh ~/dotfiles/scripts/backup.sh"

# Configurations Files
  alias zshcfg="nvim ~/.zshrc"
  alias nvcfg="cd ~/.config/nvim/lua/custom/;nvim"
  alias strcfg="nvim ~/.config/starship/starship.toml"

# Apps
  alias nv="nvim"
  alias n="nvim"
  alias jp="jump"
  alias volume='pavucontrol'

# Postgres
  alias pg="psql -U postgres"

# Npm
  alias ns="npm start"
  alias nd="npm run dev"
  alias nr="npm run"

# Git
  alias gco="gitmoji -c"
  alias gc="git checkout"
  alias gcb="git checkout -b"

# Docker Compose
  alias dr="docker run"
  alias db="docker build"
  alias dimg="docker image ls"
  alias dps="docker"
  alias dh="docker --help"

  alias dc="docker-compose"
  alias dcu="docker-compose up"
  alias dcd="docker-compose down"
  alias dcps="docker-compose ps"
  alias dcb="docker-compose build"
  alias dch="docker-compose --help"
  alias dimg="docker-compose image ls"
  alias dcub="docker-compose up --build"

# Ollama
  alias olm="ollama run mistral"
  alias olc="ollama run codellama"
  alias oll="ollama run llama2"
