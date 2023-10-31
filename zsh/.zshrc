# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export asdf="$HOME/.asdf/asdf.sh"
export MANPATH="/usr/local/man:$MANPATH"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
export FZF_BASE="/$HOME/.fzf/"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

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

# Mapping for Abnt keyborad (if u are ussing)
setxkbmap -model abnt2 -layout br -variant abnt2
setxkbmap -option terminate:ctrl_alt_bksp

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


# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Default Editor
export EDITOR="/usr/bin/nvim"
export VISUAL="/usr/bin/nvim"

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Alias-finder
# zstyle ':omz:plugins:alias-finder' autoload yes
# zstyle ':omz:plugins:alias-finder' longer yes
# zstyle ':omz:plugins:alias-finder' exact yes
# zstyle ':omz:plugins:alias-finder' cheaper yes


# Mappings
bindkey '^[j' accept-line
bindkey '^[w' delete-word
bindkey '^[q' backward-delete-word
bindkey '^[l' clear-screen
bindkey '^[k' clear-screen
bindkey '^[m' forward-word
bindkey '^[n' backward-word
# bindkey '^[k' autosuggest-accept
bindkey '^[h' backward-kill-line
bindkey '^[p' backward-delete-char
bindkey '^[a' complete-word

# Remappings for new commands

alias cleanup='sudo pacman -Rns $(pacman -Qtdq);yay -c' #Cleanup orphaned packages
alias cpu="ps axch -o cmd:15,%cpu --sort=-%cpu | head"
alias df='df -h'
alias grep='grep --color=auto'
alias jctl="journalctl -p 3 -xb" #get the error messages from journalctl
alias killp='killprocess'
alias kp='killprocess'
alias mem="ps axch -o cmd:15,%mem --sort=-%mem | head"
alias mv='mv -i'
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl" #Recent Installed Packages
alias riplong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"
alias wget="wget -c" # continue the download

# Bindkeys for vi-mode
# bindkey -M menuselect 'h' vi-backward-char
# bindkey -M menuselect 'k' vi-up-line-or-history
# bindkey -M menuselect 'l' vi-forward-char
# bindkey -M menuselect 'j' vi-down-line-or-history
# bindkey -v '^?' backward-delete-char
# bindkey -s '^x' '\nexit\n'
# bindkey -s '^o' 'rangercd\n'
# bindkey -s '^g' 'git pull && git status\n'
# bindkey '^R' history-incremental-search-backward
# bindkey -v


# Bat
alias less='bat -pf'
alias cat='bat'

# List
alias l='exa -DF --color=always --icons --sort=size --group-directories-first'
alias ls="exa -T --color=always --icons --group-directories-first"
alias le='exa -GF --color=always --icons --sort=size --group-directories-first'
alias lej="exa -GF --color=always --icons --sort=size --group-directories-first"
alias lst='exa -lahFT --color=always --icons --sort=size --group-directories-first'

# Zsh
alias q='exit'
alias hm="cd ~/"
alias rst="touch ~/.zshsrc"
alias rm='rm -rf'
alias update='sudo pacman -Syu'

# Configurations Files
alias zshcfg="nvim ~/.zshrc"
alias nvcfg="cd ~/.config/nvim/lua/custom/;nvim"
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

# Git
alias gc="git checkout"
alias gcb="git checkout -b"

# Todo
alias td="nvim ~/projects/todo.txt"
alias tds="cat ~/projects/todo.txt | bat"

# Backup
alias backup="sh ~/dotfiles/scripts/backup.sh"
