
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
  echo "current color scheme: " .. target
endfunction


call RandomColor()
