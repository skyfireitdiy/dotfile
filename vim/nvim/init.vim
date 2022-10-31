
let mapleader=" " "映射leader键为空格

" 启用轻量化 vim，禁止加载一些重量级插件（比如treesitter），用于打开大文件
let g:light_vim = index(keys(environ()), "LIGHT_VIM") != -1
let g:home_dir = environ()['HOME']
let g:install_vim = !filereadable(g:home_dir.."/.local/share/nvim/site/autoload/plug.vim") || !filereadable(g:home_dir.."/.local/share/nvim/site/autoload/plug.vim")
let g:editor_type = has('nvim') ? 'nvim' : 'vim'
let g:forbidden_editor = g:editor_type == "nvim" ? "vim" : "nvim"
" 使用淘宝镜像加速coc安装
let g:npm_registry = 'https://registry.npm.taobao.org'
let g:load_flags = []
let g:deps_check = [
			\ ['fzf','fzf --version'],
			\ ['lazygit','lazygit --version'],
			\ ['ripgrep','rg --version'],
			\ ['zsh', 'zsh --version'],
			\ ['fish', 'fish version'],
			\ ['universal-ctags', 'ctags --version'],
			\ ['g++', 'g++ --version'],
			\ ['tmux', 'tmux --version'],
			\ ['nodejs', 'node --version'],
			\ ['xsel', 'xsel --version'],
			\ ['npm', 'npm --version'],
			\ ]


if g:install_vim == 1
	let g:light_vim = 0
endif

" 使用表驱动重构vim配置
" 表项含义
"		插件名称 插件配置 插件flag(nvim/vim/heavy一个或者) 插件加载配置
let g:config_table = [
			\ [ 'octol/vim-cpp-enhanced-highlight', 'cpphighlight.vim', ['heavy'] ],
			\ [ 'luochen1990/rainbow','rainbow.vim', ['heavy']],
			\ [ 'majutsushi/tagbar', 'tagbar.vim', ['heavy']],
			\ [ 'inside/vim-search-pulse' ],
			\ [ 'chiel92/vim-autoformat' ,'autoformat.vim'],
			\ [ 'mg979/vim-visual-multi',  'visual-cursor.vim'],
			\ [ 'dbakker/vim-projectroot' ,'project.vim'],
			\ [ 'tpope/vim-fugitive' ],
			\ [ 'vim-scripts/DoxygenToolkit.vim', 'doxygen.vim'],
			\ [ 'vim-airline/vim-airline' ],
			\ [ 'vim-airline/vim-airline-themes' ,'airline-theme.vim'],
			\ [ 'tpope/vim-repeat' ],
			\ [ 't9md/vim-choosewin' ,'choosewin.vim'],
			\ [ 'jszakmeister/vim-togglecursor' ],
			\ [ 'reedes/vim-wheel' ],
			\ [ 'vim-scripts/CursorLineCurrentWindow' ],
			\ [ 'vim-scripts/EasyGrep' ,'easygrep.vim'],
			\ [ 'christoomey/vim-tmux-navigator', 'tmux.vim' ],
			\ [ 'benmills/vimux' ,'VimuxRunCommand.vim'],
			\ [ 'junegunn/fzf' ],
			\ [ 'junegunn/fzf.vim', 'fzf.vim' ],
			\ [ 'tpope/vim-surround' ],
			\ [ 'LeafCage/yankround.vim' ,'yankround.vim'],
			\ [ 'dhruvasagar/vim-table-mode' ],
			\ [ 'vim-scripts/wildfire.vim' ,'wildfire.vim'],
			\ [ 'ryanoasis/vim-devicons' ],
			\ [ 'kyazdani42/nvim-web-devicons'],
			\ [ 'tomasr/molokai' ],
			\ [ 'dracula/vim'],
			\ [ 'sjl/badwolf' ],
			\ [ 'nvim-treesitter/nvim-treesitter', 'treesitter.vim', ['heavy', 'nvim'], "{'do':':TSUpdate'}"],
			\ ['ray-x/lsp_signature.nvim', 'lsp_signature.vim', ['nvim']],
			\ ['m-demare/hlargs.nvim', '', ['nvim']],
			\ ['nvim-lua/plenary.nvim', '', ['nvim']],
			\ ['kdheepak/lazygit.nvim', 'lazygit.vim', ['nvim']],
			\ ['folke/which-key.nvim', 'which-key.vim', ['nvim']],
			\ ['ggandor/lightspeed.nvim', '', ['nvim']],
			\ ['chentoast/marks.nvim', 'marks.vim', ['nvim']],
			\ ['lewis6991/gitsigns.nvim', 'gitsigns.vim', ['nvim']],
			\ ['airblade/vim-gitgutter', 'gitgutter.vim', ['vim']],
			\ ['justinmk/vim-sneak', '', ['vim']],
			\ ['scrooloose/nerdcommenter', '', ['vim']],
			\ ['gcmt/wildfire.vim', 'wildfire.vim', ['vim']],
			\ [ 'echasnovski/mini.nvim','mini.vim',['nvim']],
			\ [ 'shaeinst/roshnivim-cs','',['nvim']],
			\ [ 'tomasiser/vim-code-dark','',['nvim']],
			\ [ 'Mofiqul/vscode.nvim','',['nvim']],
			\ [ 'marko-cerovac/material.nvim','',['nvim']],
			\ [ 'bluz71/vim-nightfly-guicolors','',['nvim']],
			\ [ 'bluz71/vim-moonfly-colors','',['nvim']],
			\ [ 'ChristianChiarulli/nvcode-color-schemes.vim','',['nvim']],
			\ [ 'folke/tokyonight.nvim','',['nvim']],
			\ [ 'sainnhe/sonokai','',['nvim']],
			\ [ 'kyazdani42/blue-moon','',['nvim']],
			\ [ 'mhartington/oceanic-next','',['nvim']],
			\ [ 'glepnir/zephyr-nvim','',['nvim']],
			\ [ 'rockerBOO/boo-colorscheme-nvim','',['nvim']],
			\ [ 'jim-at-jibba/ariake-vim-colors','',['nvim']],
			\ [ 'ishan9299/modus-theme-vim','',['nvim']],
			\ [ 'sainnhe/edge','',['nvim']],
			\ [ 'theniceboy/nvim-deus','',['nvim']],
			\ [ 'Th3Whit3Wolf/one-nvim','',['nvim']],
			\ [ 'PHSix/nvim-hybrid','',['nvim']],
			\ [ 'yonlu/omni.vim','',['nvim']],
			\ [ 'ray-x/aurora','',['nvim']],
			\ [ 'ray-x/starry.nvim','',['nvim']],
			\ [ 'tanvirtin/monokai.nvim','',['nvim']],
			\ [ 'ofirgall/ofirkai.nvim','',['nvim']],
			\ [ 'savq/melange','',['nvim']],
			\ [ 'RRethy/nvim-base16','',['nvim']],
			\ [ 'fenetikm/falcon','',['nvim']],
			\ [ 'andersevenrud/nordic.nvim','',['nvim']],
			\ [ 'shaunsingh/nord.nvim','',['nvim']],
			\ [ 'ishan9299/nvim-solarized-lua','',['nvim']],
			\ [ 'shaunsingh/moonlight.nvim','',['nvim']],
			\ [ 'navarasu/onedark.nvim','',['nvim']],
			\ [ 'lourenci/github-colors','',['nvim']],
			\ [ 'sainnhe/gruvbox-material','',['nvim']],
			\ [ 'sainnhe/everforest','',['nvim']],
			\ [ 'NTBBloodbath/doom-one.nvim','',['nvim']],
			\ [ 'dracula/vim','',['nvim']],
			\ [ 'Mofiqul/dracula.nvim','',['nvim']],
			\ [ 'yashguptaz/calvera-dark.nvim','',['nvim']],
			\ [ 'projekt0n/github-nvim-theme','',['nvim']],
			\ [ 'kdheepak/monochrome.nvim','',['nvim']],
			\ [ 'rose-pine/neovim','',['nvim']],
			\ [ 'catppuccin/nvim','',['nvim']],
			\ [ 'FrenzyExists/aquarium-vim','',['nvim']],
			\ [ 'EdenEast/nightfox.nvim','',['nvim']],
			\ [ 'kvrohit/substrata.nvim','',['nvim']],
			\ [ 'ldelossa/vimdark','',['nvim']],
			\ [ 'Everblush/everblush.nvim','',['nvim']],
			\ [ 'olimorris/onedarkpro.nvim','',['nvim']],
			\ [ 'rmehri01/onenord.nvim','',['nvim']],
			\ [ 'luisiacc/gruvbox-baby','',['nvim']],
			\ [ 'titanzero/zephyrium','',['nvim']],
			\ [ 'rebelot/kanagawa.nvim','',['nvim']],
			\ [ 'tiagovla/tokyodark.nvim','',['nvim']],
			\ [ 'cpea2506/one_monokai.nvim','',['nvim']],
			\ [ 'kvrohit/rasmus.nvim','',['nvim']],
			\ [ 'chrsm/paramount-ng.nvim','',['nvim']],
			\ [ 'kaiuri/nvim-juliana','',['nvim']],
			\ [ 'lmburns/kimbox','',['nvim']],
			\ [ 'rockyzhang24/arctic.nvim','',['nvim']],
			\ [ 'meliora-theme/neovim','',['nvim']],
			\ [ 'Yazeed1s/minimal.nvim','',['nvim']],
			\ [ 'Mofiqul/adwaita.nvim','',['nvim']],
			\ [ 'olivercederborg/poimandres.nvim','',['nvim']],
			\ [ 'tjdevries/gruvbuddy.nvim','',['nvim']],
			\ [ 'ellisonleao/gruvbox.nvim','',['nvim']],
			\ [ 'lalitmee/cobalt2.nvim','',['nvim']],
			\ [ 'neoclide/coc.nvim',  'coc.vim', [], "{'branch': 'master', 'do': 'npm install --registry '..g:npm_registry..' --frozen-lockfile'}"],
			\ [ '', 'zoom.vim'],
			\ [ '', 'custom.vim' ],
			\ [ '', 'keybinding.vim'],
			\ [ '', 'colorscheme.vim' ],
			\ ]

" 增加依赖项检测
function! CheckDeps()
	let flags = 1
	for deps in g:deps_check
		let out = system(deps[1])
		if stridx(out, 'not found') != -1 || stridx(out, 'Unknown command') != -1
			let flags = 0
			if len(deps) > 2
				echo deps[2]
			else
				echo deps[0] .. ' not found!'
			endif
		endif
	endfor
	return flags
endfunction

" 自助安装配置，减少install.sh脚本中的依赖
function! InstallVim()
	if !filereadable(g:home_dir.."/.local/share/nvim/site/autoload/plug.vim")
		" nvim
		echom system("curl -fLo " .. g:home_dir .. "/.local/share/nvim/site/autoload/plug.vim --create-dirs https://ghproxy.com/https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim")
		echom system("mkdir -p " .. g:home_dir .. "/.local/share/nvim/session")
		" vim
		echom system("ln -sf " ..g:home_dir.."/.local/share/nvim/site/autoload "..g:home_dir .. "/.vim/autoload")
		echom system("ln -sf " ..  g:home_dir.."/.config/nvim/* " .. g:home_dir .. "/.vim")
		qa
	endif
endfunction

" 插件加载标记列表（判断某个插件是否需要加载）
function! GetLoadFlags()
	for config in g:config_table
		let properties = []
		if len(config) > 2
			let properties = config[2]
		endif
		if (g:light_vim == 0 || index(properties, "heavy") == -1) && index(properties, g:forbidden_editor) == -1
			let g:load_flags = add(g:load_flags, 1)
		else
			let g:load_flags = add(g:load_flags, 0)
		endif
	endfor
endfunction

" 插件的加载和插件的配置分开
function! LoadPlugin()
	let g:plug_url_format="https://ghproxy.com/https://github.com/%s"
	let plug_install = 0
	call plug#begin()
	let i = 0
	for config in g:config_table
		let plugin = config[0]
		if g:load_flags[i] && plugin != ""
			let plugin_ext = ""
			if len(config) > 3
				let plugin_ext = config[3]
			endif
			let cmd = "Plug '"..plugin.."'"
			if plugin_ext != ""
				let cmd = cmd .. "," .. plugin_ext
			endif
			execute cmd
			let plugin_name = plugin[stridx(plugin, '/') + 1:] 
			if len(readdir(g:editor_type == 'nvim' ? g:home_dir .. '/.local/share/nvim/plugged/'.. plugin_name : g:home_dir .. '/.vim/plugged/'.. plugin_name)) == 0 
				let plug_install = 1
			endif
		endif
		let i = i + 1
	endfor
	call plug#end()
	if plug_install == 1
		execute "PlugInstall"
	endif
endfunction

function! LoadConfig()
	let i = 0
	for config in g:config_table
		let plugin_config = ""
		if len(config) > 1
			let plugin_config = config[1]
		endif
		if g:load_flags[i] && plugin_config != ""
			execute "runtime "..plugin_config
		endif
		let i = i + 1
	endfor
endfunction

" 如果依赖项没有检测通过，不加载任何配置
if CheckDeps() == 1
	if g:install_vim == 1
		call InstallVim()
	endif
	call GetLoadFlags()
	call LoadPlugin()
	call LoadConfig()
endif

