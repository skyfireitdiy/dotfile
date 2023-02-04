
"  coc.vim config

inoremap <silent><expr> <TAB>
            \ coc#pum#visible() ? coc#pum#next(1) :
            \ CheckBackspace() ? "\<Tab>" :
            \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <cr> coc#pum#visible() ? coc#pum#confirm()
            \: "\<C-g>u\<cr>\<c-r>=coc#on_enter()\<cr>"


function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
    else
        call feedkeys('K', 'in')
    endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
    autocmd!
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <leader>cl  <Plug>(coc-codelens-action)
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>rr  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>rr  <Plug>(coc-codeaction-refactor-selected)

if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

command! -nargs=0 Format :call CocActionAsync('format')
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

nnoremap <silent><nowait> <space>ca  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <space>ce  :<C-u>CocList extensions<cr>
nnoremap <silent><nowait> <space>cx  :<C-u>CocList commands<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> <F12> <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <leader>rn <Plug>(coc-rename)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent> K :call ShowDocumentation()<cr>


" augroup autoformat
" autocmd!
" autocmd BufWritePre * :CocCommand editor.action.formatDocument
" augroup END

" coc 插件配置表项  coc插件名  插件配置（可选）
let g:coc_config = [
            \ ["coc-clangd", 'clangd.vim'],
            \ ['coc-go'],
            \ ['coc-jedi'],
            \ ['coc-vimlsp'],
            \ ['coc-marketplace'],
            \ ['coc-rust-analyzer'],
            \ ['coc-markdownlint'],
            \ ['coc-markdown-preview-enhanced', 'markdown-preview-enhanced.vim'],
            \ ['coc-webview'],
            \ ['coc-sumneko-lua'],
            \ ['coc-explorer', 'explorer.vim'],
            \ ['coc-tabnine'],
            \ ['coc-clang-format-style-options'],
            \ ['coc-yaml'],
            \ ['coc-snippets'],
            \ ['coc-cmake'],
            \ ['coc-cl'],
            \ ['coc-json'],
            \ ]
"  coc extensions
let g:coc_disable_startup_warning = 1
let g:coc_global_extensions = []
for c in g:coc_config
    let g:coc_global_extensions = add(g:coc_global_extensions, c[0])
    if len(c) > 1
        execute "runtime coc/" .. c[1]
    endif
endfor

