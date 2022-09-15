#!/bin/bash

config_vim(){
	if [ -f ~/.vimrc ]; then
		mv ~/.vimrc ~/.vimrc_bak
	fi

	if [ -d ~/.vim ]; then
		mv ~/.vim ~/.vim_bak
	fi

	# 使用 ghproxy 做代理
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://ghproxy.com/https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

	sed -i 's/https:\/\/github\.com/https:\/\/ghproxy\.com\/https:\/\/github\.com/g' ~/.vim/autoload/plug.vim

	ln -sf $(pwd)/_vimrc ~/.vimrc

	echo vim配置成功！
	echo 首次启动 vim 的时候会有一些报错，因为相关插件未安装，需要执行命令 :PlugInstall
}

config_fish(){
	mkdir -p ~/.config/fish
	if [ -f ~/.config/fish/config.fish ]; then
		mv ~/.config/fish/config.fish ~/.config/fish/config.fish_bak
	fi
	ln -sf $(pwd)/config.fish ~/.config/fish/config.fish
	if [ -f ~/.config/fish/fish_variables ]; then
		mv ~/.config/fish/fish_variables ~/.config/fish/fish_variables_bak
	fi
	ln -sf $(pwd)/fish_variables ~/.config/fish/fish_variables
	echo fish 配置成功
}


while test $# -gt 0
do
	config_$1
	shift
done

