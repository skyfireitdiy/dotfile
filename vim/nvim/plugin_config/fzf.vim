
if g:use_telescope == 1 
    nnoremap  <silent>``co    :Colors<cr>
    nnoremap  <silent>``r     :Rg<cr>
    nnoremap  <silent>``m     :Marks<cr>
    nnoremap  <silent>``k     :Maps<cr>
    nnoremap  <silent>``H     :Helptags<cr>
    nnoremap  <silent>``t     :Tags<cr>
    nnoremap  <silent>``fF    :Files<CR>
    nnoremap  <silent>``ff    :GFiles<CR>
    nnoremap  <silent>``gs    :GFiles?<CR>
    nnoremap  <silent>``b     :Buffers<CR>
    nnoremap  <silent>``l     :BLines<CR>
    nnoremap  <silent>``h     :History<CR>
    nnoremap  <silent>``:     :History:<CR>
    nnoremap  <silent>``/     :History/<CR>
    nnoremap  <silent>``gc    :BCommits<CR>
    nnoremap  <silent>``gC    :Commits<CR>
    nnoremap  <silent>``x     :Commands<CR>
    nnoremap  <silent>``G     "9yiw:Rg<Space><C-r>9<cr>
else
    nnoremap  <silent><leader>co    :Colors<cr>
    nnoremap  <silent><leader>r     :Rg<cr>
    nnoremap  <silent><leader>m     :Marks<cr>
    nnoremap  <silent><leader>k     :Maps<cr>
    nnoremap  <silent><leader>H     :Helptags<cr>
    nnoremap  <silent><leader>t     :Tags<cr>
    nnoremap  <silent><leader>fF    :Files<CR>
    nnoremap  <silent><leader>ff    :GFiles<CR>
    nnoremap  <silent><leader>gs    :GFiles?<CR>
    nnoremap  <silent><leader>b     :Buffers<CR>
    nnoremap  <silent><leader>l     :BLines<CR>
    nnoremap  <silent><leader>h     :History<CR>
    nnoremap  <silent><leader>:     :History:<CR>
    nnoremap  <silent><leader>/     :History/<CR>
    nnoremap  <silent><leader>gc    :BCommits<CR>
    nnoremap  <silent><leader>gC    :Commits<CR>
    nnoremap  <silent><leader>x     :Commands<CR>
    nnoremap  <silent><leader>G     "9yiw:Rg<Space><C-r>9<cr>
endif


nnoremap <silent> <leader>L      "9yiw:BLines<Space><C-r>9<cr>
nnoremap <silent> <leader>T      "9yiw:Tags<Space><C-r>9<cr>
nnoremap <silent> <leader>W      :Windows<cr>
