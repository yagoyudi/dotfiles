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
			go-task
			gopls
			kubevirt
			yaml-language-server
			pyright
			gopass
			eza
			stylua
			git-lfs
			zoxide
			starship
			go
			golangci-lint
			gotools
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
			gotop
			gopls
			nuclei
			gofumpt
		];
	};
}
