#!/bin/bash

bak_config() {
	old_config=$1
	bak_config=${1}_bak
	if [ -f $bak_config ] || [ -d $bak_config ]; then
		echo "删除旧的备份文件" $bak_config
		rm -rf $bak_config
	fi
	if [ -f $old_config ] || [ -d $old_config ] ; then
		mv $old_config ${old_config}_bak
		echo "备份$old_config 到 ${old_config}_bak"
	fi
}

replace_config() {
	old_config=$1
	new_config=$2
	bak_config $old_config
	ln -sf $new_config $old_config
	echo "软链接 $old_config 到 $new_config"
}

config_alacritty() {
	replace_config ~/.config/alacritty $(pwd)/alacritty
	echo "alacritty 安装完成！"
}

config_polybar() {
	replace_config ~/.config/polybar $(pwd)/polybar
	echo "polybar 安装完成！"
}

config_vim(){

	bak_config ~/.config/nvim
	bak_config ~/.local/share/nvim/site
	bak_config ~/.vim
	bak_config ~/.vimrc

	rm -rf ~/.config/nvim ~/.local/share/nvim/site ~/.vim ~/.vimrc

	mkdir -p ~/.config
	mkdir -p ~/.vim
	mkdir -p ~/.local/share

	replace_config ~/.config/nvim $(pwd)/vim/nvim
	replace_config ~/.vimrc ~/.config/nvim/init.vim

	nvim --version 2>/dev/null
	if [ $? -eq 0 ]; then
		nvim
	else
		vim --version 2>/dev/null
		if [ $? -eq 0 ]; then
			vim
		fi
	fi

	echo "[n]vim配置成功！"
}


config_fish(){
	mkdir -p ~/.config
	replace_config ~/.config/fish $(pwd)/fish
	echo fish 配置成功
}


config_tmux(){
	bak_config ~/.tmux
	git clone https://ghproxy.com/https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	replace_config ~/.tmux.conf $(pwd)/_tmux.conf
	echo tmux配置成功！
}

config_i3() {
	replace_config ~/.config/i3 $(pwd)/i3
	replace_config ~/.config/polybar $(pwd)/polybar
	echo i3 配置成功!
}

config_kitty() {
	replace_config ~/.config/kitty $(pwd)/kitty
	echo kitty 配置成功!
}

config_konsole() {
	replace_config ~/.local/share/konsole/skyfire.profile $(pwd)/skyfire.profile
	echo konsole 配置成功！
}

config_x() {
	replace_config ~/.xprofile $(pwd)/_xprofile
	echo x 配置成功！
}


config_hx() {
	replace_config ~/.config/helix/config.toml $(pwd)/helix/config.toml
	echo hx 配置成功！
}

while test $# -gt 0
do
	config_$1
	shift
done

