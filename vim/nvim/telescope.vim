


lua <<EOF
-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    },
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
require('telescope').load_extension('session-lens')


EOF



nnoremap ``t :Telescope<cr>
nnoremap <leader>SS :SearchSession<cr>



nnoremap  <leader>co :Telescope colorscheme<cr>
nnoremap  <leader>rg :Telescope grep_string<cr>
nnoremap  <leader>m :Telescope marks<cr>
nnoremap  <leader>k :Telescope keymaps<cr>
nnoremap  <leader>H :Telescope help_tags<cr>
nnoremap  <leader>t :Telescope current_buffer_tags<cr>
nnoremap  <leader>T :Telescope tags<cr>

nnoremap <leader>ff     :Telescope find_files<CR>
nnoremap <leader>f      :Telescope git_files<CR>
nnoremap <leader>gs     :Telescope git_status<CR>
nnoremap <leader>b      :Telescope buffers<CR>
nnoremap <leader>l      :Telescope current_buffer_fuzzy_find<CR>
nnoremap <leader>h      :Telescope oldfiles<CR>
nnoremap <leader>:      :Telescope command_history<CR>
nnoremap <leader>/      :Telescope search_history<CR>
nnoremap <leader>gc     :Telescope git_bcommits<CR>
nnoremap <leader>gC     :Telescope git_commits<CR>
nnoremap <leader>x      :Telescope commands<CR>

