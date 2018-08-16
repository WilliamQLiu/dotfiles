#!/bin/bash
# Run as sudo ./new_computer_setup.sh

echo "New Computer Setup"

#apt-get update
#apt-get upgrade

apt-get install git \
    vim neovim \
    golang-go \
    python3-pip \
    terminator \
    htop \
    curl \
    scrot \
    texmaker

# install i3
/usr/lib/apt/apt-helper download-file http://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2018.01.30_all.deb keyring.deb SHA256:baa43dbbd7232ea2b5444cae238d53bebb9d34601cc000e82f11111b1889078a
dpkg -i ./keyring.deb
echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" >> /etc/apt/sources.list.d/sur5r-i3.list
apt update
apt install i3
mkdir ~/.i3
#cp /etc/i3/config ~/.i3/config
# Can now login under i3

# Setup Python
pip3 install virtualenvwrapper

# Setup Git, vim and Vundle
mkdir -p ~/GitHub/
git clone https://github.com/WilliamQLiu/dotfiles.git ~/GitHub/dotfiles/
cp ~/GitHub/dotfiles/.bashrc ~
cp ~/GitHub/dotfiles/.vimrc ~
cp ~/GitHub/dotfiles/.git-prompt.sh ~
cp ~/GitHub/dotfiles/.my.cnf ~
cp ~/GitHub/dotfiles/.myclirc ~
cp ~/GitHub/dotfiles/.gitconfig ~
cp ~/GitHub/dotfiles/.gitignore ~
cp ~/GitHub/dotfiles/.inputrc ~
cp ~/GitHub/dotfiles/.ssh/config ~/.ssh/
cp ~/GitHub/dotfiles/etc/bash_completion.d ~

# Add configs
mkdir -p ~/.config
cp -r ~/GitHub/dotfiles/.config/flake8 ~/.config/flake8
cp -r ~/GitHub/dotfiles/.config/i3 ~/.config/i3/
cp -r ~/GitHub/dotfiles/.config/i3status ~/.config/i3status/
cp -r ~/GitHub/dotfiles/.config/i3/config ~/.i3/config

# Boot the Kernel with noresume parameter (faster)
cp ~/GitHub/dotfiles/etc/default/grub /etc/default/grub
update-grab

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

mkdir -p /etc/X11/xorg.conf.d/
cp ~/GitHub/dotfiles/etc/X11/xorg.conf.d/* /etc/X11/xorg.conf.d/

# Setup ssh
mkdir -p ~/.ssh/
cp ~/GitHub/dotfiles/.ssh/config ~/.ssh/
# Move id_rsa and id_rsa.pub files over to ~/.ssh
#cd ~/GitHub/dotfiles && git remote set-url origin git@github.com:WilliamQLiu/dotfiles.git

