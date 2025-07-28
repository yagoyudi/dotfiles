set -o vi

if [[ "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select" || \
      "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select-wrapped" ]]; then
    zle -N zle-keymap-select "";
fi

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

source <(kubectl completion zsh)
source <(chezmoi completion zsh)
source <(gopass completion zsh)

source ~/.config/zsh/environment.zsh
source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/functions.zsh
source ~/.config/zsh/bindkeys.zsh
