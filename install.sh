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
}


config_vim(){

	bak_config ~/.config/nvim
	bak_config ~/.vim

	mkdir -p ~/.config
	mkdir -p ~/.vim

	# 使用 ghproxy 做代理
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		https://ghproxy.com/https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

	replace_config ~/.config/nvim $(pwd)/vim/nvim


	# 配置vim
	replace_config ~/.vim/autoload ~/.local/share/nvim/site/autoload
	replace_config ~/.vimrc ~/.config/nvim/init.vim
	replace_config ~/.vim/plugins.vim ~/.config/nvim/plugins.vim
	replace_config ~/.vim/coc-settings.json ~/.config/nvim/coc-settings.json 

	nvim --version 2>/dev/null
	if [ $? -eq 0 ]; then
		nvim -c PlugInstall -u ~/.config/nvim/plugins.vim 
	fi

	vim --version 2>/dev/null
	if [ $? -eq 0 ]; then
		vim -c PlugInstall -u ~/.vim/plugins.vim
	fi

	echo [n]vim配置成功！
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

config_emacs(){
	replace_config ~/.emacs.d $(pwd)/_emacs.d
	replace_config ~/.spacemacs $(pwd)/_spacemacs
	echo emacs配置成功！
}

config_i3() {
	replace_config ~/.config/i3 $(pwd)/i3
	replace_config ~/.config/i3status $(pwd)/i3status
	echo i3 配置成功!
}

config_konsole() {
	replace_config ~/.local/share/konsole/skyfire.profile $(pwd)/skyfire.profile
	echo konsole 配置成功！
}

config_kitty() {
	replace_config ~/.config/kitty $(pwd)/kitty 
	echo kitty 配置成功！
}

config_fonts() {
	mkdir -p ~/.fonts
	curr=`pwd`
	cd ~/.fonts
	unzip $curr/fonts.zip
	sudo fc-cache -fv ~/.fonts
	echo 字体安装成功！
}

while test $# -gt 0
do
	config_$1
	shift
done

