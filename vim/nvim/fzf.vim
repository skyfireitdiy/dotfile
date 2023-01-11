
" vim 中生效
if has('vim')
    nnoremap  <leader>co :Colors<cr>
    nnoremap  <leader>rg :Rg<cr>
    nnoremap  <leader>m :Marks<cr>
    nnoremap  <leader>k :Maps<cr>
    nnoremap  <leader>H :Helptags<cr>
    nnoremap  <leader>t :BTags<cr>
    nnoremap  <leader>T :Tags<cr>
    nnoremap <leader>ff     :Files<CR>
    nnoremap <leader>f      :GFiles<CR>
    nnoremap <leader>gs     :GFiles?<CR>
    nnoremap <leader>b      :Buffers<CR>
    nnoremap <leader>l      :BLines<CR>
    nnoremap <leader>h      :History<CR>
    nnoremap <leader>:      :History:<CR>
    nnoremap <leader>/      :History/<CR>
    nnoremap <leader>gc     :BCommits<CR>
    nnoremap <leader>gC     :Commits<CR>
    nnoremap <leader>x      :Commands<CR>
endif

" 全局生效
nnoremap <leader>G      "9yiw:Rg<Space><C-r>9<cr>
nnoremap <leader>L      "9yiw:BLines<Space><C-r>9<cr>
nnoremap <leader>TT     "9yiw:Tags<Space><C-r>9<cr>
nnoremap <leader>W      :Windows<cr>
