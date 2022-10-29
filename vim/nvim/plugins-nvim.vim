if has('nvim')
	if g:light_vim == 0
			Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " treesitter
	endif

	Plug 'ray-x/lsp_signature.nvim' " 函数签名展示
	Plug 'm-demare/hlargs.nvim' " 参数高亮
	Plug 'nvim-lua/plenary.nvim'
	Plug 'kdheepak/lazygit.nvim' " lazygit
	Plug 'folke/which-key.nvim' " 显示可能的快捷键
	Plug 'ggandor/lightspeed.nvim' " 增强的s键快速定位
	Plug 'chentoast/marks.nvim' " 书签管理
	Plug 'lewis6991/gitsigns.nvim' " git签名


	" treesitter主题

	Plug 'shaeinst/roshnivim-cs'
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
	Plug 'ishan9299/modus-theme-vim'
	Plug 'sainnhe/edge'
	Plug 'theniceboy/nvim-deus'
	Plug 'Th3Whit3Wolf/one-nvim'
	Plug 'PHSix/nvim-hybrid'
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
	Plug 'projekt0n/github-nvim-theme'
	Plug 'kdheepak/monochrome.nvim'
	Plug 'rose-pine/neovim'
	Plug 'catppuccin/nvim'
	Plug 'FrenzyExists/aquarium-vim'
	Plug 'EdenEast/nightfox.nvim'
	Plug 'kvrohit/substrata.nvim'
	Plug 'ldelossa/vimdark'
	Plug 'Everblush/everblush.nvim'
	Plug 'olimorris/onedarkpro.nvim'
	Plug 'rmehri01/onenord.nvim'
	Plug 'echasnovski/mini.nvim'
	Plug 'luisiacc/gruvbox-baby'
	Plug 'titanzero/zephyrium'
	Plug 'rebelot/kanagawa.nvim'
	Plug 'tiagovla/tokyodark.nvim'
	Plug 'cpea2506/one_monokai.nvim'
	Plug 'kvrohit/rasmus.nvim'
	Plug 'chrsm/paramount-ng.nvim'
	Plug 'kaiuri/nvim-juliana'
	Plug 'lmburns/kimbox'
	Plug 'rockyzhang24/arctic.nvim'
	Plug 'meliora-theme/neovim'
	Plug 'Yazeed1s/minimal.nvim'
	Plug 'Mofiqul/adwaita.nvim'
	Plug 'olivercederborg/poimandres.nvim'

	" lua 主题

	Plug 'tjdevries/gruvbuddy.nvim'
	Plug 'ellisonleao/gruvbox.nvim'
	Plug 'lalitmee/cobalt2.nvim'
endif