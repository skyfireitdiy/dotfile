
if has('nvim')
	nnoremap <leader>l :BLines<cr>
	nnoremap <leader>L :Lines<cr>
	nnoremap <leader>gt "9yiw:Tags<space><C-r>9<cr>
	nnoremap <leader>G "9yiw:Rg<space><C-r>9<cr>
else
	"  fzf key map
	nnoremap <leader>b :Buffers<cr>
	nnoremap <leader>f :Files<cr>
	nnoremap <leader>gff :GFiles<cr>
	nnoremap <leader>gf? :GFiles?<cr>
	nnoremap <leader>co :Colors<cr>
	nnoremap <leader>rg :Rg<cr>
	nnoremap <leader>l :BLines<cr>
	nnoremap <leader>L :Lines<cr>
	nnoremap <leader>T :Tags<cr>
	nnoremap <leader>t :BTags<cr>
	nnoremap <leader>gt "9yiw:Tags<space><C-r>9<cr>
	nnoremap <leader>x :Commands<cr>
	nnoremap <leader>k :Maps<cr>
	nnoremap <leader>h :History<cr>
	nnoremap <leader>: :History:<cr>
	nnoremap <leader>/ :History/<cr>
	nnoremap <leader>H :Helptags<cr>
	nnoremap <leader>m :Marks<cr>
	nnoremap <leader>c :BCommits<cr>
	nnoremap <leader>C :Commits<cr>
	nnoremap <leader>G "9yiw:Rg<space><C-r>9<cr>
endif
