$env.EDITOR = "nvim"
$env.PASSWORD_STORE_DIR = ($env.HOME + "/github.com/yagoyudi/pass")
$env.KUBECONFIG = ($env.HOME + "/homelab/z/kubeconfig")
$env.TALOSCONFIG = ($env.HOME + "github.com/yagoyudi/homelab/z/talosconfig.yaml")
$env.NIXOS_CONFIG = ($env.HOME + "/.local/share/chezmoi/nixos")
$env.NIXPKGS_ALLOW_UNFREE = 1
$env.TZ = "America/Sao_Paulo"
$env.PATH = ($env.PATH | split row (char esep) | append ($env.HOME + "/.local/bin"))
