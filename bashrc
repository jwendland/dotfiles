# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# vi mode
set -o vi

# source Google specifics
if [ -r ~/.bashrc-google ]; then
  source ~/.bashrc-google
fi

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000
HISTTIMEFORMAT='%Y-%m-%d %T %Z  '

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

color_prompt=yes

if [ "$color_prompt" = yes ]; then
    PS1='\[\033[38;5;3m\]\u@\h\[\033[00m\]:\[\033[38;5;6m\]$PWD1\[\033[00m\]\[\033[38;5;3m\]$PWD2\[\033[00m\]\$ '
else
    PS1='\u@\h:$PWD1$PWD2\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;\u@\h: \w\a\]$PS1"
    export TERM=xterm-256color
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_aliases-google ]; then
    . ~/.bash_aliases-google
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

function update-environment {
  local v
  while read v; do
    if [[ $v == -* ]]; then
      unset ${v/#-/}
    else
      # Surround value with quotes
      v=${v/=/=\"}
      v=${v/%/\"}
      eval export $v
    fi
  done < <(tmux show-environment)
}

if [ -d ~/bin ]; then
  export PATH=~/bin:$PATH
fi

if [ -d ~/go/bin ]; then
  export PATH=~/go/bin:$PATH
fi
