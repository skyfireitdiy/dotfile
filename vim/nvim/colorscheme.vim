
"  color scheme
let g:molokai_original = 1
let g:rehash256 = 1
"color molokai
"color dracula
"color badwolf


function! RandomColor()
    let colors = split(globpath(&rtp, "colors/*.vim"), "\n")
    if has('packages')
        let colors += split(globpath(&packpath, "pack/*/opt/*/colors/*.vim"), "\n")
    endif
    let index = rand() % len(colors)
    let target = substitute(substitute(fnamemodify(colors[index], ':t'), '\\..\\{-}$', '', ''), "\\.vim$", "", "")
    execute("colors " .. target)
    echomsg "current color scheme: " .. target
endfunction

function! CheckColor()
    let colors = split(globpath(&rtp, "colors/*.vim"), "\n")
    if has('packages')
        let colors += split(globpath(&packpath, "pack/*/opt/*/colors/*.vim"), "\n")
    endif
    let errcount = 0
    for c in colors
        let target = substitute(substitute(fnamemodify(c, ':t'), '\\..\\{-}$', '', ''), "\\.vim$", "", "")
        try
            execute("colors " .. target)
        catch /^.*$/
            echomsg target
            let errcount=errcount+1
        endtry
    endfor
    if errcount == 0
        echomsg "all colorscheme work well!"
    else
        echoerr errcount .. " colorschemes has problems!!!"
    endif
endfunction

command! -nargs=0 RC :call RandomColor()

if has('nvim')
    colorscheme base16-dracula
else
    color badwolf
endif
