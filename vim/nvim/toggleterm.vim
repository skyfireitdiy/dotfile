
lua <<EOF

require("toggleterm").setup{}

local Terminal  = require('toggleterm.terminal').Terminal

local lazygit = Terminal:new({
    cmd = "lazygit",
    dir = "git_dir",
    direction = "float",
    float_opts = {
        border = "double",
    },
    on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
    end,
    on_close = function(term)
        vim.cmd("startinsert!")
    end,
})


local fish_float = Terminal:new({
    cmd = "fish",
    dir = "git_dir",
    direction = "float",
    float_opts = {
        border = "double",
    },
    on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-x>", "<cmd>lua _fish_float_toggle()<CR>", {noremap = true, silent = true})
    end,
})


function _lazygit_toggle()
    lazygit:toggle()
end

function _fish_float_toggle()
    fish_float:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<C-x>", "<cmd>lua _fish_float_toggle()<CR>", {noremap = true, silent = true})



EOF


" By applying the mappings this way you can pass a count to your
" mapping to open a specific window.
" For example: 2<C-t> will open terminal 2
nnoremap <silent><C-s> <Cmd>exe v:count1 . "ToggleTerm"<CR>
tnoremap <silent><C-s> <C-\><C-o><Cmd>exe v:count1 . "ToggleTerm"<CR>
