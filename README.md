# github.com/yagoyudi/dotfiles

Managed with [`chezmoi`](https://github.com/twpayne/chezmoi).

Personal secrets are stored with
[gopass](https://github.com/gopasspw/gopass/tree/master).

## Installation

### With chezmoi

    chezmoi init --apply yagoyudi

If you don't have chezmoi installed, you can:

    sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply yagoyudi

### With mage

    mage deploy

If you don't have mage installed, you can:

    go run mage.go deploy
