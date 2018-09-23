#!/bin/bash
# Run as sudo ./new_computer_setup.sh

echo "New Computer Setup"

#apt-get update
#apt-get upgrade

apt-get install git \
    golang-go \
    python3-pip \
    terminator \
    htop \
    curl \
    scrot \
    texmaker \
	build-essential \
	cmake \
	python3-dev \
	python-dev \
	libgnome2-bin \
	awscli \
	docker.io \
	docker-compose \
	redis-tools \
	node-js \
	arandr

# install i3
/usr/lib/apt/apt-helper download-file http://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2018.01.30_all.deb keyring.deb SHA256:baa43dbbd7232ea2b5444cae238d53bebb9d34601cc000e82f11111b1889078a
dpkg -i ./keyring.deb
echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" >> /etc/apt/sources.list.d/sur5r-i3.list
apt update
apt install i3
mkdir ~/.i3
#cp /etc/i3/config ~/.i3/config
# Can now login under i3

# install vim from source
sudo apt install libncurses5-dev libgnome2-dev libgnomeui-dev \
	libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
	libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
	python3-dev ruby-dev lua5.1 liblua5.1-dev libperl-dev git
sudo apt remove vim vim-runtime gvim
cd ~
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
            --enable-multibyte \
	    --enable-rubyinterp=yes \
	    --enable-pythoninterp=yes \
	    --with-python-config-dir=/usr/lib/python2.7/config \ # pay attention here check directory correct
	    --enable-python3interp=yes \
	    --with-python3-config-dir=/usr/lib/python3.5/config \
	    --enable-perlinterp=yes \
	    --enable-luainterp=yes \
            --enable-gui=gtk2 \
            --enable-cscope \
	   --prefix=/usr/local
make VIMRUNTIMEDIR=/usr/local/share/vim/vim81
cd ~/vim
sudo make install
sudo update-alternatives --install /usr/bin/editor editor /usr/local/bin/vim 1
sudo update-alternatives --set editor /usr/local/bin/vim
sudo update-alternatives --install /usr/bin/vi vi /usr/local/bin/vim 1
sudo update-alternatives --set vi /usr/local/bin/vim
# finish install vim from source

# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# Install vim bundle YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe && ./install.py --all

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

wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash ~
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh ~

# Add configs
mkdir -p ~/.config
cp -r ~/GitHub/dotfiles/.config/flake8 ~/.config/flake8
cp -r ~/GitHub/dotfiles/.config/i3 ~/.config/i3/
cp -r ~/GitHub/dotfiles/.config/i3status ~/.config/i3status/
cp -r ~/GitHub/dotfiles/.config/i3/config ~/.i3/config

# Boot the Kernel with noresume parameter (faster)
cp ~/GitHub/dotfiles/etc/default/grub /etc/default/grub
update-grab

mkdir -p /etc/X11/xorg.conf.d/
cp ~/GitHub/dotfiles/etc/X11/xorg.conf.d/* /etc/X11/xorg.conf.d/

# Setup ssh
mkdir -p ~/.ssh/
cp ~/GitHub/dotfiles/.ssh/config ~/.ssh/
# Move id_rsa and id_rsa.pub files over to ~/.ssh
#cd ~/GitHub/dotfiles && git remote set-url origin git@github.com:WilliamQLiu/dotfiles.git

