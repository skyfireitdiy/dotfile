
let mapleader=" "


"plugin manager
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'tomasr/molokai'
Plug 'dracula/vim'
"Plug 'sjl/badwolf'
Plug 'justinmk/vim-sneak'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'pablopunk/statusline.vim'
Plug 'chiel92/vim-autoformat'
Plug 'kana/vim-textobj-user'
Plug 'gcmt/wildfire.vim'
Plug 'dbakker/vim-projectroot'
"Plug 'dkprice/vim-easygrep'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
"Plug 'yegappan/grep'
Plug 'yggdroot/leaderf'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'luochen1990/rainbow'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'ryanoasis/vim-devicons'
"Plug 'majutsushi/tagbar'
Plug 'tpope/vim-repeat'
"Plug 't9md/vim-choosewin'
Plug 'airblade/vim-gitgutter'
Plug 'weilbith/nerdtree_choosewin-plugin'
Plug 'jszakmeister/vim-togglecursor'
"Plug 'rhysd/git-messenger.vim'
Plug 'reedes/vim-wheel'
Plug 'rrethy/vim-illuminate'
Plug 'inside/vim-search-pulse'
"Plug 'joeytwiddle/sexy_scroller.vim'
Plug 'vim-scripts/CursorLineCurrentWindow'
Plug 'christoomey/vim-system-copy'



" bellow is textobj

Plug 'fvictorio/vim-textobj-backticks' " `
Plug 'thinca/vim-textobj-between' " af{char}
Plug 'deathlyfrantic/vim-textobj-blanklines' " a<space>
Plug 'Julian/vim-textobj-brace' " aj
Plug 'D4KU/vim-textobj-chainmember' " am  chain call
Plug 'glts/vim-textobj-comment' " ac comment
Plug 'rhysd/vim-textobj-continuous-line' " av \string
Plug 'kana/vim-textobj-datetime' " ada datetime
Plug 'kana/vim-textobj-diff' " adh diff
Plug 'kana/vim-textobj-entire'
Plug 'somini/vim-textobj-fold'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-indent'
Plug 'vimtaku/vim-textobj-keyvalue'
Plug 'kana/vim-textobj-lastpat'
Plug 'kana/vim-textobj-line'
Plug 'adriaanzon/vim-textobj-matchit'
Plug 'sgur/vim-textobj-parameter'
Plug 'saaguero/vim-textobj-pastedtext'
Plug 'paulhybryant/vim-textobj-path'
Plug 'beloglazov/vim-textobj-punctuation'
Plug 'preservim/vim-textobj-quote'
Plug 'beloglazov/vim-textobj-quotes'
Plug 'preservim/vim-textobj-sentence'
Plug 'kana/vim-textobj-syntax'
Plug 'adolenc/vim-textobj-toplevel'
Plug 'lucapette/vim-textobj-underscore'
Plug 'mattn/vim-textobj-url'
Plug 'Julian/vim-textobj-variable-segment'
Plug 'whatyouhide/vim-textobj-xmlattr'

Plug 'libclang-vim/vim-textobj-clang'
Plug 'bps/vim-textobj-python'

" textobj end

call plug#end()

"" -------------- git messenger -----
"let g:git_messenger_include_diff='current'

" ------------- airline theme -------
let g:airline_theme='badwolf'


" ------------ gitgutter --------
function! GitStatus()
	let [a,m,r] = GitGutterGetHunkSummary()
	return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}


let g:gitgutter_highlight_lines = 1
let g:gitgutter_highlight_linenrs = 1

" ------------- choosewin -----------
"let g:choosewin_overlay_enable = 1


" ------------- visual cursor --------
let g:VM_maps = {}
let g:VM_maps['Find Under']         = 'gb'
let g:VM_maps['Find Subword Under'] = 'gb'


" -------------- nerdtree git ---------

let g:NERDTreeGitStatusShowIgnored = 1


" ------------- cpp highlight ------
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_no_function_highlight = 1

" ------------ rainbow -------------
let g:rainbow_active = 1


"" ------------ easygrep -------------
"let g:EasyGrepRoot = "search:.git,.svn"
"let g:EasyGrepRecursive = "1"
"let g:EasyGrepIgnoreCase = "1"

" ------------ project -----------------
nnoremap <silent> [p :ProjectBufPrev<cr>
nnoremap <silent> ]p :ProjectBufNext<cr>
nnoremap <silent> [P :ProjectBufFirst<cr>
nnoremap <silent> ]P :ProjectBufLast<cr>
nnoremap <silent> ]v :ProjectBufNext ~/.vim<cr>
nnoremap <silent> [v :ProjectBufPrev ~/.vim<cr>
nnoremap <silent> ]f :ProjectBufNext 'F<cr>
nnoremap <silent> [f :ProjectBufPrev 'F<cr>


" ------------- coc extensions ------------
let g:coc_disable_startup_warning = 1
let g:coc_global_extensions = ['coc-json', 'coc-clangd', 'coc-go', 'coc-python', 'coc-vimlsp', 'coc-marketplace', 'coc-rust-analyzer', 'coc-markdownlint', 'coc-markdown-preview-enhanced', 'coc-webview', 'coc-github', 'coc-jsref', 'coc-sumneko-lua', 'coc-explorer']

" ------------- coc-explorer ----------
nnoremap <leader>e :CocCommand explorer<cr>

" -------------- color scheme ---------------------
"let g:molokai_original = 1
let g:rehash256 = 1
"color molokai
color dracula
"color badwolf

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

" ---------------- my config ---------------
set showcmd
set nu
" already set autocmd, comment this line
set autoread
set autowriteall
set ignorecase smartcase
set incsearch
"set hlsearch
set cmdheight=1
" set relativenumber
set cursorline cursorcolumn
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set nocompatible
set nowrap
set ruler
set rulerformat=%15(%c%V\ %p%%%)
set smartindent
set autoindent

set enc=utf-8
let &termencoding=&encoding
set fencs=utf-8,ucs-bom,gb18030



augroup autoRunGroup
	autocmd!
	autocmd BufEnter * :ProjectRootCD
	autocmd BufWritePre * :Autoformat
	" autocmd InsertLeave,InsertEnter * :set relativenumber!
	autocmd BufWritePost *vimrc :source ~/.vimrc
	" autocmd BufEnter * :set nomodifiable
augroup END


inoremap hh <ESC>
inoremap jj <ESC>
inoremap kk <ESC>
inoremap //<cr> <ESC>:Dox<cr>
inoremap ///<cr> <ESC>:DoxLic<cr>
inoremap ' ''<ESC>i
inoremap ( ()<ESC>i
inoremap " ""<ESC>i
inoremap { {}<ESC>i
inoremap [ []<ESC>i
inoremap oo <ESC>o
inoremap OO <ESC>O
inoremap zz <ESC>zza


" ---- fzf key map ------
nnoremap <leader>w :Windows<cr>
nnoremap <leader>o :FZF<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>f :Files<cr>
nnoremap <leader>gff :GFiles<cr>
nnoremap <leader>gf? :GFiles?<cr>
nnoremap <leader>co :Colors<cr>
nnoremap <leader>rg :Rg<cr>
nnoremap <leader>l :BLines<cr>
nnoremap <leader>L :Lines<cr>
nnoremap <leader>T :Tags<cr>
nnoremap <leader>t :BTags<cr>
nnoremap <leader>gt "9yiw:Tags<space><C-r>9<cr>
nnoremap <leader>x :Commands<cr>
nnoremap <leader>k :Maps<cr>
nnoremap <leader>h :History<cr>
nnoremap <leader>: :History:<cr>
nnoremap <leader>/ :History/<cr>
nnoremap <leader>H :Helptags<cr>
nnoremap <leader>m :Marks<cr>
nnoremap <leader>c :BCommits<cr>
nnoremap <leader>C :Commits<cr>



nnoremap <leader>tt :tabnew
nnoremap <leader>tn :tabnext<CR>
nnoremap <leader>tp :tabprev<CR>
nnoremap <leader>to :tabonly<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>s :shell<CR>
nnoremap <leader>rl :w<cr>:source ~/.vimrc<cr>
nnoremap <leader>G "9yiw:Rg<space><C-r>9<cr>
nnoremap <leader>g :!lazygit<cr>
nnoremap <leader>mv :CocCommand markdown-preview-enhanced.openPreview<cr>
nnoremap <leader>fc :echo @%<cr>
nnoremap // *
nnoremap ?? #
nnoremap <leader>F :Autoformat<cr>
nnoremap <leader>% ggvG
nnoremap <leader>r "9yiw:%s/<C-r>9//g<Left><Left>
nnoremap <leader>R "9yiw:%s/\<<C-r>9\>//g<Left><Left>
nnoremap <leader>M :set nomodifiable!<cr>
nnoremap Q @
nnoremap <C-Right> <C-o>
nnoremap <C-Left> <C-i>


nnoremap <Up> k
nnoremap <Down> j
nnoremap <Left> h
nnoremap <Right> l
nnoremap gh 0
nnoremap gl $
nnoremap gj 25jzz
nnoremap gk 25kzz
nnoremap g<Left> 0
nnoremap g<Right> $
nnoremap g<Down> 25jzz
nnoremap g<Up> 25kzz
nnoremap gh :CocCommand clangd.switchSourceHeader<CR>


vnoremap <Up> k
vnoremap <Down> j
vnoremap <Left> h
vnoremap <Right> l
vnoremap gh 0
vnoremap gl $
vnoremap gj 25jzz
vnoremap gk 25kzz
vnoremap g<Left> 0
vnoremap g<Right> $
vnoremap g<Down> 25jzz
vnoremap g<Up> 25kzz
