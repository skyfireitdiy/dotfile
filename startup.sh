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
SigLevel = TrustAll
EOF
'
	sudo sed 's/\[core\]/\0\nSigLevel = TrustAll/g' -i /etc/pacman.conf
	sudo sed 's/\[extra\]/\0\nSigLevel = TrustAll/g' -i /etc/pacman.conf
	sudo sed 's/\[community\]/\0\nSigLevel = TrustAll/g' -i /etc/pacman.conf
}

install_must_app() {
	sudo pacman -Sy
	sudo pacman -S archlinuxcn-keyring yay fakeroot
}

update() {
	yay -Su
}

install_normal_app() {
	yay -S fish neovim xmake fzf ranger make \
        lazygit tmux microsoft-edge-stable-bin \
        lantern-bin konsole helix fcitx-im \
        fcitx-configtool fcitx-sogoupinyin \
        ripgrep universal-ctags gcc nodejs xsel npm \
        go rustup fd icalingua++ linux-headers \
        vmware-workstation flameshot \
        p7zip wget aria2 unzip \
        wqy-zenhei wqy-microhei-lite wqy-microhei \
        wqy-bitmapfont nerd-fonts-complete \
        ueberzug ffmpegthumbnailer poppler epub-thumbnailer-git \
        clash net-tools
	sudo systemctl start vmware-networks
	sudo systemctl enable vmware-networks
	sudo systemctl start vmware-usbarbitrator
	sudo systemctl enable vmware-usbarbitrator
}

config(){
	chsh -s /usr/bin/fish
	sudo chsh -s /usr/bin/fish
	./install.sh fish tmux x vim konsole kitty alacritty hx i3 polybar fonts
    git remote set-url origin git@github.com:skyfireitdiy/dotfile.git
    git config --global core.editor nvim
    git config --global user.email skyfireitdiy@hotmail.com
    git config --global user.name skyfire
    git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
    git config --global alias.br branch
    git config --global alias.bra branch -a
    git config --global alias.co checkout
    git config --global alias.mg merge
    git config --global alias.cp cherry-pick
    git config --global alias.rb rebase
    git config --global pull.rebase true
    git config --global core.editor vim
}

install_all(){
    add_sudoer
    add_source
    install_must_app
    update
    install_normal_app
    config
}
