# Dotfiles

System-level configuration managed by NixOS and home-level configuration
managed by Chezmoi.

## Installation

```sh
# Clone the repository:
gh repo clone yagoyudi/dotfiles

# Install system configuration:
cd nixos && sudo nixos-rebuild switch --flake .#$MACHINE_HOSTNAME

# Install home configuration:
# NOTE: chezmoi needs secrets stored in gopass
chezmoi apply
```
