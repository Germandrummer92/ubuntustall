#!/bin/bash
# Author: Daniel Draper
# Date: 1/11/2017
# This script installs my work/home pc with my preferred settings/tools
# See README.md for easiest usage
ideaV="2016.3.2"
pycharmV="2016.3.2"
keyPath="${HOME}/key.key"
gradleV=3.3

if [ "$0" = "home" ] || [ "$0" = "-ho" ] ; then
    ENV=0
else
    if [ "$0" = "work" ] || [ "$0" = "-w" ] ; then
        ENV=1
    fi
    if [ "$0" = "help" ] || [ "$0" = "-h" ] ; then
    echo "USAGE: ubuntustall.sh work | home"
    exit 0
    else
        echo "Wrong Parameter Entered, see https://github.com/Germandrummer92/ubuntustall/README.md for Usage Help"
        exit 1
    fi
fi

echo "Starting Ubuntustall"

# Create Temporary directory for temp files/git-crypt
mkdir ~/tmp
mkdir ~/git-crypt
# Install prerequisites

echo "Installing Prerequisites"
apt-get update
apt-get -y upgrade
apt-get -y install zsh python git mvn  vim make g++ libssl-dev openssl yakuake ssh firefox python-simplejson

#Fix Yakuake browser http://askubuntu.com/questions/62182/how-do-i-change-the-default-browser-that-konsole-opens-urls-with
echo "[General]" >> ~/.kde/share/config/kdeglobals
echo "BrowserApplication[$e]=!firefox" >> ~/.kde/share/config/kdeglobals

#Install Gradle using SDKMan
echo "Installed Prerequisites, on to Gradle, so first get SDKMan"
curl -s https://get.sdkman.io | bash
echo "Then gradle itself"
sdk install gradle ${gradleV}

# Install and Setup git-crypt to get encrypted .rc files
echo "Installing Git-Crypt to later get .rc files"
git clone https://github.com/AGWA/git-crypt.git ~/git-crypt
cd ~/git-crypt || exit
make
make install
cd ~ || exit

echo "Installing Oh my Zsh!"
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

echo "Installing Antigen"
curl https://cdn.rawgit.com/zsh-users/antigen/v1.3.2/bin/antigen.zsh > ~/antigen.zsh

echo "Installing Awesome Vimrc"
git clone https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

echo "Getting own .rc files"
cd ~/tmp/ || exit
git clone https://github.com/Germandrummer92/ubuntustall.git
cd ubuntustall || exit
git-crypt unlock "${keyPath}"

cp files/.zshrc ~
cp files/.vimrc ~
if [ ${ENV} == 0 ] ; then
    cp files/sshconfighome ~/.ssh/config
    cp files/idH ~/.ssh/id_rsa
    cp files/idH.pub ~/.ssh/id_rsa.pub
fi
cd ~ || exit

# Add PPA for Oracle JDK and install the newest version
echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee /etc/apt/sources.list.d/webupd8team-java.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
apt-get update
apt-get install oracle-java8-installer

echo "Downloading IntelliJ Community Edition, might take a while"
wget https://download.jetbrains.com/idea/${ideaV}.tar.gz -O ~/tmp/idea.tar.gz

echo "Unpacking IntelliJ to HomeDirectory"
tar -xvf ~/tmp/idea.tar.gz ~


# Only install at Home
if [ ${ENV} == 0 ] ; then
    echo "Downloading PyCharm, might take a while"
    wget https://download.jetbrains.com/python/pycharm-community-${pycharmV}.tar.gz -O ~/tmp/pycharm.tar.gz
    echo "Unpacking PyCharm to HomeDirectory"
    tar -xvf ~/tmp/pycharm.tar.gz ~
fi

echo "Install Spotify"
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
apt-get update
apt-get install spotify

if [ ${ENV} == 0 ] ; then
    echo "Installing Ansible if Work Config "
    git clone git://github.com/ansible/ansible.git --recursive
    cd ./ansible || exit
    # Also add to .zshrc
    source ./hacking/env-setup -q
    easy_install pip
    pip install paramiko PyYAML Jinja2 httplib2 six
    git pull --rebase
fi

echo "Install NixNote"
add-apt-repository ppa:nixnote/nixnote2-daily
apt update
apt install nixnote2

echo "FINISHED INSTALLATION, EXITING!"
exit 0