

function! toggleterm#CreateToggleWindow()

lua <<EOF
    local Terminal  = require('toggleterm.terminal').Terminal


    fish_float = Terminal:new({
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


    lazygit = Terminal:new({
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


EOF
endfunction


augroup AutoToggleWin
autocmd!
autocmd SessionLoadPost * :call toggleterm#CreateToggleWindow()
autocmd VimEnter * :call toggleterm#CreateToggleWindow()
augroup END


lua <<EOF
    require("toggleterm").setup{}


    function _lazygit_toggle()
        lazygit:toggle()
    end

    function _fish_float_toggle()
        fish_float:toggle()
    end

    vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "<C-x>", "<cmd>lua _fish_float_toggle()<CR>", {noremap = true, silent = true})
EOF


" By applying the mappings this way you can pass a count to your
" mapping to open a specific window.
" For example: 2<C-t> will open terminal 2
nnoremap <silent><C-s> <Cmd>exe v:count1 . "ToggleTerm"<CR>
tnoremap <silent><C-s> <C-\><C-o><Cmd>exe v:count1 . "ToggleTerm"<CR>
