#!/bin/bash

set -x

pkg="fzf lazygit ripgrep fd universal-ctags gcc nodejs npm python python-pip yarn gtk3 glib2 webkit2gtk-4.1 libsoup3 rustup"
yay -Ql $pkg
if [ $? -ne 0 ]; then
    yay -S --noconfirm $pkg
fi

echo "[vim ok]"
