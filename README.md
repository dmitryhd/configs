# Configuration files

All config files written by myself or taken from other authors.

This repo contains configs for:
- **Awesome wm**
- **Vim**
- **Zsh**
- **Bash**
- **Git**
- **Conky**


To install all configs on you system execute:

**`$ ./config_deploy.sh`**

To commit all configs this repo execute:

**`$ ./config_upload.sh`**


Ubuntu 14.03 building process
=============================


```
# essentials
sudo apt-get install vim git terminator zsh openjdk-7-jre openjdk-7-jdk tree screen google-chrome-stable sshfs

# graphics
sudo apt-get install compizconfig-settings-manager compiz-plugins-extra
sudo add-apt-repository ppa:numix/ppa
sudo apt-get update
sudo apt-get install numix-gtk-theme numix-icon-theme numix-icon-theme-circle
# work
sudo apt-get install network-manager-openvpn-gnome 

# for python build
sudo apt-get install g++ gcc libssl-dev libsqlite3-dev libbz2-dev zlib1g zlib1g-dev libncurses5-dev libreadline6-dev ncurses-doc``
libblas-dev liblapack-dev libatlas-base-dev gfortran pygments unixODBC unixodbc-dev libpq-dev libpng-dev libfreetype6-dev

```



