# Ubuntstall

Small utility bash script I hacked together after managing to completely fry my Partition Table the other day and having 
reinstall every tool and setting up configs for a day I decided to script the entire thing.

Includes Installation of my most used tools and configs for my home as well as work setup.

Currently installed tools:

* [Yakuake](https://www.kde.org/applications/system/yakuake/) (Also changes Config to not use the default KDE Browser when 
clicking Links, see [StackOverflow Q](http://askubuntu.com/questions/62182/how-do-i-change-the-default-browser-that-konsole-opens-urls-with))
* [Oracle JDK PPA](https://launchpad.net/~webupd8team/+archive/ubuntu/java)
* [Git](https://git-scm.com/)
* [Git-Crypt](https://github.com/AGWA/git-crypt)
* [Maven](https://maven.apache.org/)
* [Gradle](https://gradle.org/) installed using
* [SDKMan](http://sdkman.io/)
* [ZSH](http://zsh.sourceforge.net/)
* [Oh-my-Zsh](https://github.com/robbyrussell/oh-my-zsh)
* [Vim](http://www.vim.org/)
* [Awesome VimRC](https://github.com/amix/vimrc)
* [Antigen](https://github.com/zsh-users/antigen)
* [IntelliJ Idea Community Edition](https://www.jetbrains.com/idea/)
* [NixNote](https://sourceforge.net/projects/nevernote/)
* [Spotify](https://www.spotify.com/de/)
* Configs with own customizations: sshconfig, keys, vimrc, zshrc

####Work-Configuration only:
* [Ansible](https://www.ansible.com/)

####Home-Configuration only:
* [PyCharm Community Edition](https://www.jetbrains.com/pycharm/)


List may get longer whenever I find Tools I actually use.

---

#Usage

For me to use the following way: 

1. Create key.key with symmetric persisted git-crypt key.

2. Run Script:
  
At __HOME:__
```bash
sh -c "sudo $(wget https://raw.githubusercontent.com/Germandrummer92/ubuntustall/master/ubuntstall.sh -O -) -ho"
```
At __WORK:__
```bash
sh -c "sudo $(wget https://raw.githubusercontent.com/Germandrummer92/ubuntustall/master/ubuntstall.sh -O -) -w"
```