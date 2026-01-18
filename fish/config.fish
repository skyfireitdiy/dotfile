if status is-interactive
    # Commands to run in interactive sessions can go here
end

# System detection
if test -f /etc/os-release
    set -l os (cat /etc/os-release | grep ^ID= | cut -d= -f2 | tr -d '"')
    switch $os
        case arch
            # Arch Linux specific aliases
            abbr -a -- um 'sudo reflector --verbose -c China --latest 10 --sort rate --save /etc/pacman.d/mirrorlist'
            abbr -a -- yi 'yay -S --noconfirm'
            abbr -a -- yu 'yay -Sy; yay -Su --noconfirm --needed --overwrite="*"'
            abbr -a -- ys 'yay -Ss'
            abbr -a -- yr 'yay -Rnsuvc'
        case fedora centos rhel
            # Fedora/CentOS/RHEL specific aliases
            abbr -a -- yu 'sudo dnf upgrade -y'
            abbr -a -- yi 'sudo dnf install -y'
            abbr -a -- yr 'sudo dnf remove -y'
            abbr -a -- ys 'dnf search'
        case kali debian ubuntu kylin
            # Debian/Ubuntu/Kali Linux specific aliases
            abbr -a -- yu 'sudo apt update && sudo apt upgrade -y'
            abbr -a -- yi 'sudo apt install'
            abbr -a -- yr 'sudo apt remove'
            abbr -a -- ys 'apt search'
    end
end

# --------------------- abbr start ---------------------
abbr -a -- np 'set -e http_proxy ; set -e https_proxy ; set -e socks_proxy ; set -e HTTP_PROXY ; set -e HTTPS_PROXY ; set -e SOCKS_PROXY '
abbr -a -- e exit

abbr -a -- rm 'rm -rf'

abbr -a -- lg lazygit
abbr -a -- a 'abbr -a'
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

abbr -a -- ls eza

# --------------------- abbr end ---------------------

# --------------------- env start --------------------

set -gx FZF_DEFAULT_COMMAND 'fd --exclude={.git,.idea,.sass-cache,node_modules,build} --type f'
set -gx FZF_DEFAULT_OPTS "--preview 'bat --style=numbers,changes --color=always {} 2> /dev/null'"

# --------------------- env end --------------------

if test -f ~/.config/fish_user/config.fish
    source ~/.config/fish_user/config.fish
end

set -x GTK_IM_MODULE fcitx
set -x QT_IM_MODULE fcitx
set -x XMODIFIERS '@im=fcitx'

# ===== JARVIS JSS FISH COMPLETION START =====
function fish_command_not_found
    if test (string length "$argv") -lt 10
        return
    end
    commandline -r (jss request "$argv")
end

function __fish_command_not_found_handler --on-event fish_command_not_found
    fish_command_not_found "$argv"
end
# ===== JARVIS JSS FISH COMPLETION END =====
set -gx PATH $PATH /home/skyfire/npm-global/bin /home/skyfire/go/bin
