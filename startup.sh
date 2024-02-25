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
    sudo pacman -Su --noconfirm
}

install_normal_app() {
    sudo ./install.sh pacman
    yay -S --noconfirm fish neovim fzf ranger w3m make  lazygit tmux  ripgrep universal-ctags gcc nodejs xsel npm  go rustup fd linux-headers p7zip wget aria2 unzip python-pynvim  ueberzug ffmpegthumbnailer poppler epub-thumbnailer-git net-tools reflector python-pip yarn witch python-jedi zellij 
}

install_gui_app() {
    yay -S --noconfirm ibus ibus-libpinyin flameshot wqy-zenhei wqy-microhei-lite wqy-microhei  wqy-bitmapfont nerd-fonts-complete clash microsoft-edge-stable-bin bluez bluez-utils blueman pulseaudio-bluetooth pavucontrol obs-studio pasystray bat
}


config_fish(){
    chsh -s /usr/bin/fish
    sudo chsh -s /usr/bin/fish
}

config_bluez(){
    sudo systemctl enable bluetooth
}

config_ntp() {
    sudo timedatectl set-timezone Asia/Shanghai
    sudo timedatectl set-ntp true
}

config(){
    ./install.sh fish tmux x vim konsole kitty alacritty hx i3 polybar
    config_fish
    config_bluez
    config_ntp
}



install_all(){
    add_sudoer
    add_source
    install_must_app
    update_system
    install_normal_app
    config
}
