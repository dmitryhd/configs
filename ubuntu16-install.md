# Base

```
sudo apt-get update && sudo apt-get upgrade && sudo apt-get -y install aptitude
sudo apt-get -y install g++ gcc
chsh -s /usr/bin/zsh
```

Fire up "User Accounts", set "automatic login" to "off". At startup you will be asked your user/password only once; popups like "unlock keyring" will never pester you again.
sudo visudo
%admin  ALL=(ALL) NOPASSWD:ALL


# Dev
```
sudo apt-get -y install \
  vim git zsh tree screen htop sshfs \
  terminator openjdk-7-jre openjdk-7-jdk  \  # 
  libgconf2-4 libnss3-1d libxss1 network-manager-openvpn-gnome 

 libssl-dev libsqlite3-dev libbz2-dev zlib1g zlib1g-dev libncurses5-dev libreadline6-dev ncurses-doc libblas-dev liblapack-dev libatlas-base-dev gfortran unixodbc-dev libpq-dev libpng-dev libfreetype6-dev build-essential zlib1g-dev libbz2-dev libncurses5-dev libreadline6-dev libsqlite3-dev libssl-dev libgdbm-dev liblzma-dev
```

# python
```
sudo apt-get -y install virtualenvwrapper
```

# Fancy desktop
```
sudo add-apt-repository ppa:numix/ppa
sudo apt-get update
sudo aptitude install \
  numix-gtk-theme numix-icon-theme numix-icon-theme-circle \
  unity-tweak-tool compizconfig-settings-manager compiz-plugins-extra
  
sudo add-apt-repository ppa:peterlevi/ppa
sudo apt-get update && sudo apt-get install variety
```

# Nvidia desktop
```
sudo service lightdm stop
# install 16
sudo reboot
```
```
cp -rv google-chrome/ ~/.config/
cp -rv compiz-1/ ~/.config/
cp -rv sublime-text-3/ ~/.config/
cp -rv terminator/ ~/.config/
cp bashrc ~/.bashrc 

sudo apt -y install python3-pip
pip3 install pandas sklearn 'ipython[all]' 'jupyter[all]' matplotlib seaborn pip nose coverage pytest nltk pymorphy2 pyodbc psycopg2 redis virtuaenv virtualenvwrapper --user 

```
