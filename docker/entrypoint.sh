#!/bin/bash

install_vim(){
    if [ ! -d ~/.config/nvim ]; then
        cd /dotfile
        ./install.sh vim
    fi
}

install_vim

fish
