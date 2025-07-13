if status is-interactive
    # Commands to run in interactive sessions can go here
end


# --------------------- abbr start ---------------------
abbr -a -- np 'set -e http_proxy ; set -e https_proxy ; set -e socks_proxy ; set -e HTTP_PROXY ; set -e HTTPS_PROXY ; set -e SOCKS_PROXY '
abbr -a -- e exit

abbr -a -- rm 'rm -rf'

abbr -a -- lg lazygit
abbr -a -- a 'abbr -a'
abbr -a -- um 'sudo reflector --verbose -c China --latest 10 --sort rate --save /etc/pacman.d/mirrorlist'
abbr -a -- nv nvim
abbr -a -- r ranger
abbr -a -- s sudo
abbr -a -- mk make
abbr -a -- xm xmake
abbr -a -- z zellij
abbr -a -- vim nvim

abbr -a -- gc 'git commit'
abbr -a -- gs 'git status'
abbr -a -- gco 'git checkout'
abbr -a -- ga 'git add -u'
abbr -a -- gpl 'git pull'
abbr -a -- g git
abbr -a -- gl 'git lg'
abbr -a -- gps 'git push'

abbr -a -- yi 'yay -S --noconfirm'
abbr -a -- yu 'yay -Sy; yay -Su --noconfirm --needed --overwrite="*"'
abbr -a -- ys 'yay -Ss'
abbr -a -- yr 'yay -Rnsuvc'

abbr -a -- ls exa

# --------------------- abbr end ---------------------

# --------------------- env start --------------------

set -gx FZF_DEFAULT_COMMAND 'fd --exclude={.git,.idea,.sass-cache,node_modules,build} --type f'
set -gx FZF_DEFAULT_OPTS "--preview 'bat --style=numbers,changes --color=always {} 2> /dev/null'"

# --------------------- env end --------------------


if test -f ~/.config/fish_user/config.fish
    source ~/.config/fish_user/config.fish
end

set -x UV_DEFAULT_INDEX https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple/
