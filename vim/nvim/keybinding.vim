
inoremap hh <ESC>
inoremap jj <ESC>
inoremap kk <ESC>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <A-Left> <C-\><C-N><C-w>h
inoremap <A-Down> <C-\><C-N><C-w>j
inoremap <A-Up> <C-\><C-N><C-w>k
inoremap <A-Right> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
inoremap <C-v> <C-r>"
inoremap <C-H> <C-W>

nnoremap <leader>w <C-w>
nnoremap <leader>rl :w<cr>:source ~/.config/nvim/init.vim<cr>
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
nnoremap _d "_d
nnoremap <C-j> <C-u>
nnoremap <C-k> <C-d>
nnoremap <S-Left> vh
nnoremap <S-Right> vl
nnoremap <S-Up> :resize -1<CR>
nnoremap <S-Down> :resize +1<CR>
nnoremap <S-Left> :vertical resize -1<CR>
nnoremap <S-Right> :vertical resize +1<CR>
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
nnoremap <A-Left> <C-w>h
nnoremap <A-Down> <C-w>j
nnoremap <A-Up> <C-w>k
nnoremap <A-Right> <C-w>l
nnoremap <C-]> g<C-]>
nnoremap <C-c> yiw
nnoremap <leader>y yiw
nnoremap <leader>p viwp

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
vnoremap <leader>r "9y:%s/<C-r>9//g<Left><Left><C-r>9
vnoremap <leader>R "9y:%s/\<<C-r>9\>//g<Left><Left><C-r>9
vnoremap <C-c> y

" tnoremap <ESC><ESC><ESC> <C-\><C-n>
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
tnoremap <A-Left> <C-\><C-N><C-w>h
tnoremap <A-Down> <C-\><C-N><C-w>j
tnoremap <A-Up> <C-\><C-N><C-w>k
tnoremap <A-Right> <C-\><C-N><C-w>l
