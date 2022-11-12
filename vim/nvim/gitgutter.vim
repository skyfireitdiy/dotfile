
if !has('nvim')
    "  gitgutter
    function! GitStatus()
        let [a,m,r] = GitGutterGetHunkSummary()
        return printf('+%d ~%d -%d', a, m, r)
    endfunction
    set statusline+=%{GitStatus()}


    let g:gitgutter_highlight_lines = 1
    let g:gitgutter_highlight_linenrs = 1

endif
