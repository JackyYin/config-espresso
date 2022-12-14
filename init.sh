#!/bin/bash

sudo apt-get update -y
sudo apt-get install -y git zsh tmux build-essential fzf vim vim-gtk cmake autojump silversearcher-ag

# VIM
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp .vimrc ~
vim +PluginInstall +qa ~/.vimrc

# TMUX
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp .tmux.conf ~

#ZSH
wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O zsh_install.sh
sed -i 's/exec zsh -l//g' zsh_install.sh
sh zsh_install.sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
cp .zshrc ~
exec zsh -l
