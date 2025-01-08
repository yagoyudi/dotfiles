$env.config.buffer_editor = "nvim"
$env.config.edit_mode = "vi"
$env.config.show_banner = false

$env.EDITOR = "nvim"
$env.PASSWORD_STORE_DIR = "$env.HOME/github.com/yagoyudi/pass"

alias k = kubectl
alias vi = nvim
alias dot = chezmoi

def battery [] {
  let capacity = (cat /sys/class/power_supply/BAT1/capacity | str trim)
  echo $"($capacity)%"
}

use ~/.cache/starship/init.nu
