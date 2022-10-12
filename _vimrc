
let mapleader=" " "映射leader键为空格


call plug#begin()  " 插件管理
Plug 'neoclide/coc.nvim', {'branch': 'release'} " coc插件，提供lsp等功能
Plug 'tpope/vim-surround' " 快速修改包围类型
Plug 'easymotion/vim-easymotion' " 快速跳转
Plug 'justinmk/vim-sneak' " s键快速查找
Plug 'mg979/vim-visual-multi', {'branch': 'master'} " 多光标
Plug 'chiel92/vim-autoformat' " 格式化
Plug 'gcmt/wildfire.vim' " 回车按照层级选中
Plug 'dbakker/vim-projectroot' " 自动进入项目根目录
Plug 'scrooloose/nerdcommenter' " 快速注释
Plug 'tpope/vim-fugitive' " git封装
Plug 'vim-scripts/DoxygenToolkit.vim' " doxygen 注释
Plug 'vim-airline/vim-airline' " 状态栏
Plug 'vim-airline/vim-airline-themes' " 状态栏主题
Plug 'luochen1990/rainbow' " 彩虹括号
Plug 'octol/vim-cpp-enhanced-highlight' " c++ 增强的语法高亮
Plug 'ryanoasis/vim-devicons' " 图标
Plug 'majutsushi/tagbar' " 标签栏
Plug 'tpope/vim-repeat' " 增强.操作
Plug 't9md/vim-choosewin' " 快速选择窗口
Plug 'airblade/vim-gitgutter' " git状态显示
Plug 'jszakmeister/vim-togglecursor' " 光标形状
Plug 'reedes/vim-wheel' " 保持光标不动，屏幕滚动
Plug 'inside/vim-search-pulse' " 搜索到匹配的时候会闪烁高亮
"Plug 'joeytwiddle/sexy_scroller.vim' " 平滑滚动，有时候屏幕会闪动
Plug 'vim-scripts/CursorLineCurrentWindow' " 高亮显示激活窗口的当前行
Plug 'christoomey/vim-system-copy' " 拷贝到系统剪贴板
Plug 'kabbamine/zeavim.vim' " zeal 文档
Plug 'vim-scripts/EasyGrep' " 查找替换
Plug 'christoomey/vim-tmux-navigator' " tmux pane跳转
Plug 'benmills/vimux' " tmux 终端集成
Plug 'junegunn/fzf' " fzf 模糊查找
Plug 'junegunn/fzf.vim' " fzf 模糊查找

" 主题
Plug 'tomasr/molokai' " molokai主题
Plug 'dracula/vim',{'as': 'dracula'} " dracula 主题
Plug 'sjl/badwolf' " badwolf主题

" nvim 专属插件

if has('nvim')
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
	Plug 'kdheepak/lazygit.nvim' " lazygit
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " treesitter
else
endif

" text object
Plug 'kana/vim-textobj-user'


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

" ---------------- treesitter -----------------

if has('nvim')
lua << EOF
	require'nvim-treesitter.configs'.setup {
		-- A list of parser names, or "all"
		ensure_installed = { "c", "lua", "rust", "cpp", "go", "bash", "make", "json", "json5", "yaml", "jsonc", "julia", "c_sharp", "vim" },

		-- Install parsers synchronously (only applied to `ensure_installed`)
		sync_install = false,

		-- Automatically install missing parsers when entering buffer
		-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
		auto_install = true,

		-- List of parsers to ignore installing (for "all")
		ignore_install = { "javascript" },

		---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
		-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

		highlight = {
			-- `false` will disable the whole extension
			enable = true,

			-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
			-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
			-- the name of the parser)
			-- list of language that will be disabled
			disable = {},
			-- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
			disable = function(lang, buf)
			local max_filesize = 100 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
				end
				end,

				-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
				-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
				-- Using this option may slow down your editor, and you may see some duplicate highlights.
				-- Instead of true it can also be a list of languages
				additional_vim_regex_highlighting = false,
				},
	}
EOF
endif

" ---------------- lazygit ------------------

if has('nvim')
	let g:lazygit_floating_window_winblend = 0 " transparency of floating window
	let g:lazygit_floating_window_scaling_factor = 0.9 " scaling factor for floating window
	let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
	let g:lazygit_floating_window_use_plenary = 0 " use plenary.nvim to manage floating window if available
	let g:lazygit_use_neovim_remote = 1 " fallback to 0 if neovim-remote is not installed
endif

" --------------- tmux ---------------
let g:tmux_navigator_save_on_switch = 2
let g:tmux_navigator_disable_when_zoomed = 1

" --------------- tagbar ----------------
nnoremap gt :Tagbar<cr>


" ------------- airline theme -------
let g:airline_theme='dracula'


" ------------ gitgutter --------
function! GitStatus()
	let [a,m,r] = GitGutterGetHunkSummary()
	return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}


let g:gitgutter_highlight_lines = 1
let g:gitgutter_highlight_linenrs = 1

" ------------- choosewin -----------
let g:choosewin_overlay_enable = 1
nnoremap ` :ChooseWin<cr>

" ------------- visual cursor --------
let g:VM_default_mappings = 0
let g:VM_mouse_mappings = 1
let g:VM_maps={}
let g:VM_maps['Exit']='<Esc>'
let g:VM_maps['Find Under']='<C-n>'
let g:VM_maps['Find Subword Under']='<C-n>'
let g:VM_maps['Add Cursor Down']='<leader>aj'
let g:VM_maps['Add Cursor Up']='<leader>ak'
let g:VM_maps['Select All']='\\A'
let g:VM_maps['Start Regex Search']='\\/'
let g:VM_maps['Add Cursor At Pos']='\\\'
let g:VM_maps['Reselect Last']='\\gS'

let g:VM_maps['Mouse Cursor']='<C-LeftMouse>'
let g:VM_maps['Mouse Word']='<C-RightMouse>'
let g:VM_maps['Mouse Column']='<M-C-RightMouse>'

let g:VM_maps['Visual All']='\\A'
let g:VM_maps['Visual Regex']='\\/'
let g:VM_maps['Visual Find']='\\f'
let g:VM_maps['Visual Cursors']='\\c'
let g:VM_maps['Visual Add']='\\a'
let g:VM_maps['Visual Subtract']='\\s'
let g:VM_maps['Visual Reduce']='\\r'

let g:VM_maps['Find Next']='n'
let g:VM_maps['Find Prev']='N'
let g:VM_maps['Goto Next']=']'
let g:VM_maps['Goto Prev']='['
let g:VM_maps['Seek Next']='<C-f>'
let g:VM_maps['Seek Prev']='<C-b>'
let g:VM_maps['Skip Region']='q'
let g:VM_maps['Remove Region']='Q'
let g:VM_maps['Slash Search']='g/'
let g:VM_maps['Replace']='R'
let g:VM_maps['Toggle Multiline']='M'

let g:VM_maps['Surround']='S'
let g:VM_maps['Move Right']='<M-S-Right>'
let g:VM_maps['Move Left']='<M-S-Left>'

let g:VM_maps['I Next']='<Tab>'
let g:VM_maps['I Prev']='<S-Tab>'

let g:VM_maps['Select Operator']='s'
let g:VM_maps['Find Operator']='m'


let g:VM_maps['Increase']='<C-A>'
let g:VM_maps['Decrease']='<C-X>'
let g:VM_maps['gIncrease']='g<C-A>'
let g:VM_maps['gDecrease']='g<C-X>'
let g:VM_maps['Alpha-Increase']='\\<C-A>'
let g:VM_maps['Alpha-Decrease']='\\<C-X>'

let g:VM_maps['Transpose']='\\t'
let g:VM_maps['Align']='\\a'
let g:VM_maps['Align Char']='\\<'
let g:VM_maps['Align Regex']='\\>'
let g:VM_maps['Split Regions']='\\s'
let g:VM_maps['Filter Regions']='\\f'
let g:VM_maps['Transform Regions']='\\e'
let g:VM_maps['Rewrite Last Search']='\\r'
let g:VM_maps['Merge Regions']='\\m'
let g:VM_maps['Duplicate']='\\d'
let g:VM_maps['Shrink']='\\-'
let g:VM_maps['Enlarge']='\\+'
let g:VM_maps['One Per Line']='\\L'
let g:VM_maps['Numbers']='\\n'
let g:VM_maps['Numbers Append']='\\N'

let g:VM_maps['Run Normal']='\\z'
let g:VM_maps['Run Visual']='\\v'
let g:VM_maps['Run Ex']='\\x'
let g:VM_maps['Run Last Normal']='\\Z'
let g:VM_maps['Run Last Visual']='\\V'
let g:VM_maps['Run Last Ex']='\\X'
let g:VM_maps['Run Macro']='\\@'

let g:VM_maps['Tools Menu']='\\`'
let g:VM_maps['Case Conversion Menu']='\\C'
let g:VM_maps['Show Registers']='\\"'
let g:VM_maps['Toggle Whole Word']='\\w'
let g:VM_maps['Case Setting']='\\c'
let g:VM_maps['Toggle Mappings']='\\<Space>'
let g:VM_maps['Toggle Single Region']='\\<CR>'

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

" ------------ project -----------------
nnoremap <silent> [p :ProjectBufPrev<cr>
nnoremap <silent> ]p :ProjectBufNext<cr>
nnoremap <silent> [P :ProjectBufFirst<cr>
nnoremap <silent> ]P :ProjectBufLast<cr>
nnoremap <silent> ]v :ProjectBufNext ~/.vim<cr>
nnoremap <silent> [v :ProjectBufPrev ~/.vim<cr>
nnoremap <silent> ]f :ProjectBufNext 'F<cr>
nnoremap <silent> [f :ProjectBufPrev 'F<cr>



" -------------- color scheme ---------------------
let g:molokai_original = 1
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

nnoremap <leader>mv :CocCommand markdown-preview-enhanced.openPreview<cr>
nnoremap gh :CocCommand clangd.switchSourceHeader<CR>

" ------------- coc extensions ------------
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
			\]

" ------------- coc-explorer ----------
nnoremap <leader>e :CocCommand explorer<cr>



" ---------------- telescope -------------

if has('nvim')
	nnoremap <leader><cr> :Telescope builtin<cr>
else
endif

" ---- fzf key map ------

nnoremap <leader>W :Windows<cr>
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
nnoremap <leader>G "9yiw:Rg<space><C-r>9<cr>

" ------------- lazygit --------------

if has('nvim')
	nnoremap <leader>g :LazyGit<cr>
else
	nnoremap <leader>g :!lazygit<cr>
endif

" ----------------- VimuxRunCommand ---------------
nnoremap <leader>\ :VimuxRunCommand ""<cr>


" ----------------- EasyGrep ------------
nnoremap <leader>F "9yiw:Grep<space><C-r>9<cr>


" 自动格式化会将EOF缩进，这样就有问题了，此处将缩进去除
function! RepairLuaScript()
	%s/^\slua << EOF/lua << EOF/g
	%s/^\sEOF/EOF/g
endfunction


augroup autoRunGroup
	autocmd!
	autocmd BufEnter * :ProjectRootCD
	autocmd BufWritePre * :Autoformat
	autocmd BufWritePre *vimrc :call RepairLuaScript()
	autocmd InsertLeave,InsertEnter * :set relativenumber!
	autocmd BufWritePost *vimrc :source ~/.vimrc
	" autocmd BufEnter * :set nomodifiable
augroup END


" ------------------------------------------------------------------------------------------------------



" ---------------- my config ---------------
set showcmd
set nu
set autoread
set autowriteall
set ignorecase smartcase
set incsearch
"set hlsearch
set cmdheight=1
set relativenumber
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
set clipboard=unnamedplus

set enc=utf-8
let &termencoding=&encoding
set fencs=utf-8,ucs-bom,gb18030
set mouse=a




inoremap hh <ESC>
inoremap jj <ESC>
inoremap kk <ESC>
lnoremap ' ''<ESC>i
inoremap ( ()<ESC>i
inoremap " ""<ESC>i
inoremap { {}<ESC>i
inoremap [ []<ESC>i
inoremap oo <ESC>o
inoremap OO <ESC>O
inoremap zz <ESC>zza


nnoremap <leader>tt :tabnew<space>
nnoremap <leader>tn :tabnext<CR>
nnoremap <leader>tp :tabprev<CR>
nnoremap <leader>to :tabonly<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>w <C-w>
nnoremap <leader>s :shell<CR>
nnoremap <leader>rl :w<cr>:source ~/.vimrc<cr>


nnoremap <leader>fc :echo @%<cr>
nnoremap // *
nnoremap ?? #
nnoremap <leader>% ggvG
nnoremap <leader>r "9yiw:%s/<C-r>9//g<Left><Left><C-r>9
nnoremap <leader>R "9yiw:%s/\<<C-r>9\>//g<Left><Left><C-r>9
nnoremap <leader>M :set nomodifiable!<cr>
nnoremap Q @
nnoremap <C-Right> <C-o>
nnoremap <C-Left> <C-i>
nnoremap <leader>// :Dox<cr>
nnoremap <leader>/// :DoxLic<cr>

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

