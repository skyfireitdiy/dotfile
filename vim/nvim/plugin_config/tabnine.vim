
lua<<EOF
require('tabnine').setup({
    disable_auto_comment=true,
    accept_keymap="<Right>",
    dismiss_keymap = "<C-]>",
    debounce_ms = 800,
    suggestion_color = {gui = "#808080", cterm = 244},
    exclude_filetypes = {"TelescopePrompt", "NvimTree"},
    log_file_path = nil, -- absolute path to Tabnine log file
})
EOF

let s:tabnine_dir = g:home_dir . '/.local/share/nvim/plugged/tabnine-nvim'

function! tabnine#hasTabnineChat()
    return filereadable(s:tabnine_dir . '/chat/target/release/tabnine_chat')
endfunction

function! tabnine#buildTabnineChat()
    if isdirectory(s:tabnine_dir)
        if tabnine#hasTabnineChat()
            return 1
        else
            echom "tabnine-chat not found, build ..."
            let out = system("cargo build --release --manifest-path " . s:tabnine_dir . '/chat/Cargo.toml')
            if tabnine#hasTabnineChat()
                return 1
            else
                echom "tabnine-chat build failed:" . out
                return 0
            endif
        endif
    else
        return 0
    endif
endfunction

function! tabnine#openTabnineChat() 
    if tabnine#buildTabnineChat() 
        execute 'TabnineChat'
    endif
endfunction

nnoremap <silent> <leader>q :call tabnine#openTabnineCh