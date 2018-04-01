#!/bin/bash
#google colab script

#update password
passwd << EOF
abc
abc
EOF
echo "password updated"

#update ssh server
apt install openssh-server
wget https://raw.githubusercontent.com/ngocminhbui/myconfig/master/sshd_config -O /etc/ssh/sshd_config
service ssh start

echo "service started"
#download ngrok 
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
unzip ngrok-stable-linux-amd64.zip
./ngrok authtoken 89q145tmAsh3xDCx969BT_4yFHqokA3VxfHqgadwpxA
./ngrok tcp 22  > logngrok.txt &

echo "ngrok stated"
#export env path
echo 'export PATH=/opt/bin:/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/tools/node/bin:/tools/google-cloud-sdk/bin' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/lib64-nvidia'>> ~/.bashrc
echo 'export PYTHONPATH=/env/python'>> ~/.bashrc

echo "exported"

#install libs.

apt install sudo
sudo apt install software-properties-common
sudo apt install vim tmux
sudo apt install fuse
sudo apt install psmisc
sudo add-apt-repository ppa:alessandro-strada/ppa
sudo apt update
sudo apt install google-drive-ocamlfuse

echo "installed libs"
