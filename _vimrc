

let mapleader=" "

"plugin manager
call plug#begin()
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'Yggdroot/LeaderF', {'do': './install.sh'}
Plug 'tomasr/molokai'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'justinmk/vim-sneak'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'pablopunk/statusline.vim'
Plug 'chiel92/vim-autoformat'
Plug 'kana/vim-textobj-user'
Plug 'gcmt/wildfire.vim'
Plug 'dbakker/vim-projectroot'
Plug 'dkprice/vim-easygrep'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
call plug#end()



" ------------ easygrep -------------
let g:EasyGrepRoot = "search:.git,.svn"

" ------------ project -----------------
nnoremap <leader>dp :ProjectRootCD<cr>
nnoremap <silent> <leader>dt :ProjectRootExe NERDTreeFind<cr>
nnoremap <silent> [p :ProjectBufPrev<cr>
nnoremap <silent> ]p :ProjectBufNext<cr>
nnoremap <silent> [P :ProjectBufFirst<cr>
nnoremap <silent> ]P :ProjectBufLast<cr>
nnoremap <silent> ]v :ProjectBufNext ~/.vim<cr>
nnoremap <silent> [v :ProjectBufPrev ~/.vim<cr>
nnoremap <silent> ]f :ProjectBufNext 'F<cr>
nnoremap <silent> [f :ProjectBufPrev 'F<cr>


" ------------- coc extensions ------------
let g:coc_global_extensions = ['coc-json', 'coc-clangd', 'coc-go', 'coc-python', 'coc-vimlsp', 'coc-marketplace', 'coc-rust-analyzer']

" ------------- workspace -------------
let g:workspace_autocreate = 1
let g:workspace_create_new_tabs = 0
let g:workspace_autosave_always = 1

" -------------- LeaderF -----------------
let g:Lf_ShortcutF = '<C-p>'

" -------------- color scheme ---------------------

let g:molokai_original = 1
let g:rehash256 = 1
color molokai
" -------------- nerdtree config -------------------
map <F2> :NERDTreeToggle<CR>
map <F3> :NERDTreeFind<CR>
let NERDTreeShowHidden=1

" --------------- coc.vim config -------------------

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
			\ coc#pum#visible() ? coc#pum#next(1) :
			\ CheckBackspace() ? "\<Tab>" :
			\ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
	inoremap <silent><expr> <c-space> coc#refresh()
else
	inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

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
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

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

" ---------------- my config ---------------
set showcmd
set nu
set autowriteall
set autoread
set ignorecase smartcase
set relativenumber
set cursorline cursorcolumn

autocmd InsertLeave,InsertEnter * :set relativenumber!

inoremap jj <ESC>

nnoremap <leader>w <C-w>
nnoremap <leader>tt :tabnew
nnoremap <leader>tn :tabnext<CR>
nnoremap <leader>tp :tabprev<CR>
nnoremap <leader>to :tabonly<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>f :Autoformat<CR>
nnoremap <leader>sh :shell<CR>
nnoremap <leader>h 0
nnoremap <leader>l $
nnoremap <f4> :CocCommand clangd.switchSourceHeader<CR>
nnoremap <leader>j 25j
nnoremap <leader>k 25k
nnoremap <leader>mr @
nnoremap <leader>rl :w<cr>:source ~/.vimrc<cr>
nnoremap <leader>g :Grep

" ---- git config -----
nnoremap <leader>ga :Git add -u
nnoremap <leader>gco :Git checkout
nnoremap <leader>gc :Git commit<cr>
nnoremap <leader>gl :Git log<cr>
nnoremap <leader>gb :Git branch<cr>
nnoremap <leader>gba :Git branch -a<cr>
nnoremap <leader>gpl :Git pull --rebase<cr>
nnoremap <leader>gps :Git push<cr>


nnoremap <leader>fc :echo @%<cr>
nnoremap <leader>i "_

nmap gb <C-n>

vnoremap <leader>w <C-w>
vnoremap <leader>tt :tabnew
vnoremap <leader>tn :tabnext<CR>
vnoremap <leader>tp :tabprev<CR>
vnoremap <leader>to :tabonly<CR>
vnoremap <leader>tc :tabclose<CR>
vnoremap <leader>f :Autoformat<CR>
vnoremap <leader>sh :shell<CR>
vnoremap <leader>h 0
vnoremap <leader>l $
vnoremap <f4> :CocCommand clangd.switchSourceHeader<CR>
vnoremap <leader>j 25j
vnoremap <leader>k 25k

