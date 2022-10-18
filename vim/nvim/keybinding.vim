
if !has('nvim')
	lnoremap ' ''<ESC>i
	inoremap ( ()<ESC>i
	inoremap " ""<ESC>i
	inoremap { {}<ESC>i
	inoremap [ []<ESC>i
endif


inoremap hh <ESC>
inoremap jj <ESC>
inoremap kk <ESC>
inoremap oo <ESC>o
inoremap OO <ESC>O
inoremap zz <ESC>zza

nnoremap <leader>tt :tabnew<space>
nnoremap <leader>tn :tabnext<cr>
nnoremap <leader>tp :tabprev<cr>
nnoremap <leader>to :tabonly<cr>
nnoremap <leader>tc :tabclose<cr>

nnoremap <leader>w <C-w>
if !has('nvim')
	nnoremap <leader>s :shell<cr>
endif
nnoremap <leader>rl :w<cr>:source ~/.vimrc<cr>
nnoremap <leader>? :set hlsearch!<cr>

nnoremap <leader>fc :echo @%<cr>
nnoremap // *
nnoremap ?? #
nnoremap <leader>% ggvG
nnoremap <leader>r "9yiw:%s/<C-r>9//g<Left><Left><C-r>9
nnoremap <leader>R "9yiw:%s/\<<C-r>9\>//g<Left><Left><C-r>9
nnoremap <leader>M :set nomodifiable!<cr>
nnoremap Q @
nnoremap <C-Right> <C-o>
nnoremap <C-Left> <C-i>

nnoremap <Up> k
nnoremap <Down> j
nnoremap <Left> h
nnoremap <Right> l
nnoremap gh 0
nnoremap gl $
nnoremap g<Left> 0
nnoremap g<Right> $
nnoremap g<Down> 25jzz
nnoremap g<Up> 25kzz

vnoremap <Up> k
vnoremap <Down> j
vnoremap <Left> h
vnoremap <Right> l
vnoremap gh 0
vnoremap gl $
vnoremap g<Left> 0
vnoremap g<Right> $
vnoremap g<Down> 25jzz
vnoremap g<Up> 25kzz

