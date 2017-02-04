# Base

```
sudo apt update && sudo apt upgrade && sudo apt -y install aptitude
sudo apt -y install g++ gcc vim git zsh tree screen htop sshfs terminator
chsh -s /usr/bin/zsh
```
```
sudo visudo
%admin  ALL=(ALL) NOPASSWD:ALL
```

# Dev
```
sudo apt -y install \
  libgconf2-4 libnss3-1d libxss1 network-manager-openvpn-gnome \
 libssl-dev libsqlite3-dev libbz2-dev zlib1g zlib1g-dev libncurses5-dev libreadline6-dev ncurses-doc libblas-dev liblapack-dev libatlas-base-dev gfortran unixodbc-dev libpq-dev libpng-dev libfreetype6-dev build-essential zlib1g-dev libbz2-dev libncurses5-dev libreadline6-dev libsqlite3-dev libssl-dev libgdbm-dev liblzma-dev
```

# python
```
sudo apt -y install virtualenvwrapper
```

# Fancy desktop
```
sudo add-apt-repository ppa:numix/ppa

sudo apt update
sudo aptitude install \
  numix-gtk-theme numix-icon-theme numix-icon-theme-circle \
  unity-tweak-tool compizconfig-settings-manager compiz-plugins-extra
  
sudo add-apt-repository ppa:peterlevi/ppa

sudo apt-get update && sudo apt-get install variety
```

# Wifi problems fix
```
sudo gedit /etc/pm/config.d/config
SUSPEND_MODULES="iwlwifi"
```

# Console fonts
```
sudo vim /etc/default/grub
sudo update-grub2
```

# Nvidia desktop
```
sudo service lightdm stop
# install 16
sudo reboot
```
```
sudo apt -y install python3-pip
pip3 install pandas sklearn 'ipython[all]' 'jupyter[all]' matplotlib seaborn pip nose coverage pytest nltk pymorphy2 pyodbc psycopg2 redis virtuaenv virtualenvwrapper --user 

```
