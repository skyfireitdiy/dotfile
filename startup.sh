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
    add_source
    sudo pacman -S --noconfirm archlinuxcn-keyring yay fakeroot debugedit
}

update_system() {
    add_source
    sudo pacman -Sy
    sudo pacman -Su --noconfirm
}

install_normal_app() {
    sudo ./install.sh pacman
    yay -S --noconfirm fish neovim fzf ranger w3m make  lazygit tmux  ripgrep universal-ctags gcc nodejs xsel npm  go rustup fd linux-headers p7zip wget aria2 unzip python-pynvim  ueberzug ffmpegthumbnailer poppler epub-thumbnailer-git net-tools reflector python-pip yarn witch python-jedi zellij eza docker docker-compose
}

install_gui_app() {
    yay -S --noconfirm ibus ibus-libpinyin flameshot wqy-zenhei wqy-microhei-lite wqy-microhei  wqy-bitmapfont ttf-sourcecodepro-nerd ttf-firacode-nerd debugedit microsoft-edge-stable-bin bluez bluez-utils blueman pulseaudio-bluetooth pavucontrol obs-studio pasystray bat
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

config_docker() {
    sudo usermod -aG docker $(whoami)
}

config(){
    ./install.sh fish tmux x vim konsole kitty alacritty hx i3 polybar pypi ranger
    config_fish
    config_bluez
    config_ntp
    config_docker
}



install_all(){
    add_sudoer
    add_source
    update_system
    install_must_app
    install_normal_app
    config
}
