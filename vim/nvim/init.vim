
let mapleader=" " "映射leader键为空格

let g:light_vim = 1
if index(keys(environ()), "LIGHT_VIM", 0, 1) == -1
	let g:light_vim = 0
endif

" 以下是通用的配置
runtime plugins.vim

runtime custom.vim
runtime keybinding.vim

runtime mini.vim
runtime which-key.vim
runtime marks.vim
runtime lazygit.vim
runtime tmux.vim
runtime vista.vim
runtime airline-theme.vim
runtime gitsigns.vim
runtime gitgutter.vim
runtime choosewin.vim
runtime fzf.vim
runtime tagbar.vim
runtime visual-cursor.vim
runtime rainbow.vim
runtime project.vim
runtime colorscheme.vim
runtime doxygen.vim
runtime VimuxRunCommand.vim
runtime easygrep.vim
runtime wildfire.vim
runtime zoom.vim
runtime yankround.vim
runtime coc.vim
runtime autoformat.vim

" 以下是完整功能配置
if g:light_vim == 0
	runtime treesitter.vim
	runtime lsp_signature.vim
	runtime cpphighlight.vim
endif


