$env.config.buffer_editor = "nvim"
$env.config.edit_mode = "vi"
$env.config.show_banner = false

$env.EDITOR = "nvim"
$env.PASSWORD_STORE_DIR = ($env.HOME + "/github.com/yagoyudi/pass")
$env.KUBECONFIG = ($env.HOME + "/homelab/z/kubeconfig")
$env.TALOSCONFIG = ($env.HOME + "/homelab/z/talosconfig.yaml")
$env.NIXOS_CONFIG = ($env.HOME + "/.local/share/chezmoi/nixos")
$env.NIXPKGS_ALLOW_UNFREE = 1
$env.TZ = "America/Cuiaba"

alias k = kubectl
alias vi = nvim
alias dot = chezmoi

def battery [] {
  let capacity = (cat /sys/class/power_supply/BAT1/capacity | str trim)
  echo $"($capacity)%"
}

use ~/.cache/starship/init.nu
