
"  treesitter

lua << EOF
local ok_install, ts_install = pcall(require, "nvim-treesitter.install")
local ok_parsers, ts_parsers = pcall(require, "nvim-treesitter.parsers")
local ok_config, ts_config = pcall(require, "nvim-treesitter.config")

if ok_install then
    ts_install.prefer_git = true
end

if ok_parsers then
    for _, config in pairs(ts_parsers) do
        if type(config) == "table" and config.install_info and config.install_info.url then
            config.install_info.url = config.install_info.url:gsub("https://github.com/", vim.api.nvim_get_var("github_proxy") .. "https://github.com/")
        end
    end
end

if ok_config then
    local ext_tab = {
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
    for _, ext in pairs(vim.g.treesitter_config_table) do
        table.insert(ext_tab, ext)
    end

    ts_config.setup {
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
end
EOF
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

