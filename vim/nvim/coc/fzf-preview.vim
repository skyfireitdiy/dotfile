
nnoremap <silent> <leader>f     :<C-u>CocCommand fzf-preview.GitFiles<CR>
nnoremap <silent> <leader>ff    :<C-u>CocCommand fzf-preview.ProjectFiles<CR>
nnoremap <silent> <leader>gs    :<C-u>CocCommand fzf-preview.GitStatus<CR>
nnoremap <silent> <leader>ga    :<C-u>CocCommand fzf-preview.GitActions<CR>
nnoremap <silent> <leader>b     :<C-u>CocCommand fzf-preview.Buffers<CR>
nnoremap <silent> <leader>B     :<C-u>CocCommand fzf-preview.AllBuffers<CR>
nnoremap <silent> <leader>o     :<C-u>CocCommand fzf-preview.FromResources buffer project_mru<CR>
nnoremap <silent> <leader><C-o> :<C-u>CocCommand fzf-preview.Jumps<CR>
nnoremap <silent> <leader>g;    :<C-u>CocCommand fzf-preview.Changes<CR>
nnoremap <silent> <leader>l     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>
nnoremap <silent> <leader>L     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
nnoremap          <leader>gr    :<C-u>CocCommand fzf-preview.ProjectGrep<Space>
xnoremap          <leader>gr    "sy:CocCommand   fzf-preview.ProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
nnoremap <silent> <leader>q     :<C-u>CocCommand fzf-preview.QuickFix<CR>
nnoremap <silent> <leader>G     "9yiw:CocCommand fzf-preview.ProjectGrep<Space>C-r>9<cr>
nnoremap <silent> <leader>h     :<C-u>CocCommand fzf-preview.ProjectOldFiles<CR>
nnoremap <silent> <leader>:     :<C-u>CocCommand fzf-preview.CommandPalette<CR>
nnoremap <silent> <leader>c     :<C-u>CocCommand fzf-preview.GitCurrentLogs<CR>
nnoremap <silent> <leader>C     :<C-u>CocCommand fzf-preview.GitLogs<CR>
nnoremap <silent> <leader>y     :<C-u>CocCommand fzf-preview.YankRound<CR>
nnoremap <silent> <leader>t     :<C-u>CocCommand fzf-preview.VistaBufferCtags<CR>
nnoremap <silent> <leader>T     :<C-u>CocCommand fzf-preview.VistaCtags<CR>


let g:fzf_preview_use_dev_icons = 1

set shell=/bin/zsh
let $SHELL = "/bin/zsh"

augroup fzf_preview
	autocmd!
	autocmd User fzf_preview#rpc#initialized call s:fzf_preview_settings() " fzf_preview#remote#initialized or fzf_preview#coc#initialized
augroup END

function! s:fzf_preview_settings() abort
	let g:fzf_preview_command = 'COLORTERM=truecolor ' . g:fzf_preview_command
	let g:fzf_preview_grep_preview_cmd = 'COLORTERM=truecolor ' . g:fzf_preview_grep_preview_cmd
endfunction
