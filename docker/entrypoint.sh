#!/bin/bash

install_dotfile(){
    if [ ! -d ~/.config/dotfile_installed ]; then
        if [ ! -d ~/code ]; then
            mkdir ~/code
        fi
        mkdir -p ~/.config/dotfile_installed
        git clone https://ghproxy.com/https://github.com/skyfireitdiy/dotfile ~/code/dotfile
        cd ~/code/dotfile
        # 此处增加需要安装的软件
        ./install.sh vim
    fi
}

install_dotfile

cd ~
$@
