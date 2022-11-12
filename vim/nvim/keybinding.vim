
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
inoremap <C-a> <Esc>^i
inoremap <C-e> <Esc>$a
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-c> <ESC>


nnoremap <leader>tt :tabnew<space>
nnoremap <leader>tn :tabnext<cr>
nnoremap <leader>tp :tabprev<cr>
nnoremap <leader>to :tabonly<cr>
nnoremap <leader>tc :tabclose<cr>

nnoremap <leader>w <C-w>
if has('nvim')
    nnoremap <leader>rl :w<cr>:source ~/.config/nvim/init.vim<cr>
    nnoremap <leader>s :sp<cr><C-w>j:terminal<cr>i
else
    nnoremap <leader>rl :w<cr>:source ~/.vimrc<cr>
    nnoremap <leader>s :shell<cr>
endif
nnoremap <leader>? :set hlsearch!<cr>

nnoremap <leader>fc :echo expand('%:p')<cr>
nnoremap <leader>zc 99zm
nnoremap <leader>zo 99zr
nnoremap // *
nnoremap ?? #
nnoremap <leader>% ggvG
nnoremap <leader>r "9yiw:%s/<C-r>9//g<Left><Left><C-r>9
nnoremap <leader>R "9yiw:%s/\<<C-r>9\>//g<Left><Left><C-r>9
nnoremap <leader>M :set nomodifiable!<cr>
nnoremap Q @

nnoremap <A-Left> <C-o>
nnoremap <A-Right> <C-i>
nnoremap <C-a> ^
nnoremap <C-e> $

nnoremap <Up> k
nnoremap <Down> j
nnoremap <Left> h
nnoremap <Right> l
nnoremap gh ^
nnoremap gl $
nnoremap g<Left> 0
nnoremap g<Right> $
nnoremap g<Down> 25jzz
nnoremap g<Up> 25kzz
nnoremap W :wa<cr>
nnoremap Q :qa<cr>
nnoremap WQ :wqa<cr>
nnoremap <leader>. :<Up><cr>

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
vnoremap <C-a> ^
vnoremap <C-e> $
vnoremap <C-c> <ESC>
vnoremap <leader>. :<Up><cr>
