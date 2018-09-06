#!/bin/bash
# Installation script to set up all config files quickly
# Bash set up
mv ~/.bash_profile ~/.bash_profile.bak
ln -s ${PWD}/.bashrc ${HOME}/.bash_profile
mkdir -p ${HOME}/usr
mkdir -p ${HOME}/scripts
mkdir -p ${HOME}/.dotfiles
ln -s ${PWD}/git-completion.sh ${HOME}/.dotfiles/
ln -s ${PWD}/git-prompt.sh ${HOME}/.dotfiles/
ln -s ${PWD}/.bash_apparix ${HOME}/
ln -s ${PWD}/.tmux.bash ${HOME}/
ln -s ${PWD}/.tmux.conf ${HOME}/
# Vim set-up
mkdir -p ${HOME}/.config
mkdir -p ${HOME}/.config/nvim
ln -s ${PWD}/init.vim ${HOME}/.config/nvim/
ln -s ${PWD}/vim-skeletons ${HOME}/.config/nvim/
ln -s ${PWD}/.vimrc ${HOME}/
