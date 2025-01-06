$env.config.buffer_editor = "nvim"
$env.config.edit_mode = "vi"
$env.config.show_banner = false

$env.EDITOR = "nvim"

alias k = kubectl
alias vi = nvim
alias dot = chezmoi

def battery [] {
  let capacity = (cat /sys/class/power_supply/BAT1/capacity | str trim)
  echo $"($capacity)%"
}

use ~/.cache/starship/init.nu
