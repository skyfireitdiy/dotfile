
"  treesitter

if has('nvim')
lua << EOF
	for _, config in pairs(require("nvim-treesitter.parsers").get_parser_configs()) do
		config.install_info.url = config.install_info.url:gsub("https://github.com/", "https://ghproxy.com/https://github.com/")
	end

	require'nvim-treesitter.configs'.setup {
		ensure_installed = { "c", "lua", "rust", "cpp", "go", "bash", "make", "json", "json5", "yaml", "jsonc", "julia", "c_sharp", "vim" ,"javascript"},
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<leader><cr>",
				node_incremental = "<leader><cr>",
				scope_incremental = "<leader><cr>",
				node_decremental = "<leader><bs>",
			},
		},
		indent = {
			enable = true,
		},
	}
EOF
	set foldmethod=expr
	set foldexpr=nvim_treesitter#foldexpr()
endif

