#!/bin/bash

add_sudoer() {
    sudo bash -c 'cat>>/etc/sudoers<<EOF
    skyfire ALL=(ALL:ALL) NOPASSWD: ALL
EOF
'
}

add_source() {
    sudo bash -c 'cat>>/etc/pacman.conf<<EOF
[archlinuxcn]
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/\$arch
SigLevel = Never
[blackarch]
Include = /etc/pacman.d/blackarch-mirrorlist
SigLevel = Never
EOF
'
sudo sed 's/\[core\]/\0\nSigLevel = Never/g' -i /etc/pacman.conf
sudo sed 's/\[extra\]/\0\nSigLevel = Never/g' -i /etc/pacman.conf
sudo sed 's/\[community\]/\0\nSigLevel = Never/g' -i /etc/pacman.conf
}

install_must_app() {
    sudo pacman -Sy
    sudo pacman -S --noconfirm archlinuxcn-keyring yay fakeroot
}

update() {
    yay -Su
}

install_normal_app() {
    yay -S --noconfirm fish neovim xmake fzf ranger w3m make  lazygit tmux  konsole fcitx-im  fcitx-configtool fcitx-sogoupinyin  ripgrep universal-ctags gcc nodejs xsel npm  go rustup fd linux-headers  vmware-workstation flameshot  p7zip wget aria2 unzip python-pynvim  wqy-zenhei wqy-microhei-lite wqy-microhei  wqy-bitmapfont nerd-fonts-complete  ueberzug ffmpegthumbnailer poppler epub-thumbnailer-git  clash net-tools wechat-uos reflector python-pip yarn witch python-jedi
    sudo systemctl start vmware-networks
    sudo systemctl enable vmware-networks
    sudo systemctl start vmware-usbarbitrator
    sudo systemctl enable vmware-usbarbitrator
}

config_fish(){
    chsh -s /usr/bin/fish
    sudo chsh -s /usr/bin/fish
}


config(){
    ./install.sh fish tmux x vim konsole kitty alacritty hx i3 polybar
    config_fish
}



install_all(){
    add_sudoer
    add_source
    install_must_app
    update
    install_normal_app
    config
}
