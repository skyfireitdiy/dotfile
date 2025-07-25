
" 自动格式化会将EOF缩进，这样就有问题了，此处将缩进去除
function! custom#RepairVimScript()
    %s/^\s*lua << EOF/lua << EOF/g
    %s/^\s*EOF/EOF/g
endfunction

function! custom#BackgroundBuffer()
    let buffers = range(1, bufnr('$'))
    return filter(buffers, 'buflisted(v:val) && index(tabpagebuflist(tabpagenr()),v:val) == -1') " 所有buffer
endfunction

function! custom#isNormalBufferName(filename)
    return a:filename != "" && a:filename !~ "__.*__" && a:filename !~ "\\[.*\\]"
endfunction

function! custom#SpecialBuffer()
    let bufs = range(1, bufnr('$'))
    return filter(bufs,'!custom#isNormalBufferName(v:val)')
endfunction

function! custom#BackgroundSpecialBuffer()
    let bufs = custom#BackgroundBuffer()
    return filter(bufs,'!custom#isNormalBufferName(v:val)')
endfunction

function! custom#CleanSpecialBuffer()
    let bufs = custom#SpecialBuffer()
    for buf in bufs
        execute "bd! ".buf
    endfor
endfunction


function! custom#CloseBackgroundSpecBuffer()
    let bufs = custom#BackgroundSpecialBuffer()
    for buf in bufs
        execute "bd! ".buf
    endfor
endfunction

function! custom#CloseBackgroundBuffer()
    let bufs = custom#BackgroundBuffer()
    for buf in bufs
        execute "bd! ".buf
    endfor
endfunction

function! custom#LoadProjectConfig()
    let pwd = getcwd()
    while pwd != "/"
        let project_config_file = pwd."/.config.vim"
        if filereadable(project_config_file)
            execute "source ".project_config_file
            break
        endif
        let pwd = fnamemodify(pwd, ":h")
    endwhile
endfunction

function! custom#HandleTermEnter()
    startinsert
    set nonu
    " set norelativenumber
endfunction

function! custom#HandleSessionLoadPost()
    call custom#CloseBackgroundSpecBuffer()
    call custom#LoadProjectConfig()
endfunction

function! custom#RefreshAllBuffer()
    call custom#CloseBackgroundBuffer()
    bufdo e!
endfunction

function! custom#ReloadCurrentBuffer()
    let filename = expand('%:t')
    if custom#isNormalBufferName(filename)
        exec ":e"
    endif
endfunction

function! custom#toggleQuickFixWin()
    if exists("g:quickfix_is_open") && g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
    else
        copen
        let g:quickfix_is_open = 1
    endif
endfunction

command! -nargs=0 R :call custom#RefreshAllBuffer()

augroup autoRunGroup
    autocmd!
    autocmd BufLeave * stopinsert
    autocmd TermEnter * :call custom#HandleTermEnter()
    autocmd SessionLoadPost * :call custom#HandleSessionLoadPost()
    autocmd FocusGained,BufEnter * :silent! checktime
    autocmd CursorHold * :silent! checktime
augroup END

set nobackup
set nowritebackup
set updatetime=100
set signcolumn=yes
set showcmd
set noshowmode
set nu
set autowriteall
set ignorecase smartcase
set incsearch
set hlsearch
set cmdheight=1
set cursorline cursorcolumn
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set nocompatible
set nowrap
set ruler
set rulerformat=%15(%c%V\ %p%%%)
set smartindent
set autoindent
set clipboard=unnamedplus
" set scrolloff=10


set enc=utf-8
set fencs=utf-8,ucs-bom,gb18030
set mouse=a
set timeoutlen=300

set foldlevelstart=99
set foldlevel=99

set undofile

set wildmode=longest,list,full,lastused
set noswapfile



if exists("g:neovide")
    set guifont=Source\ Code\ Pro:h10:b:i
    let g:neovide_scale_factor = 1.0
    let g:neovide_transparency = 0.3
    let g:neovide_hide_mouse_when_typing = v:true
    let g:neovide_fullscreen = v:true
    let g:neovide_cursor_vfx_mode = "railgun"
    let g:neovide_floating_blur_amount_x = 2.0
    let g:neovide_floating_blur_amount_y = 2.0
    let g:neovide_scroll_animation_length = 0.1
    let g:neovide_underline_automatic_scaling = v:true
    let g:neovide_remember_window_size = v:true
    let g:neovide_profiler = v:false
    let g:neovide_cursor_animation_length=0.05
    let g:neovide_cursor_trail_size = 0.5
    let g:neovide_cursor_antialiasing = v:true
    let g:neovide_cursor_unfocused_outline_width = 0.125
endif


