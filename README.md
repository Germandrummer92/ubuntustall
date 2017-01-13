# Ubuntstall

Small utility bash script I hacked together after managing to completely fry my Partition Table the other day and having 
reinstall every tool and setting up configs for a day I decided to script the entire thing.

Includes Installation of my most used tools and configs for my home as well as work setup.

Currently installed tools:

* [Yakuake](https://www.kde.org/applications/system/yakuake/) (Also changes Config to not use the default KDE Browser when 
clicking Links, see [StackOverflow Q](http://askubuntu.com/questions/62182/how-do-i-change-the-default-browser-that-konsole-opens-urls-with))
* [Oracle JDK PPA](https://launchpad.net/~webupd8team/+archive/ubuntu/java)
* [Git]()
* [Git-Crypt]()
* [Maven]()
* [Gradle]() installed using
* [SDKMan]()
* [ZSH]()
* [Oh-my-Zsh]()
* [Vim]()
* [Awesome VimRC]()
* [Antigen]()
* [IntelliJ Idea Community Edition]()
* [PyCharm Community Edition]()
* [NixNote]()
* [Spotify]()
* Configs with own customizations: sshconfig, keys, vimrc, zshrc

####Work-Configuration only:
* [Ansible]()
* 

List may get longer whenever I find Tools I actually use.

---

#Usage

For me to use the following way: Create key.key with symmetric persisted git-crypt key.
At __HOME:__
```bash
sh -c "sudo $(wget https://raw.githubusercontent.com/Germandrummer92/ubuntustall/master/ubuntstall.sh -O -) -ho"
```
At __WORK:__
```bash
sh -c "sudo $(wget https://raw.githubusercontent.com/Germandrummer92/ubuntustall/master/ubuntstall.sh -O -) -w"
```