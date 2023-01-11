
"  project
nnoremap <silent> [p :ProjectBufPrev<cr>
nnoremap <silent> ]p :ProjectBufNext<cr>
nnoremap <silent> [P :ProjectBufFirst<cr>
nnoremap <silent> ]P :ProjectBufLast<cr>
nnoremap <silent> ]v :ProjectBufNext ~/.vim<cr>
nnoremap <silent> [v :ProjectBufPrev ~/.vim<cr>
nnoremap <silent> ]f :ProjectBufNext 'F<cr>
nnoremap <silent> [f :ProjectBufPrev 'F<cr>


" augroup projectAutoCmd
    " autocmd!
    " autocmd BufEnter * :ProjectRootCD
" augroup end
