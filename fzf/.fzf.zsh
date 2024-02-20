###############################################################################
# fzf
#
# fzf is a general-purpose command-line fuzzy finder.
#
# https://github.com/junegunn/fzf
#
# File locations:
# - ~/.fzf
# - ~/.fzf.bash
# - ~/.fzf.zsh
# - ~/.profile.d/fzf.sh
###############################################################################

# Dracula Theme
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=dark
--color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
--color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
'
# Print tree structure in the preview window
export FZF_ALT_C_OPTS="
  --border
  --margin=1
  --padding=1
  --height=80%
  --preview 'bat -n --color=always {}'
  --bind 'alt-j:accept,alt-q:abort,alt-p:backward-delete-char,alt-l:up,alt-a:beginning-of-line,alt-s:end-of-line,alt-k:down,alt-w:backward-kill-word,alt-e:kill-word,alt-m:forward-word,alt-n:backward-word,tab:toggle'
  "

export FZF_CTRL_T_OPTS="
  --border
  --margin=1
  --padding=1
  --height=80%
  --preview 'bat -n --color=always {}'
  --bind 'alt-j:accept,alt-q:abort,alt-p:backward-delete-char,alt-l:up,alt-a:beginning-of-line,alt-s:end-of-line,alt-k:down,alt-w:backward-kill-word,alt-e:kill-word,alt-m:forward-word,alt-n:backward-word,tab:toggle'"

# Tmux
# export FZF_TMUX_OPTS='-p80%,60%'

# Options to fzf command
export FZF_COMPLETION_TRIGGER=''
export FZF_COMPLETION_OPTS=' --height=40% --layout=reverse --info=inline --border --bind 'alt-j:accept,alt-q:abort,alt-p:backward-delete-char,alt-a:beginning-of-line,alt-s:end-of-line,alt-k:down,alt-w:backward-kill-word,alt-e:kill-word,alt-m:forward-word,alt-n:backward-word,tab:toggle,alt-l:up''

# Commands
# Open File or Directory
ff() {
  IFS=$'\n' files=($(fzf-tmux -p80%,60%  --preview 'bat -n --color=always {}' --query="$1" --multi --select-1 --reverse --exit-0  --bind 'alt-j:accept,alt-q:abort,alt-p:backward-delete-char,alt-l:up,alt-a:beginning-of-line,alt-s:end-of-line,alt-k:down,alt-w:backward-kill-word,alt-e:kill-word,alt-m:forward-word,alt-n:backward-word,tab:toggle'  ))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

ii() {
  IFS=$'\n' files=($(fzf-tmux -p80%,60%  --preview 'bat -n --color=always {}' --query="$1" --multi --select-1 --reverse --exit-0  --bind 'alt-j:accept,alt-q:abort,alt-p:backward-delete-char,alt-l:up,alt-a:beginning-of-line,alt-s:end-of-line,alt-k:down,alt-w:backward-kill-word,alt-e:kill-word,alt-m:forward-word,alt-n:backward-word,tab:toggle'  ))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

# fh - repeat history
fh() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac --reverse --border --height=40% --bind 'alt-j:accept,alt-q:abort,alt-p:backward-delete-char,alt-l:up,alt-a:beginning-of-line,alt-s:end-of-line,alt-k:down,alt-w:backward-kill-word,alt-e:kill-word,alt-m:forward-word,alt-n:backward-word,tab:toggle'| sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}

# Another CTRL-T script to select a directory and paste it into line
ffs ()
{
  builtin typeset READLINE_LINE_NEW="$(
    command find -L . \( -path '*/\.*' -o -fstype dev -o -fstype proc \) \
            -prune \
            -o -type f -print \
            -o -type d -print \
            -o -type l -print 2>/dev/null \
    | command sed 1d \
    | command cut -b3- \
    | env fzf -m
  )"

  if
    [[ -n $READLINE_LINE_NEW ]]
  then
    builtin bind '"\er": redraw-current-line'
    builtin bind '"\e^": magic-space'
    READLINE_LINE=${READLINE_LINE:+${READLINE_LINE:0:READLINE_POINT}}${READLINE_LINE_NEW}${READLINE_LINE:+${READLINE_LINE:READLINE_POINT}}
    READLINE_POINT=$(( READLINE_POINT + ${#READLINE_LINE_NEW} ))
  else
    builtin bind '"\er":'
    builtin bind '"\e^":'
  fi
}

# Select a running docker container to stop
function dkp() {
  local cid
  cid=$(docker ps | sed 1d | fzf -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker stop "$cid"
}

# Custom fuzzy completion for "doge" command
#   e.g. doge **<TAB>
# _fzf_complete_doge() {
#   _fzf_complete --multi --reverse --prompt="doge> " -- "$@" < <(
#     echo very
#     echo wow
#     echo such
#     echo doge
#   )
# }
#
# _fzf_complete_foo() {
#  _fzf_complete --multi --reverse --header-lines=3 -- "$@" < <(
#    exa -xA --color=always --icons --sort=size --group-directories-first
#  )
# }
#
# _fzf_complete_foo_post() {
#  awk '{print $NF}'
# }
#
# [ -n "$BASH" ] && complete -F _fzf_complete_foo -o default -o bashdefault foo

# Setup fzf
# ---------
if [[ ! "$PATH" = /usr/share/fzf/* ]]; then
  export PATH="$PATH:$HOME/.fzf/bin"
fi

# Man path
# --------
# if [[ ! "$MANPATH" =~ "$HOME"/.fzf/man && -d "$HOME/.fzf/man" ]]; then
#   export MANPATH="$MANPATH:$HOME/.fzf/man"
# fi

# Auto-completion
# ---------------
[[ $- =~ i ]] && source "/usr/share/fzf/completion.zsh"

# Key bindings
# ------------
source "/usr/share/fzf/key-bindings.zsh"
