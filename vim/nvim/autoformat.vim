let g:auto_format_flag = 1

function RunAutoFormat()
    if g:auto_format_flag == 1
        echom "Autoformat file:".expand("%:p")
        Autoformat
    endif
endfunction

function ToggleAutoFormat()
    if g:auto_format_flag == 1
        let g:auto_format_flag = 0
        echom "AutoFormat off!"
    else
        let g:auto_format_flag = 1
        echom "AutoFormat on!"
    endif
endfunction

command! AutoFormatToggle :call ToggleAutoFormat()

augroup autoformat
    autocmd!
    autocmd BufWritePre * :call RunAutoFormat()
augroup END
