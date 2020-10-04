#!/bin/bash

##For debian only

user="$USER"
usermod -s  /bin/zsh $user
mv ./user_config/.zsh/ ~/
mv ./user_config/.zshrc ~/

if [ $user == "root" ]; then
    export LANGUAGE=ru_RU.UTF-8
    export LANG=ru_RU.UTF-8
    export LC_ALL=ru_RU.UTF-8
    dpkg-reconfigure locales
    echo 'LC_ALL=ru_RU.UTF-8' >> /etc/environment
    echo 'LANG=ru_RU.UTF-8' >> /etc/environment
    mv ./root_config/.zsh/ ~/
    mv ./root_config/.zshrc ~/
    chown -Rf root:root /root
fi

sudo systemctl enable qemu-guest-agent

##install P10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc

