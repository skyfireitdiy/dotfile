if status is-interactive
    # Commands to run in interactive sessions can go here
end

if test -f ~/.config/fish_user/config.fish
    source ~/.config/fish_user/config.fish
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/anaconda/bin/conda
    eval /opt/anaconda/bin/conda "shell.fish" hook $argv | source
end
# <<< conda initialize <<<
