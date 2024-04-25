#!/bin/bash

SUDO=
sudo echo "Testing sudo..." > /dev/null 2>&1
if [ $? -eq 0 ]; then
    SUDO="sudo"
fi

$SUDO apt-get update -y
$SUDO apt-get install -y git zsh tmux build-essential fzf vim cmake autojump silversearcher-ag cscope net-tools
$SUDO apt-get install -y vim-gtk3 || $SUDO apt-get install -y vim-gtk

# VIM
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
rm -f ~/.vimrc
wget https://gist.githubusercontent.com/JackyYin/cd747b3843fecad10410560e5a808fd1/raw/2f0609c54756b2166ad30b9d8216e57d8f84b100/.vimrc -O ~/.vimrc
vim +PluginInstall +qa ~/.vimrc

# TMUX
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
rm -f ~/.tmux.conf
wget https://gist.githubusercontent.com/JackyYin/f123a19303db9b3c9daf406fcefdaf14/raw/5f24f0f4b3d4cf701360de35549800b9c299367d/.tmux.conf -O ~/.tmux.conf

#ZSH
wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O zsh_install.sh
sed -i 's/exec zsh -l//g' zsh_install.sh
sh zsh_install.sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
rm -f ~/.zshrc
wget https://gist.githubusercontent.com/JackyYin/1b1130f1136b1f4c69fbe9e65e8894e3/raw/db716131c7026b0c4f19ecab9298ccf0799dfd0c/.zshrc -O ~/.zshrc
exec zsh -l
