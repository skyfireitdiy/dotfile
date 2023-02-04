
lua <<EOF

vim.opt.termguicolors = true

vim.cmd [[highlight IndentBlanklineIndentBg1 guibg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndentBg2 guibg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndentBg3 guibg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndentBg4 guibg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndentBg5 guibg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndentBg6 guibg=#C678DD gui=nocombine]]


vim.cmd [[highlight IndentBlanklineIndent1 guifg=#803632 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#826035 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#446134 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#235361 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#305878 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#633467 gui=nocombine]]

vim.opt.list = true
vim.opt.listchars:append "space: "
vim.opt.listchars:append "eol: "

require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
    show_end_of_line = true,
    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
--    space_char_highlight_list = {
--        "IndentBlanklineIndentBg1",
--        "IndentBlanklineIndentBg2",
--        "IndentBlanklineIndentBg3",
--        "IndentBlanklineIndentBg4",
--        "IndentBlanklineIndentBg5",
--        "IndentBlanklineIndentBg6",
--    },
}


EOF
