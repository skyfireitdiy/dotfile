
nnoremap <leader>e :CocCommand explorer<cr>

function! explorer#RecoverExplorer()
    let need_recover = 0
    let tab = tabpagenr()
    let bufs = tabpagebuflist(tab)
    for buf in bufs
        let name = bufname(buf)
        if stridx(name, '[coc-explorer]') == 0
            execute 'bd! '..buf
            let need_recover = 1
        endif
    endfor
    if need_recover == 1
        CocCommand explorer --no-focus
    endif
endfunction

" augroup autoRecoverExplorer
"     autocmd!
"     autocmd SessionLoadPost * call explorer#RecoverExplorer()
" augroup END
