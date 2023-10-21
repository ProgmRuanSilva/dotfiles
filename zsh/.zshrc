# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export asdf="$HOME/.asdf/asdf.sh"
export MANPATH="/usr/local/man:$MANPATH"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
export FZF_BASE="/$HOME/.fzf/"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

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
# zstyle ':omz:update' frequency 13

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
# COMPLETION_WAITING_DOTS="true"

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

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder


# Plugins
# See configs oh-my-zsh plugins
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/`jump`

# Remember to install fzf
# https://github.com/junegunn/fzf#installation

plugins=(
    starship
    alias-finder
    ansible
    asdf
    bundler
    catimg
    command-not-found
    copyfile
    docker
    docker-machine
    extract
    fzf
    git
    gitignore
    heroku
    jsontools
    postgres
    jump
    rails
    ruby
    golang
    singlechar
    systemd
    sudo
    thefuck
    web-search
    last-working-dir
    zsh-interactive-cd
    zsh-autosuggestions
    zsh-cargo-completion
    zsh-syntax-highlighting
    zsh-interactive-cd # fzf required
)

source $ZSH/oh-my-zsh.sh
source $HOME/.oh-my-zsh/plugins/zsh-interactive-cd/zsh-interactive-cd.plugin.zsh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# LEMBRAR DE USAR O XARGS PRA ARGUMENTOS EM BASH

# Alias-finder
# zstyle ':omz:plugins:alias-finder' autoload yes
# zstyle ':omz:plugins:alias-finder' longer yes
# zstyle ':omz:plugins:alias-finder' exact yes
# zstyle ':omz:plugins:alias-finder' cheaper yes


# Mappings
bindkey '^[j' accept-line
bindkey '^[e' delete-word
bindkey '^[w' backward-delete-word
bindkey '^[l' clear-screen
bindkey '^[m' forward-word
bindkey '^[n' backward-word
# bindkey '^[k' autosuggest-accept
bindkey '^[h' backward-kill-line
bindkey '^[ç' backward-delete-char
bindkey '^[a' complete-word

# List
alias l="ls -a"
alias le="ls -a"
alias lej="ls -a"
alias hm="cd ~/"

# Configurations Files
alias zshcfg="nvim ~/.zshrc"
alias nvcfg="cd ~/.config/nvim/;nvim"
alias strcfg="nvim ~/.config/starship/starship.toml"

# Apps
alias nv="nvim"
alias mjc="gitmoji -c"
alias jp="jump"

# Docker Compose
alias dcb="sudo docker-compose build"
alias dcu="sudo docker-compose up"
alias dcub="sudo docker-compose up --build"
alias db="sudo docker build"

# Podman
alias pc-="podman-compose"
alias pc-build="podman-compose build"

# Postgres
alias pg="psql -U postgres"
alias pgcfg="cd /etc/postgresql/14/main/"

# Packages
alias ns="npm start"
alias nd="npm run dev"
alias nr="npm run"

# Ollama
alias olm="ollama run mistral"
alias olc="ollama run codellama"
alias oll="ollama run llama2"

#git
alias gc="git checkout"
alias gcb="git checkout -b"

# Todo
alias td="nvim ~/projects/todo.txt"
alias tds="cat ~/projects/todo.txt | less"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
