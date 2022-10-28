
let mapleader=" " "映射leader键为空格

if index(keys(environ()), "LIGHT_VIM", 0, 1) == -1 
    let g:plug_url_format='https://ghproxy.com/https://github.com/%s'

    call plug#begin()  " 插件管理
    runtime plugins-common.vim
    runtime plugins-nvim.vim
    runtime plugins-vim.vim
    call plug#end()

    runtime mini.vim
    runtime which-key.vim
    runtime marks.vim
    runtime lsp_signature.vim
    runtime treesitter.vim
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
    runtime cpphighlight.vim
    runtime rainbow.vim
    runtime project.vim
    runtime colorscheme.vim
    runtime coc.vim
    runtime doxygen.vim
    runtime VimuxRunCommand.vim
    runtime easygrep.vim
    runtime wildfire.vim
    runtime zoom.vim 
    runtime yankround.vim
    runtime autoformat.vim
end


runtime custom.vim
runtime keybinding.vim