let g:auto_format_flag = 1

function autoformat#RunAutoFormat()
    if g:auto_format_flag == 1
        echom "Autoformat file:".expand("%:p")
        Autoformat
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

command! AutoFormatToggle :call autoformat#ToggleAutoFormat()

augroup autoformat
    autocmd!
    autocmd BufWritePre * :call autoformat#RunAutoFormat()
augroup END
