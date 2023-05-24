lua <<EOF

local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.code_actions.gitsigns,
    },
})

EOF

nnoremap <silent> <leader>na :lua vim.lsp.buf.code_action()<CR>
