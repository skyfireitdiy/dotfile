

function! init#initGlobalVars()
    "映射leader键为空格
    let g:mapleader=" "
    " 获取home_dir
    let g:home_dir = environ()['HOME']
    " 检测是否安装vim
    let g:install_vim = !filereadable(g:home_dir."/.local/share/nvim/site/autoload/plug.vim") 
    " 是否启用轻量级nvim
    let g:lite_vim = index(keys(environ()), "lite_vim") != -1
    " 如果需要安装vim，不能启用轻量级nvim
    if g:install_vim == 1
        let g:lite_vim = 0
    endif
    " 使用淘宝镜像加速coc安装
    " let g:npm_registry = 'https://registry.npm.taobao.org'

    " 加载标记
    let g:load_flags = []
    " 忽略的插件
    let g:ignored_plugin = []
    " coc插件
    let g:coc_ext_table = []
    " treesitter
    let g:treesitter_config_table = []
    " 插件配置
    let g:plugin_config_table = []
    " 插件配置搜索路径
    let g:plugin_config_search_path = [g:home_dir . '/.vimrc_user/',
                \ g:home_dir . "/.config/nvim",
                \ g:home_dir . "/.config/nvim/plugin_config/"]
    " 插件加载标记判断回调函数
    let g:plugin_load_hooks = [
            \ function("init#heavyLoadHook"),
            \ function("init#vscodeLoadHook"),
          \ ]
endfunction

function! init#heavyLoadHook(tags)
    return index(a:tags, "heavy") == -1 || !g:lite_vim
endfunction

function! init#vscodeLoadHook(tags)
    return !exists("g:vscode") || index(a:tags, "vscode") != -1
endfunction

" 检测是否是大文件
function! init#checkHugeFile()
    for path in argv()
        if filereadable(path)
            " 判断文件大小，如果超过1MB，启动轻量级nvim
            if(getfsize(path) > 10*1024*1024)
                let g:lite_vim = 1
                break
            endif
        endif
    endfor
endfunction

" 增加Plugin
function! init#AddPlugin(plugin_config)
    let g:plugin_config_table = add(g:plugin_config_table, a:plugin_config)
endfunction

" 增加内置插件
function init#addBuiltinPlugin()
    " call init#AddPlugin( ['增强的c++高亮', 'octol/vim-cpp-enhanced-highlight', 'cpphighlight.vim', ['heavy'] ])
    " call init#AddPlugin( ['彩虹括号', 'luochen1990/rainbow','rainbow.vim', ['heavy']])
    call init#AddPlugin( ['tag边栏', 'majutsushi/tagbar', 'tagbar.vim', ['heavy']])
    " call init#AddPlugin( ['仅在当前活动窗口高亮光标', 'vim-scripts/CursorLineCurrentWindow' ])
    call init#AddPlugin( ['搜索时闪烁当前行', 'inside/vim-search-pulse' ])
    call init#AddPlugin( ['自动格式化', 'chiel92/vim-autoformat' ,'autoformat.vim', ['heavy']])
    call init#AddPlugin( ['多光标支持', 'mg979/vim-visual-multi',  'visual-cursor.vim'])
    call init#AddPlugin( ['Doxygen文档支持', 'vim-scripts/DoxygenToolkit.vim', 'doxygen.vim'])
    call init#AddPlugin( ['状态栏', 'vim-airline/vim-airline' ])
    call init#AddPlugin( ['状态栏主题', 'vim-airline/vim-airline-themes' ,'airline-theme.vim'])
    call init#AddPlugin( ['光标样式', 'jszakmeister/vim-togglecursor' ])
    " call init#AddPlugin( ['屏幕滚动<C-j><C-k>', 'reedes/vim-wheel' ])
    call init#AddPlugin( ['增强的搜索替换', 'vim-scripts/EasyGrep' ,'easygrep.vim'])
    call init#AddPlugin( ['fzf基础支持', 'junegunn/fzf'])
    call init#AddPlugin( ['基于fzf的工具', 'junegunn/fzf.vim', 'fzf.vim'])
    call init#AddPlugin( ['增加、修改包围的括号或者tag', 'tpope/vim-surround' ])
    " call init#AddPlugin( ['表格模式（markdown）', 'dhruvasagar/vim-table-mode' ])
    call init#AddPlugin( ['增强的选中扩展', 'vim-scripts/wildfire.vim' ,'wildfire.vim', ['heavy']])
    call init#AddPlugin( ['treesitter语法高亮', 'nvim-treesitter/nvim-treesitter', 'treesitter.vim', ['heavy'], "{'do':':TSUpdate'}"])
    call init#AddPlugin( ['treesitter对象', 'nvim-treesitter/nvim-treesitter-textobjects', 'treesitter-textobjects.vim', ['heavy']])
    call init#AddPlugin( ['函数签名提示', 'ray-x/lsp_signature.nvim', 'lsp_signature.vim'])
    call init#AddPlugin( ['函数参数高亮', 'm-demare/hlargs.nvim'])
    call init#AddPlugin( ['which-key提示', 'folke/which-key.nvim', 'which-key.vim'])
    " call init#AddPlugin( ['快速跳转', 'ggandor/lightspeed.nvim'])
    call init#AddPlugin( ['快速跳转', 'folke/flash.nvim', 'flash.vim', ['heavy']])
    call init#AddPlugin( ['书签管理', 'chentoast/marks.nvim', 'marks.vim'])
    call init#AddPlugin( ['git状态', 'lewis6991/gitsigns.nvim', 'gitsigns.vim'])
    call init#AddPlugin( ['mini功能合集', 'echasnovski/mini.nvim','mini.vim'])
    call init#AddPlugin( ['图标', 'ryanoasis/vim-devicons' ])
    call init#AddPlugin( ['图标', 'kyazdani42/nvim-web-devicons'])
    call init#AddPlugin( ['创建scratch缓冲区', 'vim-scripts/scratch.vim'])
    call init#AddPlugin( ['自动保存ASToggle', 'Pocco81/auto-save.nvim', 'auto-save.vim'])
    call init#AddPlugin( ['自动生成tag', 'ludovicchabant/vim-gutentags', 'ctags.vim'])
    " call init#AddPlugin( ['调试支持', 'puremourning/vimspector', 'vimspector.vim'])
    call init#AddPlugin( ['chatgpt', 'skyfireitdiy/chatgpt', 'chatgpt.vim'])
    " call init#AddPlugin( ['codegeex', 'skyfireitdiy/codegeex-vim', 'codegeex.vim'])
    call init#AddPlugin( ['codeium', 'Exafunction/codeium.vim'])
    " call init#AddPlugin( ['cheat.sh', 'dbeniamine/cheat.sh-vim'])
    call init#AddPlugin( ['注释', 'preservim/nerdcommenter', 'nerdcommenter.vim'])
    call init#AddPlugin( ['coc', 'neoclide/coc.nvim', 'coc.vim', [], "{'branch': 'master', 'do': 'npm install  --frozen-lockfile'}"])
    call init#AddPlugin( ['lua函数集', 'nvim-lua/plenary.nvim'])
    call init#AddPlugin( ['搜索', 'nvim-telescope/telescope.nvim', 'telescope.vim'])
    " call init#AddPlugin( ['telescope fzf扩展', 'nvim-telescope/telescope-fzf-native.nvim', '', [], "{ 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }"])
    call init#AddPlugin( ['会话自动保存', 'rmagatti/auto-session', 'auto-session.vim'])
    call init#AddPlugin( ['会话搜索', 'rmagatti/session-lens', "session-lens.vim"])
    " call init#AddPlugin( ['快速命令', 'FeiyouG/command_center.nvim'])
    " call init#AddPlugin( ['透明', 'xiyaowong/nvim-transparent', 'transparent.vim'])
    " call init#AddPlugin( ['高亮当前块', 'folke/twilight.nvim', 'twilight.vim'])
    " call init#AddPlugin( ['代码块范围箭头', 'yaocccc/nvim-hlchunk'])
    " call init#AddPlugin( ['缩进线', 'lukas-reineke/indent-blankline.nvim', 'indent-blankline.vim', ['heavy']])
    " call init#AddPlugin( ['ranger', 'kevinhwang91/rnvimr', 'rnvimr.vim'])
    call init#AddPlugin( ['codeql依赖', 's1n7ax/nvim-window-picker', 'nvim-window-picker.vim'])
    " call init#AddPlugin( ['codeql支持', 'pwntester/codeql.nvim', 'codeql.vim'])
    call init#AddPlugin( ['浮动终端', 'akinsho/toggleterm.nvim', 'toggleterm.vim'])
    call init#AddPlugin( ['lsp增强', 'jose-elias-alvarez/null-ls.nvim', 'null-ls.vim'])
    call init#AddPlugin( ['ChatGPT', 'MunifTanjim/nui.nvim' ])
    call init#AddPlugin( ['ChatGPT', 'skyfireitdiy/neoai.nvim', 'neoai.vim'])
    call init#AddPlugin( ['主题', 'tomasr/molokai' ])
    call init#AddPlugin( ['主题', 'tanvirtin/monokai.nvim'])
    call init#AddPlugin( ['主题', 'dracula/vim'])
    " call init#AddPlugin( ['主题', 'sjl/badwolf' ])
    " call init#AddPlugin( ['主题', 'shaeinst/roshnivim-cs'])
    " call init#AddPlugin( ['主题', 'tomasiser/vim-code-dark'])
    " call init#AddPlugin( ['主题', 'Mofiqul/vscode.nvim'])
    " call init#AddPlugin( ['主题', 'marko-cerovac/material.nvim'])
    " call init#AddPlugin( ['主题', 'bluz71/vim-nightfly-guicolors'])
    " call init#AddPlugin( ['主题', 'bluz71/vim-moonfly-colors'])
    " call init#AddPlugin( ['主题', 'ChristianChiarulli/nvcode-color-schemes.vim'])
    " call init#AddPlugin( ['主题', 'folke/tokyonight.nvim'])
    " call init#AddPlugin( ['主题', 'sainnhe/sonokai'])
    " call init#AddPlugin( ['主题', 'kyazdani42/blue-moon'])
    " call init#AddPlugin( ['主题', 'mhartington/oceanic-next'])
    " call init#AddPlugin( ['主题', 'glepnir/zephyr-nvim'])
    " call init#AddPlugin( ['主题', 'rockerBOO/boo-colorscheme-nvim'])
    " call init#AddPlugin( ['主题', 'jim-at-jibba/ariake-vim-colors'])
    " call init#AddPlugin( ['主题', 'ishan9299/modus-theme-vim'])
    " call init#AddPlugin( ['主题', 'sainnhe/edge'])
    " call init#AddPlugin( ['主题', 'theniceboy/nvim-deus'])
    " call init#AddPlugin( ['主题', 'Th3Whit3Wolf/one-nvim'])
    " call init#AddPlugin( ['主题', 'PHSix/nvim-hybrid'])
    " call init#AddPlugin( ['主题', 'yonlu/omni.vim'])
    " call init#AddPlugin( ['主题', 'ray-x/aurora'])
    " call init#AddPlugin( ['主题', 'ray-x/starry.nvim'])
    " call init#AddPlugin( ['主题', 'ofirgall/ofirkai.nvim'])
    " call init#AddPlugin( ['主题', 'savq/melange'])
    " call init#AddPlugin( ['主题', 'RRethy/nvim-base16'])
    " call init#AddPlugin( ['主题', 'fenetikm/falcon'])
    " call init#AddPlugin( ['主题', 'andersevenrud/nordic.nvim'])
    " call init#AddPlugin( ['主题', 'shaunsingh/nord.nvim'])
    " call init#AddPlugin( ['主题', 'ishan9299/nvim-solarized-lua'])
    " call init#AddPlugin( ['主题', 'shaunsingh/moonlight.nvim'])
    " call init#AddPlugin( ['主题', 'navarasu/onedark.nvim'])
    " call init#AddPlugin( ['主题', 'lourenci/github-colors'])
    " call init#AddPlugin( ['主题', 'sainnhe/gruvbox-material'])
    " call init#AddPlugin( ['主题', 'sainnhe/everforest'])
    " call init#AddPlugin( ['主题', 'NTBBloodbath/doom-one.nvim'])
    " call init#AddPlugin( ['主题', 'Mofiqul/dracula.nvim'])
    " call init#AddPlugin( ['主题', 'yashguptaz/calvera-dark.nvim'])
    " call init#AddPlugin( ['主题', 'projekt0n/github-nvim-theme'])
    " call init#AddPlugin( ['主题', 'kdheepak/monochrome.nvim'])
    " call init#AddPlugin( ['主题', 'rose-pine/neovim'])
    " call init#AddPlugin( ['主题', 'catppuccin/nvim'])
    " call init#AddPlugin( ['主题', 'FrenzyExists/aquarium-vim'])
    " call init#AddPlugin( ['主题', 'EdenEast/nightfox.nvim'])
    " call init#AddPlugin( ['主题', 'kvrohit/substrata.nvim'])
    " call init#AddPlugin( ['主题', 'ldelossa/vimdark'])
    " call init#AddPlugin( ['主题', 'Everblush/everblush.nvim'])
    " call init#AddPlugin( ['主题', 'olimorris/onedarkpro.nvim'])
    " call init#AddPlugin( ['主题', 'rmehri01/onenord.nvim'])
    " call init#AddPlugin( ['主题', 'luisiacc/gruvbox-baby'])
    " call init#AddPlugin( ['主题', 'titanzero/zephyrium'])
    " call init#AddPlugin( ['主题', 'rebelot/kanagawa.nvim'])
    " call init#AddPlugin( ['主题', 'tiagovla/tokyodark.nvim'])
    " call init#AddPlugin( ['主题', 'cpea2506/one_monokai.nvim'])
    " call init#AddPlugin( ['主题', 'kvrohit/rasmus.nvim'])
    " call init#AddPlugin( ['主题', 'chrsm/paramount-ng.nvim'])
    " call init#AddPlugin( ['主题', 'kaiuri/nvim-juliana'])
    " call init#AddPlugin( ['主题', 'lmburns/kimbox'])
    " call init#AddPlugin( ['主题', 'rockyzhang24/arctic.nvim'])
    " call init#AddPlugin( ['主题', 'meliora-theme/neovim'])
    " call init#AddPlugin( ['主题', 'Yazeed1s/minimal.nvim'])
    " call init#AddPlugin( ['主题', 'Mofiqul/adwaita.nvim'])
    " call init#AddPlugin( ['主题', 'olivercederborg/poimandres.nvim'])
    " call init#AddPlugin( ['主题', 'tjdevries/gruvbuddy.nvim'])
    " call init#AddPlugin( ['主题', 'ellisonleao/gruvbox.nvim'])
    " call init#AddPlugin( ['主题', 'lalitmee/cobalt2.nvim'])
    call init#AddPlugin( ['', '', 'custom.vim', ['vscode']])
    call init#AddPlugin( ['', '', 'keybinding.vim', ['vscode']])
    call init#AddPlugin( ['', '', 'colorscheme.vim' ])
endfunction


" 增加coc插件
function! init#AddCoc(ext_config)
    let g:coc_ext_table = add(g:coc_ext_table, a:ext_config)
endfunction

" 增加treesitter语言支持
function! init#AddTreesitter(treesitter_config)
    let g:treesitter_config_table = add(g:treesitter_config_table, a:treesitter_config)
endfunction

" 增加依赖项检测
function! init#checkDeps()
    let flag_file = g:home_dir . "/.vim_checked"
    if filereadable(flag_file)
        return 1
    endif
    let deps_check = [
                \ ['fzf','fzf --version'],
                \ ['lazygit','lazygit --version'],
                \ ['ripgrep','rg --version'],
                \ ['fd', 'fd --version'],
                \ ['universal-ctags', 'ctags --version'],
                \ ['g++', 'g++ --version'],
                \ ['nodejs', 'node --version'],
                \ ['npm', 'npm --version'],
                \ ['python3', 'python3 --version'],
                \ ['pip3', 'pip3 --version'],
                \ ['yarn', 'yarn --version'],
                \ ]
    let flags = 1
    for deps in deps_check
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
    if flags == 1
        call system("touch " . flag_file)
    endif
    return flags
endfunction

" 自助安装配置，减少install.sh脚本中的依赖
function! init#installVim()
    if !filereadable(g:home_dir."/.local/share/nvim/site/autoload/plug.vim")
        " nvim
	echom system("mkdir -p ". g:home_dir . "/.local/share/nvim/site/autoload")
        echom system("git clone https://github.com/junegunn/vim-plug.git ".g:home_dir."/.local/share/nvim/vim-plug")
	echom system("ln -sf ".g:home_dir."/.local/share/nvim/vim-plug/plug.vim ".g:home_dir."/.local/share/nvim/site/autoload/plug.vim")
        qa
    endif
endfunction

function! init#AddLoadFlagsHook(funcref)
    let g:plugin_load_hooks = add(g:plugin_load_hooks, funcref)
endfunction

function! init#isPluginShouldLoad(tags)
    for Hook in g:plugin_load_hooks
        if !Hook(a:tags)
            return 0
        endif
    endfor
    return 1
endfunction

" 插件加载标记列表（判断某个插件是否需要加载）
function! init#getLoadFlags()
    for config in g:plugin_config_table
        let tags = []
        if len(config) > 3
            let tags = config[3]
        endif
        let flag = init#isPluginShouldLoad(tags)
        if index(g:ignored_plugin, config[0]) != -1
            let flag = 0
        endif
        let g:load_flags = add(g:load_flags, flag)
    endfor
endfunction

" 插件的加载和插件的配置分开
function! init#loadPlugin()
    " let g:plug_url_format="https://ghproxy.com/https://github.com/%s"
    let plug_install = 0
    call plug#begin()
    for i in range(len(g:plugin_config_table))
        let config = g:plugin_config_table[i]
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




function! init#AddPluginConfigSearchPath(path)
    let g:plugin_config_search_path = add(g:plugin_config_search_path, a:path)
endfunction

function! init#sourceConfigFile(plugin_config)
    for dir in g:plugin_config_search_path
        let config_file = dir . a:plugin_config
        if filereadable(config_file)
            execute "source" config_file
            return
        endif
    endfor
    echoerr "can't find config " a:plugin_config
endfunction

function! init#loadConfig()
    for i in range(len(g:plugin_config_table))
        let config = g:plugin_config_table[i]
        let plugin_config = ""
        if len(config) > 2
            let plugin_config = config[2]
        endif
        if g:load_flags[i] && plugin_config != ""
            call init#sourceConfigFile(plugin_config)
        endif
    endfor
endfunction

function! init#loadUserConfig(rcfile)
    let user_config = g:home_dir.'/.vimrc_user/'.a:rcfile
    if filereadable(user_config)
        execute 'source ' . user_config
    endif
endfunction

function! init#IgnorePlugin(plugin)
    let g:ignored_plugin = add(g:ignored_plugin, a:plugin)
endfunction

function init#init()
    call init#initGlobalVars()
    if init#checkDeps() == 1
        call init#checkHugeFile()
        call init#addBuiltinPlugin()
        if g:install_vim == 1
            call init#installVim()
        endif
        call init#loadUserConfig('before_all.vim')
        call init#getLoadFlags()
        call init#loadPlugin()
        call init#loadUserConfig('before_config.vim')
        call init#loadConfig()
        call init#loadUserConfig('after_all.vim')
    endif
endfunction

call init#init()
