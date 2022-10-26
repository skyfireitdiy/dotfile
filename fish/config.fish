if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -x KUBECONFIG ~/.kube/config
set -x PATH $PATH ~/.local/bin

set -x PATH $PATH ~/.cargo/bin
set --universal FZF_DEFAULT_COMMAND 'fd'

