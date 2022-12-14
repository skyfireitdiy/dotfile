
if !has('nvim')
    function! Zoom ()
        " check if is the zoomed state (tabnumber > 1 && window == 1)
        if tabpagenr('$') > 1 && tabpagewinnr(tabpagenr(), '$') == 1
            let l:cur_winview = winsaveview()
            let l:cur_bufname = bufname('')
            tabclose

            " restore the view
            if l:cur_bufname == bufname('')
                call winrestview(cur_winview)
            endif
        else
            tab split
        endif
    endfunction
    nnoremap <leader>z :call Zoom()<cr>
endif



