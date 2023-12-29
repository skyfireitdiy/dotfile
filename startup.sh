#!/bin/bash

add_sudoer() {
    user=$(whoami)
    sudo bash -c "cat>>/etc/sudoers<<EOF
    $user ALL=(ALL:ALL) NOPASSWD: ALL
EOF
"
}

add_source() {
    sudo ./install.sh pacman
}

install_must_app() {
    sudo pacman -Sy
    sudo pacman -S --noconfirm archlinuxcn-keyring yay fakeroot
}

update_system() {
    yay -Su
}

install_normal_app() {
    sudo ./install.sh pacman
    yay -S --noconfirm fish neovim fzf ranger w3m make  lazygit tmux  ibus ibus-libpinyin  ripgrep universal-ctags gcc nodejs xsel npm  go rustup fd linux-headers flameshot  p7zip wget aria2 unzip python-pynvim  wqy-zenhei wqy-microhei-lite wqy-microhei  wqy-bitmapfont nerd-fonts-complete  ueberzug ffmpegthumbnailer poppler epub-thumbnailer-git net-tools reflector python-pip yarn witch python-jedi clash microsoft-edge-stable-bin zellij bluez bluez-utils blueman pulseaudio-bluetooth pavucontrol obs-studio pasystray
}


config_fish(){
    chsh -s /usr/bin/fish
    sudo chsh -s /usr/bin/fish
}

config_bluez(){
    sudo systemctl enable bluetooth
}

config(){
    ./install.sh fish tmux x vim konsole kitty alacritty hx i3 polybar
    config_fish
    config_bluez
}



install_all(){
    add_sudoer
    add_source
    install_must_app
    update_system
    install_normal_app
    config
}
