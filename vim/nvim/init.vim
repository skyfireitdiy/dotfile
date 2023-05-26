
let mapleader=" " "映射leader键为空格

" 启用轻量化 vim，禁止加载一些重量级插件（比如treesitter），用于打开大文件
let g:light_vim = index(keys(environ()), "LIGHT_VIM") != -1
let g:home_dir = environ()['HOME']
let g:install_vim = !filereadable(g:home_dir."/.local/share/nvim/site/autoload/plug.vim") || !filereadable(g:home_dir."/.local/share/nvim/site/autoload/plug.vim")
" 使用淘宝镜像加速coc安装
let g:npm_registry = 'https://registry.npm.taobao.org'
let g:load_flags = []
let g:ignored_plugin = []
let g:deps_check = [
            \ ['fzf','fzf --version'],
            \ ['lazygit','lazygit --version'],
            \ ['ripgrep','rg --version'],
            \ ['fd', 'fd --version'],
            \ ['universal-ctags', 'ctags --version'],
            \ ['g++', 'g++ --version'],
            \ ['nodejs', 'node --version'],
            \ ['xsel', 'xsel --version'],
            \ ['npm', 'npm --version'],
            \ ['python3', 'python3 --version'],
            \ ['pip3', 'pip3 --version'],
            \ ]


let g:quick_start_config = []

if g:install_vim == 1
    let g:light_vim = 0
endif

" 使用表驱动重构vim配置
" 表项含义
"       插件作用 插件名称 插件配置 插件flag(nvim/vim/heavy一个或者) 插件加载配置
let g:config_table = [
            \ ['增强的c++高亮', 'octol/vim-cpp-enhanced-highlight', 'cpphighlight.vim', ['heavy'] ],
            \ ['彩虹括号', 'luochen1990/rainbow','rainbow.vim', ['heavy']],
            \ ['tag边栏', 'majutsushi/tagbar', 'tagbar.vim', ['heavy']],
            \ ['仅在当前活动窗口高亮光标', 'vim-scripts/CursorLineCurrentWindow' ],
            \ ['搜索时闪烁当前行', 'inside/vim-search-pulse' ],
            \ ['自动格式化', 'chiel92/vim-autoformat' ,'autoformat.vim', ['heavy']],
            \ ['多光标支持', 'mg979/vim-visual-multi',  'visual-cursor.vim'],
            \ ['Doxygen文档支持', 'vim-scripts/DoxygenToolkit.vim', 'doxygen.vim'],
            \ ['状态栏', 'vim-airline/vim-airline' ],
            \ ['状态栏主题', 'vim-airline/vim-airline-themes' ,'airline-theme.vim'],
            \ ['光标样式', 'jszakmeister/vim-togglecursor' ],
            \ ['屏幕滚动<C-j><C-k>', 'reedes/vim-wheel' ],
            \ ['增强的搜索替换', 'vim-scripts/EasyGrep' ,'easygrep.vim'],
            \ ['fzf基础支持', 'junegunn/fzf'],
            \ ['基于fzf的工具', 'junegunn/fzf.vim', 'fzf.vim'],
            \ ['增加、修改包围的括号或者tag', 'tpope/vim-surround' ],
            \ ['表格模式（markdown）', 'dhruvasagar/vim-table-mode' ],
            \ ['增强的选中扩展', 'vim-scripts/wildfire.vim' ,'wildfire.vim', ['heavy']],
            \ ['treesitter语法高亮', 'nvim-treesitter/nvim-treesitter', 'treesitter.vim', ['heavy'], "{'do':':TSUpdate'}"],
            \ ['treesitter对象', 'nvim-treesitter/nvim-treesitter-textobjects', 'treesitter-textobjects.vim', ['heavy']],
            \ ['函数签名提示', 'ray-x/lsp_signature.nvim', 'lsp_signature.vim'],
            \ ['函数参数高亮', 'm-demare/hlargs.nvim'],
            \ ['which-key提示', 'folke/which-key.nvim', 'which-key.vim'],
            \ ['快速搜索', 'ggandor/lightspeed.nvim'],
            \ ['书签管理', 'chentoast/marks.nvim', 'marks.vim'],
            \ ['git状态', 'lewis6991/gitsigns.nvim', 'gitsigns.vim'],
            \ ['mini功能合集', 'echasnovski/mini.nvim','mini.vim'],
            \ ['图标', 'ryanoasis/vim-devicons' ],
            \ ['图标', 'kyazdani42/nvim-web-devicons'],
            \ ['创建scratch缓冲区', 'vim-scripts/scratch.vim'],
            \ ['自动保存ASToggle', 'Pocco81/auto-save.nvim', 'auto-save.vim'],
            \ ['自动生成tag', 'ludovicchabant/vim-gutentags', 'ctags.vim'],
            \ ['调试支持', 'puremourning/vimspector', 'vimspector.vim'],
            \ ['chatgpt', 'skyfireitdiy/chatgpt', 'chatgpt.vim'],
            \ ['codegeex', 'skyfireitdiy/codegeex-vim', 'codegeex.vim'],
            \ ['codeium', 'Exafunction/codeium.vim'],
            \ ['cheat.sh', 'dbeniamine/cheat.sh-vim'],
            \ ['注释', 'preservim/nerdcommenter', 'nerdcommenter.vim'],
            \ ['coc', 'neoclide/coc.nvim', 'coc.vim', [], "{'branch': 'master', 'do': 'npm install --registry '.g:npm_registry.' --frozen-lockfile'}"],
            \ ['lua函数集', 'nvim-lua/plenary.nvim'],
            \ ['搜索', 'nvim-telescope/telescope.nvim', 'telescope.vim'],
            \ ['telescope fzf扩展', 'nvim-telescope/telescope-fzf-native.nvim', '', [], "{ 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }"],
            \ ['会话自动保存', 'rmagatti/auto-session', 'auto-session.vim'],
            \ ['会话搜索', 'rmagatti/session-lens', "session-lens.vim"],
            \ ['快速命令', 'FeiyouG/command_center.nvim'],
            \ ['透明', 'xiyaowong/nvim-transparent', 'transparent.vim'],
            \ ['高亮当前块', 'folke/twilight.nvim', 'twilight.vim'],
            \ ['代码块范围箭头', 'yaocccc/nvim-hlchunk'],
            \ ['缩进线', 'lukas-reineke/indent-blankline.nvim', 'indent-blankline.vim'],
            \ ['浮动终端', 'akinsho/toggleterm.nvim', 'toggleterm.vim'],
            \ ['lsp增强', 'jose-elias-alvarez/null-ls.nvim', 'null-ls.vim'],
            \ ['主题', 'tomasr/molokai' ],
            \ ['主题', 'dracula/vim'],
            \ ['主题', 'sjl/badwolf' ],
            \ ['主题', 'shaeinst/roshnivim-cs'],
            \ ['主题', 'tomasiser/vim-code-dark'],
            \ ['主题', 'Mofiqul/vscode.nvim'],
            \ ['主题', 'marko-cerovac/material.nvim'],
            \ ['主题', 'bluz71/vim-nightfly-guicolors'],
            \ ['主题', 'bluz71/vim-moonfly-colors'],
            \ ['主题', 'ChristianChiarulli/nvcode-color-schemes.vim'],
            \ ['主题', 'folke/tokyonight.nvim'],
            \ ['主题', 'sainnhe/sonokai'],
            \ ['主题', 'kyazdani42/blue-moon'],
            \ ['主题', 'mhartington/oceanic-next'],
            \ ['主题', 'glepnir/zephyr-nvim'],
            \ ['主题', 'rockerBOO/boo-colorscheme-nvim'],
            \ ['主题', 'jim-at-jibba/ariake-vim-colors'],
            \ ['主题', 'ishan9299/modus-theme-vim'],
            \ ['主题', 'sainnhe/edge'],
            \ ['主题', 'theniceboy/nvim-deus'],
            \ ['主题', 'Th3Whit3Wolf/one-nvim'],
            \ ['主题', 'PHSix/nvim-hybrid'],
            \ ['主题', 'yonlu/omni.vim'],
            \ ['主题', 'ray-x/aurora'],
            \ ['主题', 'ray-x/starry.nvim'],
            \ ['主题', 'tanvirtin/monokai.nvim'],
            \ ['主题', 'ofirgall/ofirkai.nvim'],
            \ ['主题', 'savq/melange'],
            \ ['主题', 'RRethy/nvim-base16'],
            \ ['主题', 'fenetikm/falcon'],
            \ ['主题', 'kevinhwang91/rnvimr', 'rnvimr.vim'],
            \ ['主题', 'andersevenrud/nordic.nvim'],
            \ ['主题', 'shaunsingh/nord.nvim'],
            \ ['主题', 'ishan9299/nvim-solarized-lua'],
            \ ['主题', 'shaunsingh/moonlight.nvim'],
            \ ['主题', 'navarasu/onedark.nvim'],
            \ ['主题', 'lourenci/github-colors'],
            \ ['主题', 'sainnhe/gruvbox-material'],
            \ ['主题', 'sainnhe/everforest'],
            \ ['主题', 'NTBBloodbath/doom-one.nvim'],
            \ ['主题', 'Mofiqul/dracula.nvim'],
            \ ['主题', 'yashguptaz/calvera-dark.nvim'],
            \ ['主题', 'projekt0n/github-nvim-theme'],
            \ ['主题', 'kdheepak/monochrome.nvim'],
            \ ['主题', 'rose-pine/neovim'],
            \ ['主题', 'catppuccin/nvim'],
            \ ['主题', 'FrenzyExists/aquarium-vim'],
            \ ['主题', 'EdenEast/nightfox.nvim'],
            \ ['主题', 'kvrohit/substrata.nvim'],
            \ ['主题', 'ldelossa/vimdark'],
            \ ['主题', 'Everblush/everblush.nvim'],
            \ ['主题', 'olimorris/onedarkpro.nvim'],
            \ ['主题', 'rmehri01/onenord.nvim'],
            \ ['主题', 'luisiacc/gruvbox-baby'],
            \ ['主题', 'titanzero/zephyrium'],
            \ ['主题', 'rebelot/kanagawa.nvim'],
            \ ['主题', 'tiagovla/tokyodark.nvim'],
            \ ['主题', 'cpea2506/one_monokai.nvim'],
            \ ['主题', 'kvrohit/rasmus.nvim'],
            \ ['主题', 'chrsm/paramount-ng.nvim'],
            \ ['主题', 'kaiuri/nvim-juliana'],
            \ ['主题', 'lmburns/kimbox'],
            \ ['主题', 'rockyzhang24/arctic.nvim'],
            \ ['主题', 'meliora-theme/neovim'],
            \ ['主题', 'Yazeed1s/minimal.nvim'],
            \ ['主题', 'Mofiqul/adwaita.nvim'],
            \ ['主题', 'olivercederborg/poimandres.nvim'],
            \ ['主题', 'tjdevries/gruvbuddy.nvim'],
            \ ['主题', 'ellisonleao/gruvbox.nvim'],
            \ ['主题', 'lalitmee/cobalt2.nvim'],
            \ ['', '', 'custom.vim', ['vscode']],
            \ ['', '', 'keybinding.vim', ['vscode']],
            \ ['', '', 'colorscheme.vim' ],
            \ ]

" 增加Plugin
function! init#AddPlugin(plugin_config)
    let g:config_table = add(g:config_table, a:plugin_config)
endfunction

" 增加依赖项检测
function! init#CheckDeps()
    let flags = 1
    for deps in g:deps_check
        let out = system(deps[1])
        if stridx(out, 'not found') != -1 || stridx(out, 'Unknown command') != -1
            let flags = 0
            if len(deps) > 2
                echo deps[2]
            else
                echo deps[0] . ' not found!'
            endif
        endif
    endfor
    return flags
endfunction

" 自助安装配置，减少install.sh脚本中的依赖
function! init#InstallVim()
    if !filereadable(g:home_dir."/.local/share/nvim/site/autoload/plug.vim")
        " nvim
        echom system("curl -fLo " . g:home_dir . "/.local/share/nvim/site/autoload/plug.vim --create-dirs https://ghproxy.com/https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim")
        qa
    endif
endfunction

" 插件加载标记列表（判断某个插件是否需要加载）
function! init#GetLoadFlags()
    for config in g:config_table
        let properties = []
        if len(config) > 3
            let properties = config[3]
        endif
        let flag = 0
        if exists('g:vscode')
            if index(properties, "vscode") != -1
                let flag = 1
            endif
        else
            if g:light_vim == 0
                let flag = 1
            endif
            if index(properties, "heavy") == -1
                let flag = 1
            endif
        endif
        if index(g:ignored_plugin, config[0]) != -1
            let flag = 0
        endif
        let g:load_flags = add(g:load_flags, flag)
    endfor
endfunction

" 插件的加载和插件的配置分开
function! init#LoadPlugin()
    let g:plug_url_format="https://ghproxy.com/https://github.com/%s"
    let plug_install = 0
    call plug#begin()
    for i in range(len(g:config_table))
        let config = g:config_table[i]
        let plugin = config[1]
        if g:load_flags[i] && plugin != ""
            let plugin_ext = ""
            if len(config) > 4
                let plugin_ext = config[4]
            endif
            let cmd = "Plug '".plugin."'"
            if plugin_ext != ""
                let cmd = cmd . "," . plugin_ext
            endif
            execute cmd
            let plugin_name = plugin[stridx(plugin, '/') + 1:]
            if isdirectory(g:home_dir . '/.local/share/nvim/plugged/'. plugin_name) == 0
                let plug_install = 1
            endif
        endif
    endfor
    call plug#end()
    if plug_install == 1
        execute "PlugInstall"
    endif
endfunction

function! init#LoadConfig()
    for i in range(len(g:config_table))
        let config = g:config_table[i]
        let plugin_config = ""
        if len(config) > 2
            let plugin_config = config[2]
        endif
        if g:load_flags[i] && plugin_config != ""
            if filereadable(g:home_dir.'/.config/nvim/'.plugin_config)
                execute "runtime ".plugin_config
            elseif filereadable(g:home_dir.'/.vimrc_user/'.plugin_config)
                execute "runtime ".g:home_dir.'/.vimrc_user/'.plugin_config
            else
                echoerr "can't found config ".plugin_config."!"
            endif
        endif
    endfor
endfunction

function! init#LoadUserConfig(rcfile)
    let user_config = g:home_dir.'/.vimrc_user/'.a:rcfile
    if filereadable(user_config)
        execute 'source ' . user_config
    endif
endfunction

function! init#AddQuickStartItem(desc, cmd)
    let g:quick_start_config = add(g:quick_start_config, [a:desc, a:cmd])
endfunction

function! init#IgnorePlugin(plugin)
    let g:ignored_plugin = add(g:ignored_plugin, a:plugin)
endfunction

if init#CheckDeps() == 1
    if g:install_vim == 1
        call init#InstallVim()
    endif
    call init#GetLoadFlags()
    call init#LoadUserConfig('before_all.vim')
    call init#LoadPlugin()
    call init#LoadUserConfig('before_config.vim')
    call init#LoadConfig()
    call init#LoadUserConfig('after_all.vim')
endif
