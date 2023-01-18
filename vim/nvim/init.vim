
let mapleader=" " "映射leader键为空格

" 启用轻量化 vim，禁止加载一些重量级插件（比如treesitter），用于打开大文件
let g:light_vim = index(keys(environ()), "LIGHT_VIM") != -1
let g:home_dir = environ()['HOME']
let g:install_vim = !filereadable(g:home_dir.."/.local/share/nvim/site/autoload/plug.vim") || !filereadable(g:home_dir.."/.local/share/nvim/site/autoload/plug.vim")
" 使用淘宝镜像加速coc安装
let g:npm_registry = 'https://registry.npm.taobao.org'
let g:load_flags = []
let g:deps_check = [
            \ ['fzf','fzf --version'],
            \ ['lazygit','lazygit --version'],
            \ ['ripgrep','rg --version'],
            \ ['universal-ctags', 'ctags --version'],
            \ ['g++', 'g++ --version'],
            \ ['tmux', 'tmux --version'],
            \ ['nodejs', 'node --version'],
            \ ['xsel', 'xsel --version'],
            \ ['npm', 'npm --version'],
            \ ]

if g:install_vim == 1
    let g:light_vim = 0
endif

" 使用表驱动重构vim配置
" 表项含义
"       插件名称 插件配置 插件flag(nvim/vim/heavy一个或者) 插件加载配置
let g:config_table = [
            \ [ 'octol/vim-cpp-enhanced-highlight', 'cpphighlight.vim', ['heavy'] ],
            \ [ 'luochen1990/rainbow','rainbow.vim', ['heavy']],
            \ [ 'majutsushi/tagbar', 'tagbar.vim', ['heavy']],
            \ [ 'inside/vim-search-pulse' ],
            \ [ 'chiel92/vim-autoformat' ,'autoformat.vim'],
            \ [ 'mg979/vim-visual-multi',  'visual-cursor.vim'],
            \ [ 'tpope/vim-fugitive' ],
            \ [ 'vim-scripts/DoxygenToolkit.vim', 'doxygen.vim'],
            \ [ 'vim-airline/vim-airline' ],
            \ [ 'vim-airline/vim-airline-themes' ,'airline-theme.vim'],
            \ [ 'tpope/vim-repeat' ],
            \ [ 't9md/vim-choosewin' ,'choosewin.vim'],
            \ [ 'jszakmeister/vim-togglecursor' ],
            \ [ 'reedes/vim-wheel' ],
            \ [ 'vim-scripts/CursorLineCurrentWindow' ],
            \ [ 'vim-scripts/EasyGrep' ,'easygrep.vim'],
            \ [ 'christoomey/vim-tmux-navigator', 'tmux.vim' ],
            \ [ 'benmills/vimux' ,'VimuxRunCommand.vim'],
            \ [ 'junegunn/fzf'],
            \ [ 'junegunn/fzf.vim', 'fzf.vim'],
            \ [ 'tpope/vim-surround' ],
            \ [ 'dhruvasagar/vim-table-mode' ],
            \ [ 'vim-scripts/wildfire.vim' ,'wildfire.vim'],
            \ [ 'ryanoasis/vim-devicons' ],
            \ [ 'kyazdani42/nvim-web-devicons'],
            \ [ 'tomasr/molokai' ],
            \ [ 'dracula/vim'],
            \ [ 'sjl/badwolf' ],
            \ [ 'nvim-treesitter/nvim-treesitter', 'treesitter.vim', ['heavy'], "{'do':':TSUpdate'}"],
            \ [ 'nvim-treesitter/nvim-treesitter-textobjects', 'treesitter-textobjects.vim', ['heavy']],
            \ ['ray-x/lsp_signature.nvim', 'lsp_signature.vim'],
            \ ['m-demare/hlargs.nvim'],
            \ ['folke/which-key.nvim', 'which-key.vim'],
            \ ['ggandor/lightspeed.nvim'],
            \ ['chentoast/marks.nvim', 'marks.vim'],
            \ ['lewis6991/gitsigns.nvim', 'gitsigns.vim'],
            \ [ 'echasnovski/mini.nvim','mini.vim'],
            \ [ 'shaeinst/roshnivim-cs'],
            \ [ 'tomasiser/vim-code-dark'],
            \ [ 'Mofiqul/vscode.nvim'],
            \ [ 'marko-cerovac/material.nvim'],
            \ [ 'bluz71/vim-nightfly-guicolors'],
            \ [ 'bluz71/vim-moonfly-colors'],
            \ [ 'ChristianChiarulli/nvcode-color-schemes.vim'],
            \ [ 'folke/tokyonight.nvim'],
            \ [ 'sainnhe/sonokai'],
            \ [ 'kyazdani42/blue-moon'],
            \ [ 'mhartington/oceanic-next'],
            \ [ 'glepnir/zephyr-nvim'],
            \ [ 'rockerBOO/boo-colorscheme-nvim'],
            \ [ 'jim-at-jibba/ariake-vim-colors'],
            \ [ 'ishan9299/modus-theme-vim'],
            \ [ 'sainnhe/edge'],
            \ [ 'theniceboy/nvim-deus'],
            \ [ 'Th3Whit3Wolf/one-nvim'],
            \ [ 'PHSix/nvim-hybrid'],
            \ [ 'yonlu/omni.vim'],
            \ [ 'ray-x/aurora'],
            \ [ 'ray-x/starry.nvim'],
            \ [ 'tanvirtin/monokai.nvim'],
            \ [ 'ofirgall/ofirkai.nvim'],
            \ [ 'savq/melange'],
            \ [ 'RRethy/nvim-base16'],
            \ [ 'fenetikm/falcon'],
            \ [ 'andersevenrud/nordic.nvim'],
            \ [ 'shaunsingh/nord.nvim'],
            \ [ 'ishan9299/nvim-solarized-lua'],
            \ [ 'shaunsingh/moonlight.nvim'],
            \ [ 'navarasu/onedark.nvim'],
            \ [ 'lourenci/github-colors'],
            \ [ 'sainnhe/gruvbox-material'],
            \ [ 'sainnhe/everforest'],
            \ [ 'NTBBloodbath/doom-one.nvim'],
            \ [ 'Mofiqul/dracula.nvim'],
            \ [ 'yashguptaz/calvera-dark.nvim'],
            \ [ 'projekt0n/github-nvim-theme'],
            \ [ 'kdheepak/monochrome.nvim'],
            \ [ 'rose-pine/neovim'],
            \ [ 'catppuccin/nvim'],
            \ [ 'FrenzyExists/aquarium-vim'],
            \ [ 'EdenEast/nightfox.nvim'],
            \ [ 'kvrohit/substrata.nvim'],
            \ [ 'ldelossa/vimdark'],
            \ [ 'Everblush/everblush.nvim'],
            \ [ 'olimorris/onedarkpro.nvim'],
            \ [ 'rmehri01/onenord.nvim'],
            \ [ 'luisiacc/gruvbox-baby'],
            \ [ 'titanzero/zephyrium'],
            \ [ 'rebelot/kanagawa.nvim'],
            \ [ 'tiagovla/tokyodark.nvim'],
            \ [ 'cpea2506/one_monokai.nvim'],
            \ [ 'kvrohit/rasmus.nvim'],
            \ [ 'chrsm/paramount-ng.nvim'],
            \ [ 'kaiuri/nvim-juliana'],
            \ [ 'lmburns/kimbox'],
            \ [ 'rockyzhang24/arctic.nvim'],
            \ [ 'meliora-theme/neovim'],
            \ [ 'Yazeed1s/minimal.nvim'],
            \ [ 'Mofiqul/adwaita.nvim'],
            \ [ 'olivercederborg/poimandres.nvim'],
            \ [ 'tjdevries/gruvbuddy.nvim'],
            \ [ 'ellisonleao/gruvbox.nvim'],
            \ [ 'lalitmee/cobalt2.nvim'],
            \ [ 'vim-scripts/scratch.vim'],
            \ [ 'jabirali/vim-tmux-yank'],
            \ [ 'ludovicchabant/vim-gutentags', 'ctags.vim'],
            \ [ 'preservim/nerdcommenter', 'nerdcommenter.vim'],
            \ [ 'neoclide/coc.nvim', 'coc.vim', [], "{'branch': 'master', 'do': 'npm install --registry '..g:npm_registry..' --frozen-lockfile'}"],
            \ [ 'nvim-lua/plenary.nvim'],
            \ [ 'nvim-telescope/telescope.nvim', 'telescope.vim'],
            \ [ 'nvim-telescope/telescope-fzf-native.nvim', '', [], "{ 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }"],
            \ [ 'rmagatti/auto-session'],
            \ [ 'rmagatti/session-lens'],
            \ [ 'nvim-lua/popup.nvim'],
            \ [ 'nvim-telescope/telescope-media-files.nvim'],
            \ [ 'dhruvmanila/telescope-bookmarks.nvim'],
            \ [ 'FeiyouG/command_center.nvim'],
            \ [ 'nvim-telescope/telescope-file-browser.nvim'],
            \ [ 'sindrets/diffview.nvim'],
            \ [ 'paopaol/telescope-git-diffs.nvim'],
            \ [ 'fannheyward/telescope-coc.nvim'],
            \ [ 'MaximilianLloyd/adjacent.nvim'],
            \ [ 'winston0410/range-highlight.nvim'], 
            \ [ 'xiyaowong/nvim-transparent', 'transparent.vim'],
            \ [ 'folke/twilight.nvim', 'twilight.vim'],
            \ [ 'yaocccc/nvim-hlchunk'],
            \ [ 'lukas-reineke/indent-blankline.nvim', 'indent-blankline.vim'],
            \ [ 'akinsho/toggleterm.nvim', 'toggleterm.vim'],
            \ [ '', 'zoom.vim'],
            \ [ '', 'custom.vim' ],
            \ [ '', 'keybinding.vim'],
            \ [ '', 'colorscheme.vim' ],
            \ ]

" 增加Plugin
function! AddPlugin(plugin_config)
    let g:config_table = add(g:config_table, a:plugin_config)
endfunction

" 增加依赖项检测
function! CheckDeps()
    let flags = 1
    for deps in g:deps_check
        let out = system(deps[1])
        if stridx(out, 'not found') != -1 || stridx(out, 'Unknown command') != -1
            let flags = 0
            if len(deps) > 2
                echo deps[2]
            else
                echo deps[0] .. ' not found!'
            endif
        endif
    endfor
    return flags
endfunction

" 自助安装配置，减少install.sh脚本中的依赖
function! InstallVim()
    if !filereadable(g:home_dir.."/.local/share/nvim/site/autoload/plug.vim")
        " nvim
        echom system("curl -fLo " .. g:home_dir .. "/.local/share/nvim/site/autoload/plug.vim --create-dirs https://ghproxy.com/https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim")
        qa
    endif
endfunction

" 插件加载标记列表（判断某个插件是否需要加载）
function! GetLoadFlags()
    for config in g:config_table
        let properties = []
        if len(config) > 2
            let properties = config[2]
        endif
        if (g:light_vim == 0 || index(properties, "heavy") == -1) 
            let g:load_flags = add(g:load_flags, 1)
        else
            let g:load_flags = add(g:load_flags, 0)
        endif
    endfor
endfunction

" 插件的加载和插件的配置分开
function! LoadPlugin()
    let g:plug_url_format="https://ghproxy.com/https://github.com/%s"
    let plug_install = 0
    call plug#begin()
    let i = 0
    for config in g:config_table
        let plugin = config[0]
        if g:load_flags[i] && plugin != ""
            let plugin_ext = ""
            if len(config) > 3
                let plugin_ext = config[3]
            endif
            let cmd = "Plug '"..plugin.."'"
            if plugin_ext != ""
                let cmd = cmd .. "," .. plugin_ext
            endif
            execute cmd
            let plugin_name = plugin[stridx(plugin, '/') + 1:]
            if isdirectory(g:home_dir .. '/.local/share/nvim/plugged/'.. plugin_name) == 0
                let plug_install = 1
            endif
        endif
        let i = i + 1
    endfor
    call plug#end()
    if plug_install == 1
        execute "PlugInstall"
    endif
endfunction

function! LoadConfig()
    let i = 0
    for config in g:config_table
        let plugin_config = ""
        if len(config) > 1
            let plugin_config = config[1]
        endif
        if g:load_flags[i] && plugin_config != ""
            execute "runtime "..plugin_config
        endif
        let i = i + 1
    endfor
endfunction

function! LoadUserConfig()
    let user_config = g:home_dir..'/.vimrc_user'
    if filereadable(user_config)
        execute 'source ' .. user_config
    endif
endfunction

function! EmptyFunc()
endfunction

let g:DefaultCheckdepsFunc =function('CheckDeps')
let g:DefaultInstallVimFunc =function('InstallVim')

let g:BeforeLoadPluginsFunc =function('EmptyFunc')
let g:BeforeLoadConfigFunc =function('EmptyFunc')
let g:FinallyFunc =function('EmptyFunc')

function! SetBeforeGetLoadPluginsFunc(func_name)
    let g:BeforeLoadPluginsFunc = function(a:func_name)
endfunction

function! SetBeforeGetLoadConfigFunc(func_name)
    let g:BeforeLoadConfigFunc = function(a:func_name)
endfunction

function! SetFinallyFunc(func_name)
    let g:FinallyFunc = function(a:func_name)
endfunction

call LoadUserConfig()
if g:DefaultCheckdepsFunc() == 1
    if g:install_vim == 1
        call g:DefaultInstallVimFunc()
    endif
    call GetLoadFlags()
    call g:BeforeLoadPluginsFunc()
    call LoadPlugin()
    call g:BeforeLoadConfigFunc()
    call LoadConfig()
    call g:FinallyFunc()
endif

