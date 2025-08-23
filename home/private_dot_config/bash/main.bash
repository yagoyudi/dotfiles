set -o vi
shopt -s autocd

eval "$(starship init bash)"
eval "$(zoxide init bash)"

# source <(kubectl completion bash)
# source <(chezmoi completion bash)
# source <(gopass completion bash)

# complete -F __start_kubectl k
# complete -F __start_chezmoi c

source ~/.config/bash/environment.bash
source ~/.config/bash/aliases.bash
source ~/.config/bash/functions.bash
