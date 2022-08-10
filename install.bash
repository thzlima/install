#!/bin/bash

# Update Drivers
sudo apt-get update

# Basic Packages
sudo apt-get install curl build-essential apt-transport-https lsb-release ca-certificates gnupg software-properties-common wget gpg -y

# Install Git
if ! command -v git &> /dev/null;
then
    # 
    echo -n "Qual seu nome? "
    read -r name
    # 
    echo -n "Qual o seu e-mail? "
    read -r email
    #
    sudo apt-get install git -y
    # 
    git config --global user.name $name
    # 
    git config --global user.email $email
    # 
    git config --global credential.helper store
    # 
    echo "Olá $name, seu git já está configurado no e-mail $email"
fi

# Install Node
if ! command -v node &> /dev/null;
then
    # 
    curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
    # 
    sudo apt-get install nodejs -y
fi

# Install Yarn
if ! command -v yarn &> /dev/null;
then
    #
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    #
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
    #
    sudo apt-get update
    #
    sudo apt-get install yarn -y
fi

# Install Docker
if ! command -v docker &> /dev/null;
then
    #
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    #
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    focal stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    #
    sudo apt-get update
    #
    sudo apt-get install docker-ce docker-compose -y
    #
    sudo usermod -aG docker ${USER}
    #
    sudo chmod 666 /var/run/docker.sock
fi

# Install PHP
if ! command -v php &> /dev/null;
then
    # 
    sudo add-apt-repository ppa:ondrej/php
    # 
    sudo apt-get update
    # 
    sudo apt-get install php7.4-{cli,soap,xml,mbstring,curl} -y
    # 
    # sudo apt-get install php8.1-{cli,soap,xml,mbstring,curl} -y
    # 
    # sudo update-alternatives --config php
fi

# Install Composer
if ! command -v composer &> /dev/null;
then
    # 
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
    # 
    php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
    # 
    php composer-setup.php
    # 
    php -r "unlink('composer-setup.php');"
    # 
    sudo mv composer.phar /usr/local/bin/composer
fi

sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get autoremove -y

# Install VsCode
if ! command -v code &> /dev/null;
then
    #
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    #
    sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
    #
    sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
    #
    rm -f packages.microsoft.gpg
    #
    sudo apt-get update
    #
    sudo apt-get install code -y
fi

# Install Python
if ! command -v python &> /dev/null;
then
    #
    sudo apt-get install python3 python3-pip python-is-python3 -y
fi

# Install Insomnia
if ! command -v insomnia &> /dev/null;
then
    #
    wget -c https://updates.insomnia.rest/downloads/ubuntu/latest -O insomnia.deb
    #   
    sudo dpkg -i insomnia.deb
    #
    sudo apt-get install -f -y
    #
    sudo rm insomnia.deb
fi

# Install Dbeaver
if ! command -v dbeaver-ce &> /dev/null;
then
    #
    sudo add-apt-repository ppa:serge-rider/dbeaver-ce
    #
    sudo apt-get install dbeaver-ce
fi

# Install Terminator
if ! command -v terminator &> /dev/null;
then
    #
    sudo add-apt-repository ppa:gnome-terminator/nightly-gtk3
    #
    sudo apt-get update
    #
    sudo apt-get install terminator
fi

# Install Google Chorme
if ! command -v google-chrome &> /dev/null;
then
    # 
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_$(dpkg --print-architecture).deb
    # 
    sudo dpkg -i google-chrome-stable_current_$(dpkg --print-architecture).deb
    # 
    sudo apt-get install -f -y
    # 
    sudo rm google-chrome-stable_current_$(dpkg --print-architecture).deb
fi

# Install Discord
if ! command -v discord &> /dev/null;
then
    #    
    wget -c "https://discordapp.com/api/download?platform=linux&format=deb" -O discord.deb
    # 
    sudo dpkg -i discord.deb
    # 
    sudo apt-get install -f -y
    # 
    sudo rm discord.deb
fi

# Install OpenVPN
if ! command -v openvpn &> /dev/null;
then
    sudo apt-get install openvpn
fi