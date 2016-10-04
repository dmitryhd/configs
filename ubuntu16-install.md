sudo add-apt-repository universe
sudo apt-get update
sudo apt-get upgrade
sudo apt-get -y install vim git terminator zsh openjdk-7-jre openjdk-7-jdk tree screen google-chrome-stable sshfs
libgconf2-4 libnss3-1d libxss1 network-manager-openvpn-gnome unity-tweak-tool compizconfig-settings-manager compiz-plugins-extra

sudo apt-get -y install g++ gcc libssl-dev libsqlite3-dev libbz2-dev zlib1g zlib1g-dev libncurses5-dev libreadline6-dev ncurses-doc libblas-dev liblapack-dev libatlas-base-dev gfortran unixodbc-dev libpq-dev libpng-dev libfreetype6-dev

sudo bash ./Downloads/NVIDIA-Linux-x86_64-367.44.run 
sudo add-apt-repository ppa:numix/ppa
sudo apt-get update
numix-gtk-theme numix-icon-theme numix-icon-theme-circle
zsh

sudo apt-get purge nvidia*
sudo apt-get purge noveau
sudo update-initramfs -u
sudo service lightdm stop
sudo bash ./Downloads/NVIDIA-Linux-x86_64-367.44.run 
sudo reboot
mkdir ~/build
cd build/

BACK_DIR=/media/dkhodakov/aaa/

cp -rv google-chrome/ ~/.config/
cp -rv compiz-1/ ~/.config/
cp -rv sublime-text-3/ ~/.config/
cp -rv terminator/ ~/.config/

cp bashrc ~/.bashrc 

cp -r onfigs/ ~/repos/configs

unity-tweak-tool 

sudo apt -y install python3-pip
pip3 install pandas sklearn 'ipython[all]' 'jupyter[all]' matplotlib seaborn pip nose coverage pytest nltk pymorphy2 pyodbc psycopg2 redis virtuaenv virtualenvwrapper --user 

wget https://www.jetbrains.com/pycharm/download/download-thanks.html?platform=linux&code=PCC 
cp -r repos/configs/.oh-my-zsh/ ~/
cp -r repos/configs/.zshrc ~/

chsh /bin/zsh

google-chrome-stable_current_amd64.deb

chsh


# ssh
# vpn
