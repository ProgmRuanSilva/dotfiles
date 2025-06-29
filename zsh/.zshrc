export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
export MANPATH="/usr/local/man:$MANPATH"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
export FZF_BASE="/$HOME/.fzf/"
export FLYCTL_INSTALL="/home/dev/.fly"
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH
export PATH=$PATH:$GOROOT/bin
export PATH="$FLYCTL_INSTALL/bin:$PATH"
export PATH=$GOPATH/bin:$GOROOT/bin:$HOME/.local/bin:$PATH
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

# Fzf
 [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Switch groups, Necessary for docker run
if [[ $(id -gn) != "docker" ]]; then
	newgrp docker
	exit
fi

# My scripts
cdback() {
	cd ..
	zle reset-prompt
}
zle -N cdback

quit() {
	exit
	zle reset-prompt
}
zle -N quit

spf-widget() {
  zle reset-prompt        # Optional: refresh the line
  zle -I                  # Clear input
  BUFFER="spf"            # Set the command
  zle accept-line         # Run it immediately
}
zle -N spf-widget


# ff() {
#  IFS=$'\n' files=($(fzf-tmux -p80%,60%  --preview 'bat -n --color=always {}' --query="$1" --multi --select-1 --reverse --# exit-0  --bind 'alt-j:accept,alt-q:abort,alt-p:backward-delete-char,alt-l:up,alt-a:beginning-of-line,alt-s:end-of-line,alt-# k:down,alt-w:backward-kill-word,alt-e:kill-word,alt-m:forward-word,alt-n:backward-word,tab:toggle'  ))
#  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
#}

# ff-widget() {
#   ff
#   zle reset-prompt
# }
# zle -N ff-widget


# Unmapppings
bindkey -r '^T'

bindkey "^[c" spf-widget  # ^[ is ESC, so this binds Alt+b
# bindkey  "^[f" ff-widget

#TIP: zle -al to see all widgets avalible
bindkey '^[j' accept-line

bindkey '^[q' quit
bindkey '^[e' delete-word
bindkey '^[w' backward-delete-word
bindkey '^[h' kill-buffer

bindkey '^[s' forward-word
bindkey '^[a' backward-word

bindkey '^[d' clear-screen

bindkey '^[m' cdback
bindkey '^[n' beginning-of-line

bindkey '^[o' up-line-or-history
bindkey '^[p' down-line-or-history


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

alias f="flyctl"

# Exa List
alias lei='exa --tree --level=2 --icons --git'
alias ls="exa -GA --color=always --icons --sort=size --group-directories-first"
alias l="exa -GA --color=always --icons --sort=size --group-directories-first"
alias le='exa -T --color=always --icons --group-directories-first'
alias le='exa -GA --color=always --icons --sort=size --group-directories-first'
alias el='exa -xA --color=always --icons --sort=size --group-directories-first'
alias e='exa -xA --color=always --icons --sort=size --group-directories-first'
alias ej='exa -xA --color=always --icons --sort=size --group-directories-first'
alias elj='exa -xA --color=always --icons --sort=size --group-directories-first'
alias eli='exa -xA --color=always --icons --sort=size --group-directories-first'
alias lejj='exa -xA --color=always --icons --sort=size --group-directories-first'
alias lej='exa -xA --color=always --icons --sort=size --group-directories-first'
alias lel='exa -xA --color=always --icons --sort=size --group-directories-first'
alias lei='exa -xA --color=always --icons --sort=size --group-directories-first'
alias li='exa -xA --color=always --icons --sort=size --group-directories-first'

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
alias rnm='vidir'
alias hm='cd ~/'
alias rm='rm -rf'
alias cp='cp -r'
alias update='backup; sudo yay -Syu'
alias backup="sh ~/dotfiles/bin/backup.sh"
alias gwn="sh ~/dotfiles/bin/gwa.sh \$@"
alias gnw="sh ~/dotfiles/bin/gnw.sh \$@"
alias d="z"

# Configurations Files
alias zshcfg="nvim ~/.zshrc"
alias tmcfg="nvim ~/.config/tmux/tmux.conf"
alias fzfcfg="nvim ~/.fzf.zsh"
alias nvcfg="cd ~/.config/nvim/lua/custom/;nvim"
alias strcfg="nvim ~/.config/starship/starship.toml"

# Apps
alias nv="nvim"
alias n="nvim"
alias jp="jump"
alias volume='pavucontrol'
alias vol='pavucontrol'
alias btop='sudo btop'
alias bt='sudo btop'
alias acn='autocannon'
alias c='z'
alias cdi='zi'
alias r='ranger'

# ACT
alias actr='act -j'
alias actl='act -l'

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
alias dcps="docker-compose ps"
alias dcb="docker-compose build"
alias dch="docker-compose --help"
alias dcub="docker-compose up --build"
alias dcud="docker-compose up --detach"
alias dcu="docker-compose up --build --detach"
alias dcubd="docker-compose up --build --detach"
alias du="docker-compose up --build --detach"

# Minikube
alias mn="minikube"
alias mnp="minikube status"
alias mns="minikube start"
alias mnd="minikube delete"
alias mnst="minikube stop"
alias mnan="minikube node add"

# Ollama
alias oll="ollama run llama3:instruct"
alias oln="ollama run llama3.1"

# System
alias off="poweroff"
alias rbt="reboot"
# Shacn
alias sha="pnpm dlx shadcn@latest add"
alias shi="pnpm dlx shadcn@latest init"

alias gtt="sh ~/projects/git-stack/main.sh"

export PATH=$PATH:$HOME/.maestro/bin
