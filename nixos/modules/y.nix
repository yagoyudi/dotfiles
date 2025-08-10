{ pkgs, ... }:
{
	users.users.y = {
		isNormalUser = true;
		description = "y";
		shell = pkgs.zsh;
		extraGroups = [
			"networkmanager"
			"wheel"
			"docker"
		];
		packages = with pkgs; [
			gnupg
			zathura
			foot
			dmenu
			gh
			chezmoi
			lua-language-server
			clang-tools
			opentofu
			kubevirt
			yaml-language-server
			pyright
			eza
			stylua
			git-lfs
			zoxide
			starship
			go
			gopls
			gofumpt
			goreleaser
			gopass
			golangci-lint
			gotools
			gotop
			gcc
			tree
			markdownlint-cli2
			nerdctl
			mdbook
			pulsemixer
			just
			gnumake
			firefox
			yamlfmt
			clock-rs
			speedtest-go
			ripgrep
			talosctl
			minikube
			kubernetes-helm
			podman
			buildah
			k9s
			fluxcd
			brightnessctl
			libreoffice
			yt-dlp
			obsidian
			hugo
			anki
			sway-launcher-desktop
			tcpdump
			jq
			yq
			etcd
			kind
			kubectl
			kubecolor
			kubectx
			nuclei
		];
	};
}
