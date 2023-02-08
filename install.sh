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

	rm -rf ~/.config/nvim ~/.local/share/nvim/site

	mkdir -p ~/.config
	mkdir -p ~/.local/share

	replace_config ~/.config/nvim $(pwd)/vim/nvim

	nvim --version 2>/dev/null
	if [ $? -eq 0 ]; then
		nvim
	fi

	echo "nvim配置成功！"
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
	replace_config ~/.local/share/konsole $(pwd)/konsole
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

config_rime() {
	replace_config ~/.config/fcitx5/rime/default.custom.yaml $(pwd)/rime/default.custom.yaml
	replace_config ~/.config/fcitx5/rime/luna_pinyin_simp.custom.yaml $(pwd)/rime/luna_pinyin_simp.custom.yaml
	replace_config ~/.config/fcitx5/rime/weasel.custom.yaml $(pwd)/rime/weasel.custom.yaml
	replace_config ~/.config/fcitx5/rime/sogoupinyin.dict.yaml $(pwd)/rime/sogoupinyin.dict.yaml
	echo "rime 配置完成"
}

config_ranger() {
    replace_config ~/.config/ranger $(pwd)/ranger
    echo "ranger 配置完成"
}

while test $# -gt 0
do
	config_$1
	shift
done

