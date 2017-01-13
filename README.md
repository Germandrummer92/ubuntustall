# Ubuntstall

Curated list by me and installation script of productivity tools/configs. Mostly using java atm, so definitely a bias for java tools.

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


List may always get longer.

---

#Usage

For _me_ to use the following way: 

1. Create key.key with symmetric persisted git-crypt key.

2. Run Script:
  
At __HOME:__
```bash
sudo -E sh -c  "curl https://raw.githubusercontent.com/Germandrummer92/ubuntustall/master/ubuntstall.sh | bash -s -- -ho"```
```
At __WORK:__
```bash
sudo -E sh -c  "curl https://raw.githubusercontent.com/Germandrummer92/ubuntustall/master/ubuntstall.sh | bash -s -- -w"```
```
#Development/Usage for Others

Tested on fresh Ubuntu 16.1 install/VM.

Easiest way:

(Installs all the tools listed above aside from PyCharm, Ansible and my personal configs.)

```bash
sudo -E sh -c  "curl https://raw.githubusercontent.com/Germandrummer92/ubuntustall/master/ubuntstall.sh | bash -s -- -o"
```

Harder Way with own persisted configs/keys:

After the easy way is setup you can [fork](https://help.github.com/articles/fork-a-repo/) me and setup your
own settings persistence repo the following way:

1. Clone your Repo then git-crypt it and remove my old encrypted configs
```bash
rm files/*
git-crypt init
```
2. Write a symmetric key file to ~/key.key (or a different path and adjust key path at beginning of script) or a gpg key, but then be aware script needs changing
```bash
git-crypt export-key ~/key.key
```
3. Test if git-crypt works by committing and pushing a test file in the files folder
```bash
touch files/test
echo "test" >> files/test
git add -A
git commit -m "Testing git-crypt"
git push 
```
4. Checkout your repo in Github to see if test file is gibberish, if yes add own config files and commit and push
   Be aware my setup had files called like this, and different file names in repo require changing of script.

   
```project
└───files
|   | .vimrc (vim config)
|   | .zshrc (zsh config)
|   | idh (private rsa key)
|   | idH.pub (public rsa key)
|   | sshconfighome (sshconfig home)
```

---

#Found a tool you think I should try?

PR me including the installation in the script and I will take a look at it.