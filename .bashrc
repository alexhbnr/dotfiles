# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Enables color in the terminal bash shell export
CLICOLORS=1
LSCOLORS=gxfxcxdxbxegedabagacad

# enable color support of ls and also add handy aliases
alias ls='ls -G'
alias grep='grep --color=auto'
alias ll='ls -ahlF'
alias la='ls -A'
alias l='ls -CF'

# Enable Vi key-bindings
set editing-mode vi
set -o vi

# add script folders to PATH variable
PATH="$HOME/usr/bin:$HOME/scripts:$PATH"  # user installs & scripts
export PATH

# Julia
alias julia="julia --depwarn=no"

# Git config
source $HOME/.dotfiles/git-completion.bash
source $HOME/.dotfiles/git-prompt.sh
# PyEnv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
# Apparix
source $HOME/.bash_apparix
# Tmux
source $HOME/.tmux.bash
