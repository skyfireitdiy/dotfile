
let mapleader=" " "映射leader键为空格

runtime plugins.vim

" mini
if has('nvim')
lua << EOF
	require('mini.ai').setup()
	require('mini.align').setup()
	-- require('mini.base16').setup()
	require('mini.bufremove').setup()
	require('mini.comment').setup()
	-- require('mini.completion').setup()
	require('mini.cursorword').setup()
	require('mini.doc').setup()
	require('mini.fuzzy').setup()
	require('mini.indentscope').setup()
	require('mini.jump').setup()
--	require('mini.jump2d').setup({
--	mappings = {
--		start_jumping = 'g<cr>',
--	}
--	})
	require('mini.map').setup()
	require('mini.misc').setup()
	require('mini.pairs').setup()
	require('mini.sessions').setup()
	require('mini.starter').setup()
	-- require('mini.statusline').setup()
	-- require('mini.surround').setup()
	require('mini.tabline').setup()
	require('mini.test').setup()
	require('mini.trailspace').setup()
EOF
endif

" gitsigns
if has('nvim')
lua << EOF
	require('gitsigns').setup()
EOF
endif

"  which-key
if has('nvim')
lua << EOF
	require("which-key").setup {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	}
EOF
endif

" marks
if has('nvim')
lua << EOF
	require'marks'.setup {
		-- whether to map keybinds or not. default true
		default_mappings = true,
		-- which builtin marks to show. default {}
		builtin_marks = { ".", "<", ">", "^" },
		-- whether movements cycle back to the beginning/end of buffer. default true
		cyclic = true,
		-- whether the shada file is updated after modifying uppercase marks. default false
		force_write_shada = false,
		-- how often (in ms) to redraw signs/recompute mark positions.
		-- higher values will have better performance but may cause visual lag,
		-- while lower values may cause performance penalties. default 150.
		refresh_interval = 250,
		-- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
		-- marks, and bookmarks.
		-- can be either a table with all/none of the keys, or a single number, in which case
		-- the priority applies to all marks.
		-- default 10.
		sign_priority = { lower=10, upper=15, builtin=8, bookmark=20 },
		-- disables mark tracking for specific filetypes. default {}
		excluded_filetypes = {},
		-- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
		-- sign/virttext. Bookmarks can be used to group together positions and quickly move
		-- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
		-- default virt_text is "".
		bookmark_0 = {
			sign = "⚑",
			virt_text = "hello world",
			-- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
			-- defaults to false.
			annotate = false,
			},
			mappings = {}
	}
EOF
endif


"  lsp_signature

if has('nvim')
lua << EOF
	cfg = {
		debug = false, -- set to true to enable debug logging
		log_path = vim.fn.stdpath("cache") .. "/lsp_signature.log", -- log dir when debug is on
		-- default is  ~/.cache/nvim/lsp_signature.log
		verbose = false, -- show debug line number

		bind = true, -- This is mandatory, otherwise border config won't get registered.
		-- If you want to hook lspsaga or other signature handler, pls set to false
		doc_lines = 10, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
		-- set to 0 if you DO NOT want any API comments be shown
		-- This setting only take effect in insert mode, it does not affect signature help in normal
		-- mode, 10 by default

		max_height = 12, -- max height of signature floating_window
		max_width = 80, -- max_width of signature floating_window
		wrap = true, -- allow doc/signature text wrap inside floating_window, useful if your lsp return doc/sig is too long

		floating_window = true, -- show hint in a floating window, set to false for virtual text only mode

		floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
		-- will set to true when fully tested, set to false will use whichever side has more space
		-- this setting will be helpful if you do not want the PUM and floating win overlap

		floating_window_off_x = 1, -- adjust float windows x position.
		floating_window_off_y = 0, -- adjust float windows y position. e.g -2 move window up 2 lines; 2 move down 2 lines

		close_timeout = 4000, -- close floating window after ms when laster parameter is entered
		fix_pos = false,  -- set to true, the floating window will not auto-close until finish all parameters
		hint_enable = true, -- virtual hint enable
		hint_prefix = "🐼 ",  -- Panda for parameter, NOTE: for the terminal not support emoji, might crash
		hint_scheme = "String",
		hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
		handler_opts = {
			border = "rounded"   -- double, rounded, single, shadow, none
			},

			always_trigger = false, -- sometime show signature on new line or in middle of parameter can be confusing, set it to false for #58

			auto_close_after = nil, -- autoclose signature float win after x sec, disabled if nil.
			extra_trigger_chars = {}, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
			zindex = 200, -- by default it will be on top of all floating windows, set to <= 50 send it to bottom

			padding = '', -- character to pad on left and right of signature can be ' ', or '|'  etc

			transparency = nil, -- disabled by default, allow floating win transparent value 1~100
			shadow_blend = 36, -- if you using shadow as border use this set the opacity
			shadow_guibg = 'Black', -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
			timer_interval = 200, -- default timer check interval set to lower value if you want to reduce latency
			toggle_key = nil, -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'

			select_signature_key = nil, -- cycle to next signature, e.g. '<M-n>' function overloading
			move_cursor_key = nil, -- imap, use nvim_set_current_win to move cursor between current win and floating
	}

	-- recommended:
	require'lsp_signature'.setup(cfg) -- no need to specify bufnr if you don't use toggle_key

	-- You can also do this inside lsp on_attach
	-- note: on_attach deprecated
	require'lsp_signature'.on_attach(cfg, bufnr) -- no need to specify bufnr if you don't use toggle_key

EOF
endif


"  treesitter

if has('nvim')
lua << EOF
	for _, config in pairs(require("nvim-treesitter.parsers").get_parser_configs()) do
		config.install_info.url = config.install_info.url:gsub("https://github.com/", "https://ghproxy.com/https://github.com/")
		end

		require'nvim-treesitter.configs'.setup {
			-- A list of parser names, or "all"
			ensure_installed = { "c", "lua", "rust", "cpp", "go", "bash", "make", "json", "json5", "yaml", "jsonc", "julia", "c_sharp", "vim" ,"javascript"},

			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,

			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = true,

			-- List of parsers to ignore installing (for "all")
			ignore_install = { },

			-- If you need to change the installation directory of the parsers (see -> Advanced Setup)
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

	"  lazygit

	if has('nvim')
		let g:lazygit_floating_window_winblend = 0 " transparency of floating window
		let g:lazygit_floating_window_scaling_factor = 0.9 " scaling factor for floating window
		let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
		let g:lazygit_floating_window_use_plenary = 0 " use plenary.nvim to manage floating window if available
		let g:lazygit_use_neovim_remote = 1 " fallback to 0 if neovim-remote is not installed
	endif

	"  tmux
	let g:tmux_navigator_save_on_switch = 2
	let g:tmux_navigator_disable_when_zoomed = 1

	"  tagbar
	nnoremap gt :Tagbar<cr>


	"  airline theme
	let g:airline_theme='dracula'


	"  gitgutter
	function! GitStatus()
		let [a,m,r] = GitGutterGetHunkSummary()
		return printf('+%d ~%d -%d', a, m, r)
	endfunction
	set statusline+=%{GitStatus()}


	let g:gitgutter_highlight_lines = 1
	let g:gitgutter_highlight_linenrs = 1

	"  choosewin
	let g:choosewin_overlay_enable = 1
	nnoremap ` :ChooseWin<cr>

	"  visual cursor
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
	let g:VM_maps['Toggle Single Region']='\\<cr>'



	"  cpp highlight
	let g:cpp_class_scope_highlight = 1
	let g:cpp_member_variable_highlight = 1
	let g:cpp_class_decl_highlight = 1
	let g:cpp_posix_standard = 1
	let g:cpp_experimental_simple_template_highlight = 1
	let g:cpp_experimental_template_highlight = 1
	let g:cpp_concepts_highlight = 1
	let g:cpp_no_function_highlight = 1

	"  rainbow
	let g:rainbow_active = 1

	"  project
	nnoremap <silent> [p :ProjectBufPrev<cr>
	nnoremap <silent> ]p :ProjectBufNext<cr>
	nnoremap <silent> [P :ProjectBufFirst<cr>
	nnoremap <silent> ]P :ProjectBufLast<cr>
	nnoremap <silent> ]v :ProjectBufNext ~/.vim<cr>
	nnoremap <silent> [v :ProjectBufPrev ~/.vim<cr>
	nnoremap <silent> ]f :ProjectBufNext 'F<cr>
	nnoremap <silent> [f :ProjectBufPrev 'F<cr>



	"  color scheme
	let g:molokai_original = 1
	let g:rehash256 = 1
	"color molokai
	color dracula
	"color badwolf


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

	" GoTo code navigation.
	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> gy <Plug>(coc-type-definition)
	nmap <silent> gi <Plug>(coc-implementation)
	nmap <silent> gr <Plug>(coc-references)

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
				\]

	"  coc-explorer
	nnoremap <leader>e :CocCommand explorer<cr>


	"  telescope

	if has('nvim')
lua << EOF
		require('telescope').setup({
		defaults = {
			generic_sorter = require('mini.fuzzy').get_telescope_sorter
		}
		})
EOF
		nnoremap <leader><cr> :Telescope builtin<cr>
	endif

	if has('nvim')
		" telescope
		nnoremap <leader>b :Telescope buffers<cr>
		nnoremap <leader>f :Telescope fd<cr>
		nnoremap <leader>gff :Telescope git_files<cr>
		nnoremap <leader>gf? :Telescope git_status<cr>
		nnoremap <leader>co :Telescope colorscheme<cr>
		nnoremap <leader>rg :Telescope grep_string<cr>
		nnoremap <leader>l :BLines<cr>
		nnoremap <leader>L :Lines<cr>
		nnoremap <leader>T :Telescope tags<cr>
		nnoremap <leader>t :Telescope current_buffer_tags<cr>
		nnoremap <leader>gt "9yiw:Tags<space><C-r>9<cr>
		nnoremap <leader>x :Telescope commands<cr>
		nnoremap <leader>k :Telescope keymaps<cr>
		nnoremap <leader>h :Telescope oldfiles<cr>
		nnoremap <leader>: :Telescope command_history<cr>
		nnoremap <leader>/ :Telescope search_history<cr>
		nnoremap <leader>H :Telescope help_tags<cr>
		nnoremap <leader>m :Telescope marks<cr>
		nnoremap <leader>c :Telescope git_bcommits<cr>
		nnoremap <leader>C :Telescope git_commits<cr>
		nnoremap <leader>G "9yiw:Rg<space><C-r>9<cr>
	else
		"  fzf key map
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
	endif
	"  lazygit

	if has('nvim')
		nnoremap <leader>g :LazyGit<cr>
	else
		nnoremap <leader>g :!lazygit<cr>
	endif

	"  VimuxRunCommand
	nnoremap <leader>\ :VimuxRunCommand ""<cr>


	"  EasyGrep
	nnoremap <leader>F "9yiw:Grep<space><C-r>9<cr>


	" 自动格式化会将EOF缩进，这样就有问题了，此处将缩进去除
	function! RepairVimScript()
		%s/^\s*lua << EOF/lua << EOF/g
		%s/^\s*EOF/EOF/g
	endfunction

	augroup autoRunGroup
		autocmd!
		autocmd BufEnter * :ProjectRootCD
		autocmd BufLeave * stopinsert 
		autocmd BufWritePre *.cpp,*.c,*.go,*.h,*.rs,*.json,*.yaml,dockerfile,makefile,CMakeLists.txt :Autoformat
		autocmd InsertLeave,InsertEnter * :set relativenumber!
		autocmd BufWritePost *vimrc :source ~/.vimrc
		" autocmd BufEnter * :set nomodifiable
	augroup END

	"  doxygen
	nnoremap <leader>// :Dox<cr>
	nnoremap <leader>/// :DoxLic<cr>



	"

	"  my function

	"

	"  my config
	set nobackup
	set nowritebackup
	set updatetime=300
	set signcolumn=yes
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
	set timeoutlen=500


	if !has('nvim')
		lnoremap ' ''<ESC>i
		inoremap ( ()<ESC>i
		inoremap " ""<ESC>i
		inoremap { {}<ESC>i
		inoremap [ []<ESC>i
	endif


	inoremap hh <ESC>
	inoremap jj <ESC>
	inoremap kk <ESC>
	inoremap oo <ESC>o
	inoremap OO <ESC>O
	inoremap zz <ESC>zza

	if has('nvim')
		nnoremap <leader>z :lua MiniMisc.zoom()<cr>
	else
		function! Zoom ()
			" check if is the zoomed state (tabnumber > 1 && window == 1)
			if tabpagenr('$') > 1 && tabpagewinnr(tabpagenr(), '$') == 1
				let l:cur_winview = winsaveview()
				let l:cur_bufname = bufname('')
				tabclose

				" restore the view
				if l:cur_bufname == bufname('')
					call winrestview(cur_winview)
				endif
			else
				tab split
			endif
		endfunction
		nnoremap <leader>z :call Zoom()<cr>
	endif



	nnoremap <leader>tt :tabnew<space>
	nnoremap <leader>tn :tabnext<cr>
	nnoremap <leader>tp :tabprev<cr>
	nnoremap <leader>to :tabonly<cr>
	nnoremap <leader>tc :tabclose<cr>

	nnoremap <leader>w <C-w>
	if has('nvim')
		nnoremap <leader>s :terminal<cr>
		nnoremap <leader>SS :lua MiniSessions.select()<cr>
		nnoremap <leader>SW :lua MiniSessions.Write('',nil)<Left><Left><Left><Left><Left><Left>
	else
		nnoremap <leader>s :shell<cr>
	endif
	nnoremap <leader>rl :w<cr>:source ~/.vimrc<cr>
	nnoremap <leader>? :set hlsearch!<cr>

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

	nnoremap <Up> k
	nnoremap <Down> j
	nnoremap <Left> h
	nnoremap <Right> l
	nnoremap gh 0
	nnoremap gl $
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
	vnoremap g<Left> 0
	vnoremap g<Right> $
	vnoremap g<Down> 25jzz
	vnoremap g<Up> 25kzz

