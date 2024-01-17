let g:auto_format_flag = 0

function autoformat#RunAutoFormat()
    if g:auto_format_flag == 1
        let dot_pos = stridx(expand('%:p:t'), '.')
        if dot_pos != -1
            echom "Autoformat file:".expand("%:p")
            Autoformat
        endif
    endif
endfunction

function autoformat#ToggleAutoFormat()
    if g:auto_format_flag == 1
        let g:auto_format_flag = 0
        echom "AutoFormat off!"
    else
        let g:auto_format_flag = 1
        echom "AutoFormat on!"
    endif
endfunction

command! AFT :call autoformat#ToggleAutoFormat()

augroup autoformat
    autocmd!
    autocmd BufWritePre * :call autoformat#RunAutoFormat()
augroup END

nnoremap <silent> <A-F> :Autoformat<cr>
