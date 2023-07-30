


lua <<EOF


local noremap = { noremap = true, silent = true }
local command_center = require("command_center")

command_center.add({
  {desc="Opencommand_center",cmd=":Telescope command_center<CR>",keys={{"n","``c",noremap},}},
}, {
  mode = command_center.mode.SET
})

for i, value in ipairs(vim.g.quick_start_config) do
    command_center.add({
        {desc=value[1], cmd=value[2]},
    }, {
        mode = command_center.mode.ADD_SET
  })
end

-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
require('telescope').setup {}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function

require('telescope').load_extension('session-lens')
require('telescope').load_extension('command_center')

EOF

nnoremap <silent>``` :Telescope<CR>
nnoremap <silent><leader>s :SearchSession<CR>
nnoremap <silent>``co :Telescope colorscheme<cr>
nnoremap <silent>``rg :Telescope live_grep<cr>
nnoremap <silent>``m :Telescope marks<cr>
nnoremap <silent>``k :Telescope keymaps<cr>
nnoremap <silent><leader>H :Telescope help_tags<cr>
nnoremap <silent>``t :Telescope tags<cr>
nnoremap <silent>``fF :Telescope find_files<CR>
nnoremap <silent>``ff :Telescope git_files<CR>
nnoremap <silent>``gs :Telescope git_status<CR>
nnoremap <silent>``b :Telescope buffers<CR>
nnoremap <silent>``l :Telescope current_buffer_fuzzy_find<CR>
nnoremap <silent>``h :Telescope oldfiles<CR>
nnoremap <silent>``: :Telescope command_history<CR>
nnoremap <silent>``/ :Telescope search_history<CR>
nnoremap <silent>``gc :Telescope git_bcommits<CR>
nnoremap <silent>``gC :Telescope git_commits<CR>
nnoremap <silent>``x :Telescope commands<CR>
nnoremap <silent>``G :Telescope grep_string<CR>

nnoremap <silent><leader>gd :Telescope git_diffs diff_commits<CR>
nnoremap <silent><leader>C :Telescope coc<CR>
nnoremap <silent><leader>fa :Telescope adjacent<CR>
nnoremap <silent><leader>j :Telescope jumplist<CR>

nnoremap <silent><leader>E :Telescope file_browser<CR>
