
"  treesitter

lua << EOF
require("nvim-treesitter.install").prefer_git = true

for _, config in pairs(require("nvim-treesitter.parsers").get_parser_configs()) do
    config.install_info.url = config.install_info.url:gsub("https://github.com/", "https://ghproxy.com/https://github.com/")
end

ext_tab = {
    "c",
    "lua",
    "cpp",
    "go",
    "bash",
    "make",
    "json",
    "json5",
    "yaml",
    "jsonc",
    "vim" ,
    "javascript",
    "cmake",
    "python"
    }
for _, ext in pairs(vim.g.treesitter_table) do
    table.insert(ext_tab, ext)
end

require'nvim-treesitter.configs'.setup {
    ensure_installed = ext_tab,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<cr>",
            node_incremental = "<cr>",
            scope_incremental = "<cr>",
            node_decremental = "<bs>",
        },
    },
}
EOF
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

