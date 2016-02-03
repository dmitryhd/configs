Ubuntu 14.03 building process
=============================

# Install skype first!
```
sudo dpkg --add-architecture i386
sudo add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
sudo apt-get update && sudo apt-get -y install skype
```

# essentials
```
sudo apt-get -y install vim git terminator zsh openjdk-7-jre openjdk-7-jdk tree screen google-chrome-stable sshfs
```

# graphics
```
sudo apt-get -y install compizconfig-settings-manager compiz-plugins-extra
sudo add-apt-repository ppa:numix/ppa
sudo apt-get update
sudo apt-get -y install numix-gtk-theme numix-icon-theme numix-icon-theme-circle
```

# work
```
sudo apt-get -y install network-manager-openvpn-gnome 
sudo apt-get -y install ntp mcelog pstack sysstat
```

# for python build
```
sudo apt-get -y install g++ gcc libssl-dev libsqlite3-dev libbz2-dev zlib1g zlib1g-dev libncurses5-dev libreadline6-dev ncurses-doc libblas-dev liblapack-dev libatlas-base-dev gfortran pygments unixODBC unixodbc-dev libpq-dev libpng-dev libfreetype6-dev
```
