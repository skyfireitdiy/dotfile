nnoremap <silent> ]t :lua require('flash').treesitter()<cr>
nnoremap <silent> ]t :lua require("flash").treesitter_search()<cr>
nnoremap <silent> ]r :lua require("flash").remote()<cr>
nnoremap <silent> ]j :lua require("flash").jump()<cr>

command! -nargs=0 TF :lua require('flash').toggle()
