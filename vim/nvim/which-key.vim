
if has('nvim')
lua << EOF
require("which-key").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    triggers_blacklist = {
        i = { "j", "k", "o", "O", "z", "h"},
        v = { "j", "k" },
        n = { "v", "V", "<C-v>" }
    }
}
EOF
endif

