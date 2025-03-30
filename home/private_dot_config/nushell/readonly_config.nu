$env.config.buffer_editor = "nvim"
$env.config.edit_mode = "vi"
$env.config.show_banner = false

alias k = kubectl
alias vi = nvim
alias dot = chezmoi
alias ls = exa
alias cat = bat
alias nix-shell = nix-shell --run nu

use ~/.cache/starship/init.nu

if (tty | str trim) == "/dev/tty1" {
    exec sway
}
