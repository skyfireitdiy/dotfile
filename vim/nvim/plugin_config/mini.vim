
lua << EOF
	require('mini.ai').setup()
	require('mini.align').setup()
	-- require('mini.base16').setup()
	require('mini.bufremove').setup()
	-- require('mini.comment').setup()
	-- require('mini.completion').setup()
	require('mini.cursorword').setup()
	require('mini.doc').setup()
	require('mini.fuzzy').setup()
--	require('mini.indentscope').setup()
	-- require('mini.jump').setup()
--	require('mini.jump2d').setup({
--	mappings = {
--		start_jumping = 'g<cr>',
--	}
--	})
	require('mini.map').setup()
	require('mini.misc').setup()
	require('mini.pairs').setup()
	-- require('mini.sessions').setup()
	-- require('mini.starter').setup()
	-- require('mini.statusline').setup()
	-- require('mini.surround').setup()
	require('mini.tabline').setup()
	require('mini.test').setup()
	require('mini.trailspace').setup()
EOF
nnoremap <silent> <leader>z :lua MiniMisc.zoom()<cr>
