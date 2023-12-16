
inoremap <silent> hh <ESC>
inoremap <silent> jj <ESC>
inoremap <silent> kk <ESC>
inoremap <silent> oo <ESC>o
" inoremap <silent> OO <ESC>O
inoremap <silent> <C-j> <Down>
inoremap <silent> <C-k> <Up>
inoremap <silent> <C-h> <Left>
inoremap <silent> <C-l> <Right>
inoremap <silent> <A-Left> <C-\><C-N><C-w>h
inoremap <silent> <A-Down> <C-\><C-N><C-w>j
inoremap <silent> <A-Up> <C-\><C-N><C-w>k
inoremap <silent> <A-Right> <C-\><C-N><C-w>l
inoremap <silent> <A-h> <C-\><C-N><C-w>h
inoremap <silent> <A-j> <C-\><C-N><C-w>j
inoremap <silent> <A-k> <C-\><C-N><C-w>k
inoremap <silent> <A-l> <C-\><C-N><C-w>l
inoremap <silent> <C-v> <C-r>"
inoremap <silent> <C-H> <C-W>
inoremap <silent> <C-c> <ESC>

nnoremap <silent> <leader>w <C-w>
nnoremap <silent> <leader>rl :w<cr>:source ~/.config/nvim/init.vim<cr>
nnoremap <silent> <leader>? :set hlsearch!<cr>
nnoremap <silent> <leader>fc :let @+=expand('%:p')<CR>:echo expand('%:p')<CR>
nnoremap <silent> <leader>zc 99zm
nnoremap <silent> <leader>zo 99zr
nnoremap <silent> // *
nnoremap <silent> ?? #
nnoremap <silent> <leader>% ggvG
" nnoremap <silent> <leader>r "9yiw:%s/<C-r>9//g<Left><Left><C-r>9
nnoremap <silent> <leader>R "9yiw:%s/\<<C-r>9\>//g<Left><Left><C-r>9
nnoremap <silent> <leader>M :set nomodifiable!<cr>
" nnoremap <silent> <C-a> ^
" nnoremap <silent> <C-e> $
nnoremap <silent> <Up> k
nnoremap <silent> <Down> j
nnoremap <silent> <Left> h
nnoremap <silent> <Right> l
nnoremap <silent> gh ^
nnoremap <silent> gl $
nnoremap <silent> g<Left> 0
nnoremap <silent> g<Right> $
nnoremap <silent> g<Down> 25jzz
nnoremap <silent> g<Up> 25kzz
nnoremap <silent> Q :qa<cr>
nnoremap <silent> <leader>. :<Up><cr>
nnoremap <silent> _d "_d
" nnoremap <silent> <C-j> <C-u>
" nnoremap <silent> <C-k> <C-d>
nnoremap <silent> <S-Up> :resize -1<CR>
nnoremap <silent> <S-Down> :resize +1<CR>
nnoremap <silent> <S-Left> :vertical resize -1<CR>
nnoremap <silent> <S-Right> :vertical resize +1<CR>
nnoremap <silent> <A-h> <C-w>h
nnoremap <silent> <A-j> <C-w>j
nnoremap <silent> <A-k> <C-w>k
nnoremap <silent> <A-l> <C-w>l
nnoremap <silent> <A-Left> <C-w>h
nnoremap <silent> <A-Down> <C-w>j
nnoremap <silent> <A-Up> <C-w>k
nnoremap <silent> <A-Right> <C-w>l
nnoremap <silent> <C-]> g<C-]>
nnoremap <silent> <C-c> yiw
nnoremap <silent> <C-v> viwP
nnoremap <silent> <leader>y yiw
nnoremap <silent> <leader>p viwP

vnoremap <silent> <Up> k
vnoremap <silent> <Down> j
vnoremap <silent> <Left> h
vnoremap <silent> <Right> l
vnoremap <silent> gh ^
vnoremap <silent> gl $
vnoremap <silent> g<Left> 0
vnoremap <silent> g<Right> $
vnoremap <silent> g<Down> 25jzz
vnoremap <silent> g<Up> 25kzz
vnoremap <silent> <C-c> <ESC>
vnoremap <silent> <leader>. :<Up><cr>
vnoremap <silent> p P
vnoremap <silent> P p
vnoremap <silent> <S-Left> h
vnoremap <silent> <S-Right> l
vnoremap <silent> <leader>r "9y:%s/<C-r>9//g<Left><Left><C-r>9
vnoremap <silent> <leader>R "9y:%s/\<<C-r>9\>//g<Left><Left><C-r>9
vnoremap <silent> <C-c> y

tnoremap <silent> <C-n><C-n> <C-\><C-n>
tnoremap <silent> <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
tnoremap <silent> <A-h> <C-\><C-N><C-w>h
tnoremap <silent> <A-j> <C-\><C-N><C-w>j
tnoremap <silent> <A-k> <C-\><C-N><C-w>k
tnoremap <silent> <A-l> <C-\><C-N><C-w>l
tnoremap <silent> <A-Left> <C-\><C-N><C-w>h
tnoremap <silent> <A-Down> <C-\><C-N><C-w>j
tnoremap <silent> <A-Up> <C-\><C-N><C-w>k
tnoremap <silent> <A-Right> <C-\><C-N><C-w>l
