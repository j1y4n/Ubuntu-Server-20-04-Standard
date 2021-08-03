#!/bin/sh
 
# Add additional repositories
#apt-add-repository ppa:tista/adapta # Adapta theme repo
#add-apt-repository ppa:papirus/papirus # Papirus icon theme repo
#add-apt-repository ppa:agornostal/ulauncher # Ulauncher repo
#add-apt-repository ppa:wereturtle/ppa # Ghostwriter repo
 
# Get the latest package lists
apt-get update
# Get DEB files
#wget https://prerelease.keybase.io/keybase_amd64.deb
#wget https://atom.io/download/deb/atom-amd64.deb
#wget https://launcher.mojang.com/download/Minecraft.deb
 
# Install from Repo
apt-get install fail2ban
apt-get install unattended-upgrades
apt-get install ufw
 
# Install DEB files
#dpkg -i keybase_amd64.deb
#dpkg -i atom-amd64.deb
#dpkg -i Minecraft.deb
#apt --fix-broken install -y # Fix Minecraft dependency issue.
 
# Clean up DEB files
#rm -f keybase_amd64.deb
 
# Install requirements
apt install python3
apt install python3-pip -y

# Fail2ban config
cp jail.local /etc/fail2ban/jail.local

# SSH config
cp sshd_config /etc/ssh/sshd_config

# UFW setup
ufw allow OpenSSH
ufw allow http
ufw allow https
ufw default allow outgoing
ufw default deny incoming

# Install Logwatch
apt-get install logwatch

# Add Admin User
useradd -m jiyan
usermod -aG root jiyan
mkdir /home/jiyan/.ssh
nano /home/jiyan/.ssh/authorized_keys
chown 700 /home/jiyan/.ssh/authorized_keys
chown -R jiyan:jiyan /home/jiyan
passwd jiyan

# Enable Services
systemctl enable fail2ban
systemctl status fail2ban
ufw enable
ufw status
service ssh restart

# Final message
echo All application have been installed, the script will now quit.
 
# Exit the script
exit 0