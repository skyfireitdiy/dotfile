
"  coc.vim config

" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
			\ coc#pum#visible() ? coc#pum#next(1) :
			\ CheckBackspace() ? "\<Tab>" :
			\ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <cr> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#pum#confirm()
			\: "\<C-g>u\<cr>\<c-r>=coc#on_enter()\<cr>"

function! CheckBackspace() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)


" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<cr>

function! ShowDocumentation()
	if CocAction('hasProvider', 'hover')
		call CocActionAsync('doHover')
	else
		call feedkeys('K', 'in')
	endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
	autocmd!
	" Setup formatexpr specified filetype(s).
	autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	" Update signature help on jump placeholder.
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
	nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
	nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
	inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
	inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
	vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
	vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>cx  :<C-u>CocList commands<cr>
" Find symbol of current document.
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

nnoremap <leader>mv :CocCommand markdown-preview-enhanced.openPreview<cr>
nnoremap gH :CocCommand clangd.switchSourceHeader<cr>

"  coc extensions
let g:coc_disable_startup_warning = 1
let g:coc_global_extensions = ['coc-json'
			\, 'coc-clangd'
			\, 'coc-go'
			\, 'coc-python'
			\, 'coc-vimlsp'
			\, 'coc-marketplace'
			\, 'coc-rust-analyzer'
			\, 'coc-markdownlint'
			\, 'coc-markdown-preview-enhanced'
			\, 'coc-webview'
			\, 'coc-github'
			\, 'coc-jsref'
			\, 'coc-sumneko-lua'
			\, 'coc-explorer'
			\, 'coc-tabnine'
			\, 'coc-clang-format-style-options'
			\, 'coc-fzf-preview'
			\]

"  coc-explorer
nnoremap <leader>e :CocCommand explorer<cr>


"  fzf key map
nnoremap <leader>b :CocCommand<space>fzf-preview.Buffers<cr>
nnoremap <leader>f :CocCommand<space>fzf-preview.ProjectFiles<cr>
nnoremap <leader>gff :CocCommand<space>fzf-preview.GitFiles<cr>
nnoremap <leader>rg :CocCommand<space>fzf-preview.ProjectGrep<space>
nnoremap <leader>l :CocCommand<space>fzf-preview.Lines<cr>
nnoremap <leader>T :CocCommand<space>fzf-preview.Ctags<cr>
nnoremap <leader>t :CocCommand<space>fzf-preview.BufferTags<cr>
nnoremap <leader>gt "9yiw:CocCommand<space>fzf-preview.Ctags<space><C-r>9<cr>
nnoremap <leader>m :CocCommand<space>fzf-preview.Marks<cr>
nnoremap <leader>h :CocCommand<space>fzf-preview.ProjectOldFiles<cr>
nnoremap <leader>: :CocCommand<space>fzf-preview.CommandPalette<cr>
nnoremap <leader>gg :CocCommand<space>fzf-preview.GitActions<cr>
nnoremap <leader>G "9yiw:CocCommand<space>fzf-preview.ProjectGrep<space><C-r>9<cr>
nnoremap <leader>o :CocCommand<space>fzf-preview.CocOutline<cr>



" GoTo code navigation.
nmap <silent> gd :CocCommand<space>fzf-preview.CocDefinition<cr>
nmap <silent> gy :CocCommand<space>fzf-preview.CocTypeDefinition<cr>
nmap <silent> gi :CocCommand<space>fzf-preview.CocImplementations<cr>
nmap <silent> gr :CocCommand<space>fzf-preview.CocReferences<cr>

" Use vim-devicons
let g:fzf_preview_use_dev_icons = 1
