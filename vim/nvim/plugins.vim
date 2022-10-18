
let g:plug_url_format='https://ghproxy.com/https://github.com/%s'

call plug#begin()  " 插件管理
Plug 'neoclide/coc.nvim', {'branch': 'release'} " coc插件，提供lsp等功能
Plug 'mg979/vim-visual-multi', {'branch': 'master'} " 多光标
Plug 'chiel92/vim-autoformat' " 格式化
Plug 'gcmt/wildfire.vim' " 回车按照层级选中
Plug 'dbakker/vim-projectroot' " 自动进入项目根目录
Plug 'tpope/vim-fugitive' " git封装
Plug 'vim-scripts/DoxygenToolkit.vim' " doxygen 注释
Plug 'vim-airline/vim-airline' " 状态栏
Plug 'vim-airline/vim-airline-themes' " 状态栏主题
Plug 'luochen1990/rainbow' " 彩虹括号
Plug 'octol/vim-cpp-enhanced-highlight' " c++ 增强的语法高亮
Plug 'majutsushi/tagbar' " 标签栏
Plug 'tpope/vim-repeat' " 增强.操作
Plug 't9md/vim-choosewin' " 快速选择窗口
Plug 'airblade/vim-gitgutter' " git状态显示
Plug 'jszakmeister/vim-togglecursor' " 光标形状
Plug 'reedes/vim-wheel' " 保持光标不动，屏幕滚动
Plug 'inside/vim-search-pulse' " 搜索到匹配的时候会闪烁高亮
"Plug 'joeytwiddle/sexy_scroller.vim' " 平滑滚动，有时候屏幕会闪动
Plug 'vim-scripts/CursorLineCurrentWindow' " 高亮显示激活窗口的当前行
Plug 'kabbamine/zeavim.vim' " zeal 文档
Plug 'vim-scripts/EasyGrep' " 查找替换
Plug 'christoomey/vim-tmux-navigator' " tmux pane跳转
Plug 'benmills/vimux' " tmux 终端集成
Plug 'junegunn/fzf' " fzf 模糊查找
Plug 'junegunn/fzf.vim' " fzf 模糊查找
Plug 'tpope/vim-surround' " 快速修改包围类型

Plug 'ryanoasis/vim-devicons' " 图标
Plug 'kyazdani42/nvim-web-devicons'


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
	Plug 'ray-x/lsp_signature.nvim' " 函数签名展示
	Plug 'folke/which-key.nvim' " 显示可能的快捷键
	Plug 'ggandor/lightspeed.nvim' " 增强的s键快速定位
	Plug 'm-demare/hlargs.nvim' " 参数高亮
	Plug 'gennaro-tedesco/nvim-peekup' " 寄存器管理
	Plug 'chentoast/marks.nvim' " 书签管理
	Plug 'lewis6991/gitsigns.nvim' " git签名

	" treesitter主题

	Plug 'shaeinst/roshnivim-cs'
	Plug 'rafamadriz/neon'
	Plug 'tomasiser/vim-code-dark'
	Plug 'Mofiqul/vscode.nvim'
	Plug 'marko-cerovac/material.nvim'
	Plug 'bluz71/vim-nightfly-guicolors'
	Plug 'bluz71/vim-moonfly-colors'
	Plug 'ChristianChiarulli/nvcode-color-schemes.vim'
	Plug 'folke/tokyonight.nvim'
	Plug 'sainnhe/sonokai'
	Plug 'kyazdani42/blue-moon'
	Plug 'mhartington/oceanic-next'
	Plug 'glepnir/zephyr-nvim'
	Plug 'rockerBOO/boo-colorscheme-nvim'
	Plug 'jim-at-jibba/ariake-vim-colors'
	Plug 'Th3Whit3Wolf/onebuddy'
	Plug 'ishan9299/modus-theme-vim'
	Plug 'sainnhe/edge'
	Plug 'theniceboy/nvim-deus'
	Plug 'bkegley/gloombuddy'
	Plug 'Th3Whit3Wolf/one-nvim'
	Plug 'PHSix/nvim-hybrid'
	Plug 'Th3Whit3Wolf/space-nvim'
	Plug 'yonlu/omni.vim'
	Plug 'ray-x/aurora'
	Plug 'ray-x/starry.nvim'
	Plug 'tanvirtin/monokai.nvim'
	Plug 'ofirgall/ofirkai.nvim'
	Plug 'savq/melange'
	Plug 'RRethy/nvim-base16'
	Plug 'fenetikm/falcon'
	Plug 'andersevenrud/nordic.nvim'
	Plug 'shaunsingh/nord.nvim'
	Plug 'ishan9299/nvim-solarized-lua'
	Plug 'shaunsingh/moonlight.nvim'
	Plug 'navarasu/onedark.nvim'
	Plug 'lourenci/github-colors'
	Plug 'sainnhe/gruvbox-material'
	Plug 'sainnhe/everforest'
	Plug 'NTBBloodbath/doom-one.nvim'
	Plug 'dracula/vim'
	Plug 'Mofiqul/dracula.nvim'
	Plug 'yashguptaz/calvera-dark.nvim'
	Plug 'nxvu699134/vn-night.nvim'
	Plug 'adisen99/codeschool.nvim'
	Plug 'projekt0n/github-nvim-theme'
	Plug 'kdheepak/monochrome.nvim'
	Plug 'rose-pine/neovim'
	Plug 'mcchrish/zenbones.nvim'
	Plug 'catppuccin/nvim'
	Plug 'FrenzyExists/aquarium-vim'
	Plug 'EdenEast/nightfox.nvim'
	Plug 'kvrohit/substrata.nvim'
	Plug 'ldelossa/vimdark'
	Plug 'Everblush/everblush.nvim'
	Plug 'adisen99/apprentice.nvim'
	Plug 'olimorris/onedarkpro.nvim'
	Plug 'rmehri01/onenord.nvim'
	Plug 'RishabhRD/gruvy'
	Plug 'echasnovski/mini.nvim'
	Plug 'luisiacc/gruvbox-baby'
	Plug 'titanzero/zephyrium'
	Plug 'rebelot/kanagawa.nvim'
	Plug 'tiagovla/tokyodark.nvim'
	Plug 'cpea2506/one_monokai.nvim'
	Plug 'phha/zenburn.nvim'
	Plug 'kvrohit/rasmus.nvim'
	Plug 'chrsm/paramount-ng.nvim'
	Plug 'kaiuri/nvim-juliana'
	Plug 'lmburns/kimbox'
	Plug 'rockyzhang24/arctic.nvim'
	Plug 'meliora-theme/neovim'
	Plug 'Yazeed1s/minimal.nvim'
	Plug 'lewpoly/sherbet.nvim'
	Plug 'Mofiqul/adwaita.nvim'
	Plug 'olivercederborg/poimandres.nvim'

	" lua 主题

	Plug 'tjdevries/gruvbuddy.nvim'
	Plug 'ellisonleao/gruvbox.nvim'
	Plug 'metalelf0/jellybeans-nvim'
	Plug 'lalitmee/cobalt2.nvim'

else
	Plug 'justinmk/vim-sneak' " s键快速查找
	Plug 'scrooloose/nerdcommenter' " 快速注释
endif

call plug#end()

