


function! vimspector#StartDebug()
    " 判断有没有调试配置
    let pwd = getcwd()
    let config_file = pwd."/.vimspector.json"
    if !filereadable(config_file)
        " 配置文件不存在，拷贝默认的配置文件，然后编辑
        execute "!cp ~/.config/nvim/vimspector_template.json ".config_file
    endif
    execute "e ".config_file
endfunction



nmap <silent><nowait><leader>dn <Plug>VimspectorStepOver
nmap <A-n> <Plug>VimspectorStepOver
nmap <silent><nowait><leader>db <Plug>VimspectorToggleBreakpoint
nmap <A-b> <Plug>VimspectorToggleBreakpoint

" nmap <silent><nowait><leader>ds <Plug>VimspectorContinue
nmap <silent><nowait><leader>ds <Plug>VimspectorContinue
nmap <silent><nowait><leader>dd :call vimspector#StartDebug()<CR>

nmap <silent><nowait><leader>dr <Plug>VimspectorRestart
nmap <silent><nowait><leader>dp <Plug>VimspectorPause
nmap <silent><nowait><leader>dt <Plug>VimspectorStop
nmap <silent><nowait><leader>dF <Plug>VimspectorAddFunctionBreakpoint
nmap <silent><nowait><leader>dC <Plug>VimspectorToggleConditionalBreakpoint
nmap <silent><nowait><leader>do <Plug>VimspectorStepOut
nmap <A-o> <Plug>VimspectorStepOut
nmap <silent><nowait><leader>di <Plug>VimspectorStepInto
nmap <A-i> <Plug>VimspectorStepInto
nmap <silent><nowait><leader>dq :<C-u>VimspectorReset<CR>
nmap <silent><nowait><leader>dlc <Plug>VimspectorShowOutput Console<CR>
nmap <silent><nowait><leader>dld <Plug>VimspectorShowOutput stderr<CR>
nmap <silent><nowait><leader>dlo <Plug>VimspectorShowOutput Vimspector-out<CR>
nmap <silent><nowait><leader>dle <Plug>VimspectorShowOutput Vimspector-err<CR>
nmap <silent><nowait><leader>dls <Plug>VimspectorShowOutput server<CR>
nmap <silent><nowait><leader>dlt <Plug>VimspectorShowOutput Telemetry<CR>
nmap <silent><nowait><leader>de :<C-u>VimspectorEval<space>
nmap <silent><nowait><leader>dw :<C-u>VimspectorWatch<space>
nmap <A-w> :<C-u>VimspectorWatch<space>



nmap <silent><nowait><leader>dlc <Plug>VimspectorShowOutput Console<CR>
nmap <silent><nowait><leader>dld <Plug>VimspectorShowOutput stderr<CR>
nmap <silent><nowait><leader>dlo <Plug>VimspectorShowOutput Vimspector-out<CR>
nmap <silent><nowait><leader>dle <Plug>VimspectorShowOutput Vimspector-err<CR>
nmap <silent><nowait><leader>dls <Plug>VimspectorShowOutput server<CR>
nmap <silent><nowait><leader>dlt <Plug>VimspectorShowOutput Telemetry<CR>

let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools', 'CodeLLDB', 'debugpy', 'local-lua-debugger-vscode']
