

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
    " 使用telescope
    let g:use_telescope = 0
    " 是否是arch
    let g:is_arch_linux = init#isArchLinuxOS()

    " github代理
    " let g:github_proxy = 'https://ghproxy.org/'
    let g:github_proxy = ''
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
            if(getfsize(path) > 1024*1024)
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

function! init#isArchLinuxOS()
    return filereadable("/etc/arch-release")
endfunction

" 增加内置插件
function init#addBuiltinPlugin()
    execute 'source ' . g:home_dir . "/.config/nvim/plugin.vim" 
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
    if init#isArchLinuxOS() != 1
        echom "Not ArchLinux, Will not auto install deps"
        return 1
    endif
    let out = system("bash " . g:home_dir . "/.config/nvim/script/install_deps.sh")
    if stridx(out, "[vim ok]") != -1
        return 1
    else
        return 0
    endif
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
    let g:plug_url_format = g:github_proxy . "https://github.com/%s"
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
