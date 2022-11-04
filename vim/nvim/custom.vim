
" 自动格式化会将EOF缩进，这样就有问题了，此处将缩进去除
function! RepairVimScript()
	%s/^\s*lua << EOF/lua << EOF/g
	%s/^\s*EOF/EOF/g
endfunction


augroup autoRunGroup
	autocmd!
	autocmd BufLeave * stopinsert
	autocmd InsertEnter * :set norelativenumber
	autocmd InsertLeave * :set relativenumber
	autocmd BufWritePost *vimrc :source ~/.vimrc
	" autocmd BufEnter * :set nomodifiable
augroup END


set nobackup
set nowritebackup
set updatetime=300
set signcolumn=yes
set showcmd
set nu
set autoread
set autowriteall
set ignorecase smartcase
set incsearch
"set hlsearch
set cmdheight=1
set cursorline cursorcolumn
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set nocompatible
set nowrap
set ruler
set rulerformat=%15(%c%V\ %p%%%)
set smartindent
set autoindent
set clipboard=unnamedplus

set enc=utf-8
let &termencoding=&encoding
set fencs=utf-8,ucs-bom,gb18030
set mouse=a
set timeoutlen=500

set foldlevelstart=99
set foldlevel=99

set undofile

if exists("g:neovide")
	set guifont=SauceCodePro\ Nerd\ Font\ Mono:h7:w7:b:i
	let g:neovide_scale_factor = 1.0
	let g:neovide_transparency = 0.8
	let g:neovide_hide_mouse_when_typing = v:true
	let g:neovide_fullscreen = v:true
	let g:neovide_cursor_vfx_mode = "railgun"
endif


