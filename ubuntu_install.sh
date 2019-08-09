#!/bin/sh
#-----install common software
sudo apt-get update
sudo apt-get install -y terminator vim meld gitk
sudo apt-get install -y vim
sudo apt-get install -y cscope ctags
sudo apt install android-tools-adb android-tools-fastboot
sudo apt-get install -y lzop
sudo dpkg -i google-chrome-stable_current_amd64.deb sogoupinyin_2.2.0.0102_amd64.deb
sudo apt-get -f install
#-----install android build essential
sudo apt-get install -y openjdk-8-jdk
sudo apt-get install -y git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache libgl1-mesa-dev libxml2-utils xsltproc unzip libssl-dev liblz4-tool
#-----configure usb
sudo cp -v 51-android.rules /etc/udev/rules.d/51-android.rules
sudo chmod a+r /etc/udev/rules.d/51-android.rules
groupdel adbusers
sudo mkdir -p /usr/lib/sysusers.d/ && sudo cp android-udev.conf /usr/lib/sysusers.d/
sudo groupadd adbusers
sudo usermod -a -G adbusers $(whoami)
sudo udevadm control --reload-rules
sudo service udev restart
#-----install repo
mkdir ~/bin
PATH=~/bin:$PATH
cp repo ~/bin/
chmod a+x ~/bin/repo
#-----install wine
sudo apt-get install -y wine
#-----install source insight
wine Si3583Setup.exe
#wine "c:\Program Files (x86)\Source Insight 3\Insight3.exe"

#-----install beyond compare
sudo apt-get install -y gdebi-core
sudo gdebi bcompare-4.2.4.22795_amd64.deb
#sudo apt-get remove bcompare

#-----install legacy open jdk
sudo add-apt-repository ppa:openjdk-r/ppa
sudo apt-get update
sudo apt-get install -y openjdk-7-jdk

#-----install cifs
sudo apt-get install -y cifs-utils

#-----install git
cp .gitconfig ~/
cp .gittemplate ~/

#-----config vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp .vimrc ~/
vim +PluginInstall +qall
sudo apt-get install -y cmake python-dev python3-dev
~/.vim/bundle/YouCompleteMe/install.py --clang-completer
cp .ycm_extra_conf.py ~/.vim/bundle/YouCompleteMe/


#choose right java version
#sudo update-alternatives --config java
#sudo update-alternatives --config javac
#sudo update-alternatives --config javadoc

#mount disk
#1. ls -l /dev/disk/by-uuid/
#2. vim /etc/fstab
#3. UUID=cdcbf9fe-65de-487f-aaca-591a014510d5 /home/bruce/sda ext4  errors=remount-ro 0     2
#4. sudo chown bruce:bruce /home/bruce/sda
#5. sudo mount -t cifs -w -o user=weicheng,dom=SENSETHINK,uid=1000,gid=0 //192.168.99.51/export/Weicheng/ ~/export/

#static ip
#sudo echo 'nameserver 192.168.99.201' > /etc/resolvconf/resolv.conf.d/base
#sudo vim /etc/network/interface
# iface eth0 inet static
# address 192.168.90.42
# gateway 192.168.90.1
# netmask 255.255.255.0

#For C2
sudo apt-get install -y libgcc-4.8-dev m4 make python-networkx bc
#For server(using ssh to connect)
#sudo local-gen zh
#echo 'export LANGUAGE=en' >> ~/.bashrc

