
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

nnoremap <leader>w <C-w>
if has('nvim')
    nnoremap <leader>rl :w<cr>:source ~/.config/nvim/init.vim<cr>
    nnoremap <leader>s :sp<cr><C-w>j:terminal<cr>i
else
    nnoremap <leader>rl :w<cr>:source ~/.vimrc<cr>
    nnoremap <leader>s :terminal<cr>
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
nnoremap <C-d> "_d
nnoremap <C-j> <C-u>
nnoremap <C-k> <C-d>
nnoremap <S-Left> vh
nnoremap <S-Right> vl

vnoremap <Up> k
vnoremap <Down> j
vnoremap <Left> h
vnoremap <Right> l
vnoremap gh ^
vnoremap gl $
vnoremap g<Left> 0
vnoremap g<Right> $
vnoremap g<Down> 25jzz
vnoremap g<Up> 25kzz
vnoremap <C-a> ^
vnoremap <C-e> $
vnoremap <C-c> <ESC>
vnoremap <leader>. :<Up><cr>
vnoremap p P
vnoremap P p
vnoremap <S-Left> h
vnoremap <S-Right> l

tmap <ESC><ESC> <C-\><C-o>
tmap <ESC><ESC><ESC> <C-\><C-n>
