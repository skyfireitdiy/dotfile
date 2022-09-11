#!/bin/bash

if [ -f ~/.vimrc ]; then
	mv ~/.vimrc ~/.vimrc_bak
	echo ~/.vimrc 被备份到 ~/.vimrc_bak
fi

if [ -d ~/.vim ]; then
	mv ~/.vim ~/.vim_bak
	echo ~/.vim 被备份到 ~/.vim_bak
fi

echo 安装 vim-plug ...
# 使用 ghproxy 做代理
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://ghproxy.com/https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


echo 创建软链接 $(pwd)/_vimrc -> ~/.vimrc
ln -sf $(pwd)/_vimrc ~/.vimrc

echo 安装成功！
echo 首次启动 vim 的时候会有一些报错，因为相关插件未安装，需要执行命令 :PlugInstall

