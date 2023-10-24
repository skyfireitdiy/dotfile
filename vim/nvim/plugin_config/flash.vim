nnoremap ]t :lua require('flash').treesitter()<CR>
nnoremap ]T :lua require("flash").treesitter_search()<CR>
nnoremap ]r :lua require("flash").remote()<CR>
nnoremap ]j :lua require("flash").jump()<CR>

command! -nargs=0 TF :lua require('flash').toggle()
