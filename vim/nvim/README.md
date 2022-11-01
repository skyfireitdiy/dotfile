# Vim

本项目是我的vim和neovim配置（vim仅支持部分功能）。

## 结构

本目录下有很多.vim文件，结构如下：

1. init.vim

    整个配置入口文件，引入了其他的.vim文件

2. plugins.vim

    插件配置文件，主要根据nvim和vim引入不同的插件安装文件：

    - plugins-common.vim

        vim和nvim都会生效的插件

    - plugins-vim.vim

        仅会在vim生效的插件。

    - plugins-nvim.vim

        仅会在nvim生效的插件

3. coc.vim

    coc的设置，引入了所有的coc目录下的.vim文件

4. coc-settings.json

    coc相关插件的配置

## 安装

在此项目的根目录下有脚本 `install.sh`，需要在目录中执行：

```bash
./install.sh vim
```

就会自动完成配置的安装。

## 常用快捷键

`<leader>` 设置为空格

此列表仅包含自定义的快捷键，不包括内置默认和各插件的默认快捷键。

### 内置功能的快捷键

| 模式          | 快捷键       | 功能                                   |
|---------------|--------------|----------------------------------------|
| insert        | hh/jj/kk     | 快速进入normal模式                     |
| insert        | oo           | 快速在上插入行                         |
| insert        | OO           | 快速在下插入行                         |
| insert        | zz           | 快速移动视图到中间（类似normal下的zz） |
| normal        | tt           | 创建tab                                |
| normal        | `<leader>`tn | 下一个tab                              |
| normal        | `<leader>`tp | 上一个tab                              |
| normal        | `<leader>`to | 仅保留当前tab                          |
| normal        | `<leader>`tc | 关闭当前tab                            |
| normal        | `<leader>w`  | `<C-w>`的映射                          |
| normal        | `<leader>`rl | 重新加载vim配置                        |
| normal        | `<leader>`s  | 打开终端                               |
| normal        | `<leader>`?  | 关闭搜索高亮                           |
| normal        | `<leader>`fc | 显示当前的文件名                       |
| normal        | //           | 向后搜索当前光标下的单词（*）          |
| normal        | ??           | 向前搜索当前光标下的单词（#）          |
| normal        | `<leader>`%  | 全选                                   |
| normal        | `<leader>`r  | 整个buffer替换光标下的单词             |
| normal        | `<leader>`R  | 整个buffer替换光标下的单词（全词匹配） |
| normal        | `<leader>`M  | 切换只读模式                           |
| normal        | Q            | 回放宏（q为录制）                      |
| normal/visual | gh           | 跳到行首                               |
| normal/visual | gl           | 跳到行尾                               |
| normal/visual | g`<Down>`    | 向下跳25行                             |
| normal/visual | g`<Up>`      | 向上跳25行                             |

### 插件快捷键配置

| 模式   | 快捷键        | 功能                                     |
|--------|---------------|------------------------------------------|
| normal | `<leader>` `  | 选择窗口                                 |
| normal | `<leader>`ca  | 诊断信息                                 |
| normal | `<leader>`ce  | coc扩展                                  |
| normal | `<leader>`cx  | coc命令                                  |
| normal | gd            | 跳转到定义                               |
| normal | gy            | 跳转到类型定义                           |
| normal | gi            | 跳转到实现                               |
| normal | gr            | 查看所有引用                             |
| normal | `<leader>`rn  | 重命名                                   |
| normal | [g            | 跳转到上一个错误                         |
| normal | ]g            | 跳转到下一个错误                         |
| normal | K             | 显示Tip                                  |
| normal | gH            | 切换源文件与头文件                       |
| normal | `<lwader>`e   | 资源管理器                               |
| normal | `<leader>`f   | 查找git管理的文件                        |
| normal | `<leader>`ff  | 查找所有文件                             |
| normal | `<leader>`gs  | git变更的文件                            |
| normal | `<leader>`ga  | git操作                                  |
| normal | `<leader>`b   | buffer列表                               |
| normal | `<leader>`B   | 所有缓冲区（包括历史的）                 |
| normal | `<leader>`g;  | 本缓冲区内的变更                         |
| normal | `<leader>`L   | 使用光标下的单词搜索本缓冲区内的行       |
| normal | `<leader>`gr  | 整个工程中查找                           |
| normal | `<leader>`q   | QuickFix搜索                             |
| normal | `<leader>`G   | 使用光标下的单词搜索整个项目             |
| normal | `<leader>`h   | 历史打开的文件                           |
| normal | `<leader>`:   | 命令搜索                                 |
| normal | `<leader>`c   | 当前缓冲区文件的git历史                  |
| normal | `<leader>`C   | 整个项目的git历史                        |
| normal | `<leader>`y   | yank寄存器                               |
| normal | `<leader>`t   | 当前缓冲区的tags                         |
| normal | `<leader>`T   | 整个项目的tags                           |
| normal | `<leader>`mv  | markdown预览                             |
| normal | `<leader>`F   | 在整个项目中查找（显示在QuickFix窗口）   |
| normal | `<leader>`co  | 选择主题                                 |
| normal | `<leader>`rg  | 在整个项目中模糊查找                     |
| normal | `<leader>`ft  | 当前缓冲区的tags                         |
| normal | `<leader>`fT  | 整个项目的tags                           |
| normal | `<leader>`m   | 书签                                     |
| normal | `<leader>`W   | 窗口列表                                 |
| normal | `<leader>`rg  | 在整个项目中模糊查找                     |
| normal | `<leader>`/   | 搜索历史                                 |
| normal | `<leader>`k   | 快捷键查找                               |
| normal | `<leader>`H   | 帮助文档                                 |
| normal | `<leader>`z   | 窗口最大化/恢复                          |
| normal | `<leader>`SW  | 保存当前工作区                           |
| normal | `<leader>`SS  | 选择工作区                               |
| normal | `<leader>`gt  | 显示侧边栏tags列表                       |
| normal | `<leader>`gT  | 显示侧边栏tags列表（不太稳定，但好看些） |
| normal | `<leader>`\   | 打开tmux终端（需要运行在tmux下）         |
| normal | `<leader>`\   | 打开tmux终端（需要运行在tmux下）         |
| normal | `<leader>`g   | 打开lazygit                              |
| normal | `<leader>`//  | 增加doxygen函数注释                      |
| normal | `<leader>`/// | 增加doxygen文件注释                      |

### 自定义用户配置

为了兼顾功能和灵活性，此配置在`init.vim` 中留下了一些可定制点，其激活方式为创建文件`~/.vimrc_user`文件。

当`vim`检测到此文件的时候，会自动加载此文件的配置。

此文件的加载会在任何配置加载前加载，因此在此文件中完全可以控制加载行为。

此 vim 配置的初始化分为以下阶段：

1. 检测依赖
2. 检测是否需要安装部署，如果需要就部署
3. 生成插件加载标记表（标记哪些插件需要加载）
4. 加载插件
5. 加载插件配置

为了可以由用户完全控制`vim`的行为，此配置留下了以下定制点，建议修改的变量如下：

1. g:light_vim
	禁止加载一些重量级插件

2. g:DefaultCheckdepsFunc 
	检测依赖函数

3. g:DefaultInstallVimFunc 
	安装vim配置函数

4. g:BeforeGetLoadFlagsFunc 
	获取插件加载标志前执行的函数

5. g:BeforeLoadPluginsFunc 
	加载插件前执行的函数

6. g:BeforeLoadConfigFunc
	加载插件配置前执行的函数

7. g:FinallyFunc 
	加载完成后执行的函数

以下是一个例子：

```vim
function! UserFinallyFunc()
	colorscheme monokai_soda 
endfunction

function UserBeforeGetLoadFlagsFunc()
	" 设置轻量化模式
	let g:light_vim = 1
endfunction

let g:FinallyFunc = function('UserFinallyFunc')
let g:BeforeGetLoadFlagsFunc = function('UserBeforeGetLoadFlagsFunc')
```

此配置设置轻量化加载方式，并且在加载完成之后将主题设置为`monokai_soda`
