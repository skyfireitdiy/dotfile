
"  coc-explorer
nnoremap <leader>e :CocCommand explorer<cr>

augroup AutoOpenExplorer
autocmd!
autocmd SessionLoadPost * CocCommand explorer
augroup END
