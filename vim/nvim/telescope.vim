
"  telescope

if has('nvim')
lua << EOF
	require('telescope').setup({
		defaults = {
			generic_sorter = require('mini.fuzzy').get_telescope_sorter
		}
	})
EOF
	nnoremap <leader><cr> :Telescope builtin<cr>
	nnoremap <leader>b :Telescope buffers<cr>
	nnoremap <leader>f :Telescope fd<cr>
	nnoremap <leader>gff :Telescope git_files<cr>
	nnoremap <leader>gf? :Telescope git_status<cr>
	nnoremap <leader>co :Telescope colorscheme<cr>
	nnoremap <leader>rg :Telescope grep_string<cr>
	nnoremap <leader>T :Telescope tags<cr>
	nnoremap <leader>t :Telescope current_buffer_tags<cr>
	nnoremap <leader>x :Telescope commands<cr>
	nnoremap <leader>k :Telescope keymaps<cr>
	nnoremap <leader>h :Telescope oldfiles<cr>
	nnoremap <leader>: :Telescope command_history<cr>
	nnoremap <leader>/ :Telescope search_history<cr>
	nnoremap <leader>H :Telescope help_tags<cr>
	nnoremap <leader>m :Telescope marks<cr>
	nnoremap <leader>c :Telescope git_bcommits<cr>
	nnoremap <leader>C :Telescope git_commits<cr>
endif

