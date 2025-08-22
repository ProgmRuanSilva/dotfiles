export ZSH="$HOME/.oh-my-zsh"
export FZF_BASE="/$HOME/.fzf/"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$HOME/.maestro/bin
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
export PATH=$GOPATH/bin:$GOROOT/bin:$HOME/.local/bin:$PATH
export PATH=$PATH:$HOME/Android/Sdk/emulator/

export ANDROID_HOME=$HOME/Android/Sdk
export JAVA_HOME=$HOME/.asdf/installs/java/adoptopenjdk-17.0.0+35/
export OLLAMA_ORIGINS=app://obsidian.md*
export PATH="$PATH":"$HOME/.maestro/bin"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# asdf stuff
fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)
autoload -Uz compinit && compinit

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="dracula"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode auto # update automatically without asking
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 13
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
zstyle ':completion:*:git:*' group-order 'main commands' 'alias commands' 'external commands'

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

# Plugins
ZSH_TMUX_AUTOSTART=true

plugins=(
  asdf
	ruby
	rails
	heroku
	bundler
	gitignore
	jsontools
	catimg
	copyfile
	extract
	fzf
	tmux
	sudo
	singlechar
	starship
	systemd
	last-working-dir
	command-not-found
	zsh-interactive-cd
	zsh-autosuggestions
	zsh-cargo-completion
	zsh-syntax-highlighting
)

# Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Carapace
source <(carapace _carapace)

# Fzf
 [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Switch groups, Necessary for docker run
if [[ $(id -gn) != "docker" ]]; then
	newgrp docker
	exit
fi

# Functions
quit() {
	exit
	zle reset-prompt
}
zle -N quit

ff-widget() {
   ff
   zle reset-prompt
 }
 zle -N ff-widget

# Toggle between zoxide history
dj() {
    local first second current
    first=$(zoxide query -l | sed -n '1p')
    second=$(zoxide query -l | sed -n '2p')
    current=$(pwd)

    if [ -z "$first" ] || [ -z "$second" ]; then
        echo "Not enough zoxide history to toggle."
        return 1
    fi

    if [ "$current" = "$second" ]; then
        cd "$first" || echo "Failed to cd into $first"
    else
        cd "$second" || echo "Failed to cd into $second"
    fi
}

# Function to "Cdback" in zoxide jumps
dj() {
    local dirs_output=$(dirs -v)
    local current_dir=$(pwd)
    local found_current=false
    local prev_dir=""
    
    while IFS= read -r line; do
        local dir_path=$(echo "$line" | sed 's/^[[:space:]]*[0-9][0-9]*[[:space:]]*//')
        
        if [[ "$dir_path" == "~"* ]]; then
            dir_path="${dir_path/#\~/$HOME}"
        fi
        
        dir_path=$(cd "$dir_path" 2>/dev/null && pwd)
        
        if [[ "$found_current" == true ]]; then
            prev_dir="$dir_path"
            break
        fi
        
        if [[ "$dir_path" == "$current_dir" ]]; then
            found_current=true
        fi
    done <<< "$dirs_output"
    
    if [[ -n "$prev_dir" && "$prev_dir" != "$current_dir" ]]; then
        z "$prev_dir"
    else
        local current_index=0
        local target_dir=""
        
        while IFS= read -r dir; do
            if [[ "$dir" == "$current_dir" ]]; then
                if [[ $current_index -eq 0 ]]; then
                    target_dir=$(zoxide query -l | sed -n '2p')
                else
                    
                fi
                break
            fi
            target_dir="$dir"
            ((current_index++))
        done < <(zoxide query -l)
        
        if [[ -n "$target_dir" ]]; then
            cd "$target_dir" || echo "Failed to cd into $target_dir"
        else
            echo "No recent zoxide entries found."
        fi
    fi
}

# Unmapppings
bindkey -r '^T'

#TIP: zle -al to see all widgets avalible
bindkey '^J' accept-line

bindkey '^Q' quit
bindkey '^E' delete-word
bindkey '^H' kill-buffer

bindkey '^S' forward-word
bindkey '^A' backward-word

#WARN: Needed to don't let zsh exit on Kitty console
stty eof ''
bindkey '^D' clear-screen

bindkey '^O' up-line-or-history


# Aliases
alias killp='kill -9'
alias jctl="journalctl -xb"
alias cleanup='sudo pacman -Rns $(pacman -Qtdq);yay -c' # cleanup orphaned packages
alias showbinds='zle -al | less'

# Grep
alias grep='grep --color=auto'

# Duf
alias dufh='duf --help | bat'

# Jqp
alias jqph='jqp --help | bat'

# Find
alias find='fd'

# Lsof
alias ports='lsof -i -P'

# Bat
alias less='bat --theme=base16 --force-colorization --paging=always --style=plain,changes,grid,snip'
alias cat='bat --theme=base16 --force-colorization --paging=always --style=plain,changes,grid,snip'

# Exa List
alias lsa='exa --tree --level=2 --icons --git'
alias ls="exa -GA --color=always --icons --sort=size --group-directories-first"
alias l="exa -GA --color=always --icons --sort=size --group-directories-first"
alias j="exa -GA --color=always --icons --sort=size --group-directories-first"

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
alias cp='cp -r'
alias update='yay -Syu'
alias backup="sh ~/dotfiles/bin/backup.sh"
alias gwn="sh ~/dotfiles/bin/gwa.sh \$@"
alias gnw="sh ~/dotfiles/bin/gnw.sh \$@"

# Zoxide
alias d="z"
alias dd="z .."
alias f="z"
alias fj='zi'

# Configurations Files
alias zshcfg="nvim ~/.zshrc"

# Apps
alias nv="nvim"
alias btop='sudo btop'
alias bt='sudo btop'
alias yay="yay -S"

# Postgres
alias pg="psql -U postgres"

# Npm
alias ns="npm start"
alias nd="npm run dev"
alias nr="npm run"
alias ni="npm install"

# Pnpm
alias p="pnpm"
alias pi="pnpm install"
alias pa="pnpm run android"
alias px="pnpm dlx"
alias pr="pnpm run"
alias pns="pnpm start"
alias pd="pnpm run dev"
alias pb="pnpm run build"

# Git
alias g="gemini"
alias gg="lazygit"
alias gd="sh ~/projects/tmux-lazygit/lazy.sh"
alias gph="git push"
alias gpl="git pull"
alias gco="gitmoji -c"
alias gc="git checkout"
alias gch="git checkout"
alias gcb="git checkout -b"
alias gstp="git fetch; git pull origin main"

# Docker Compose
alias dr="docker run"
alias dps="lazydocker"
alias dsp="lazydocker"
alias dhelp="docker --help"
alias dimg="docker image ls"
alias dexec="docker exec -it"
alias dbuild="docker build -it "

alias dc="docker-compose"
alias dcw="docker-compose up --watch"
alias dcd="docker-compose down"
alias dcb="docker-compose build"
alias dch="docker-compose --help"
alias dcub="docker-compose up --build"
alias dcud="docker-compose up --detach"
alias dcu="docker-compose up --build --detach"
alias dcubd="docker-compose up --build --detach"
alias du="docker-compose up --build --detach"

# Gradle
alias gw="./gradlew "
alias gwb="./gradlew build"
alias gwr="./gradlew run"
alias gwt="./gradlew test"

# System
alias off="poweroff"
alias rbt="reboot"



