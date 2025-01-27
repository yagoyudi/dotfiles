$env.EDITOR = "nvim"
$env.PASSWORD_STORE_DIR = ($env.HOME + "/github.com/yagoyudi/pass")
$env.KUBECONFIG = ($env.HOME + "/homelab/k3s/kubeconfig")
$env.NIXOS_CONFIG = ($env.HOME + "/.local/share/chezmoi/nixos")
$env.NIXPKGS_ALLOW_UNFREE = 1
$env.TZ = "America/Sao_Paulo"
$env.PATH = ($env.PATH | split row (char esep) | append ($env.HOME + "/.local/bin"))
