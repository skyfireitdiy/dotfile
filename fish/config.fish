if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -x KUBECONFIG ~/.kube/config
set -x PATH $PATH ~/.local/bin
set -x LANG C.UTF-8
set -x PATH $PATH ~/.cargo/bin
set -x PATH $PATH /opt/android-sdk/tools
set --universal FZF_DEFAULT_COMMAND 'fd'

