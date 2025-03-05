{ config, pkgs, ... }:
{
	imports = [
		./hardware-configuration.nix
	];

	boot = {
		loader = {
			systemd-boot.enable = true;
			efi.canTouchEfiVariables = true;
		};
		initrd.luks.devices."luks-50927432-5e4d-4527-a574-5beee22cc209".device = "/dev/disk/by-uuid/50927432-5e4d-4527-a574-5beee22cc209";
	};

	nix = {
		gc = {
			automatic = true;
			dates = "weekly";
		};
	};

	networking = {
		hostName = "swift3";
		networkmanager.enable = true;
		nameservers = [
			"1.1.1.1"
			"8.8.8.8"
		];
	};

	time.timeZone = "America/Sao_Paulo";

	i18n = {
		defaultLocale = "en_US.UTF-8";

		extraLocaleSettings = {
			LC_ADDRESS = "pt_BR.UTF-8";
			LC_IDENTIFICATION = "pt_BR.UTF-8";
			LC_MEASUREMENT = "pt_BR.UTF-8";
			LC_MONETARY = "pt_BR.UTF-8";
			LC_NAME = "pt_BR.UTF-8";
			LC_NUMERIC = "pt_BR.UTF-8";
			LC_PAPER = "pt_BR.UTF-8";
			LC_TELEPHONE = "pt_BR.UTF-8";
			LC_TIME = "pt_BR.UTF-8";
		};
	};

	console.keyMap = "br-abnt2";

	security = {
		rtkit.enable = true;

		pam = {
			services.swaylock = {};
		};
		
		sudo.wheelNeedsPassword = false;
	};

	hardware = {
		bluetooth = {
			enable = true;
			powerOnBoot = true;
		};
		pulseaudio.enable = false;
		graphics.enable = true;
	};

	users.users.yy = {
		isNormalUser = true;
		description = "yy";
		shell = pkgs.bash;
		extraGroups = [
			"networkmanager"
			"wheel"
			"docker"
		];
		packages = with pkgs; [
			neovim
			gnupg
			zathura
			wezterm
			gh
			chezmoi
			tmux
			gopass
			bat
			eza
			starship
			go
			gotools
			mage
			glow
			gcc
			tree
			lua
			zig
			firefox
			qutebrowser
			pulsemixer
			brightnessctl
			grim
			slurp
			speedtest-go
			talosctl
			kubectl
			kubernetes-helm
			k9s
			argocd
			fluxcd
			brightnessctl
			tea
			cheat
			libreoffice
			yt-dlp
			# Do NOT install cilium here, use the binary at $HOME/.local/bin
			# cilium-cli
		];
	};

	fonts = {
		packages = with pkgs; [
			fira-code
			fira-mono
			fira-sans
			fira-code-symbols
			twitter-color-emoji
		];
		fontconfig = {
			defaultFonts = {
				monospace = ["Fira Mono" "Source Code Pro"];
				serif = ["Fira Serif" "Source Serif Pro"];
				sansSerif = ["Fira Sans" "Source Sans Pro"];
				emoji = ["Twitter Color Emoji"];
			};
		};
	};

	services = {
		pipewire = {
			enable = true;
			alsa.enable = true;
			alsa.support32Bit = true;
			pulse.enable = true;
		};

		tailscale = {
			enable = true;
		};
	};

	environment.systemPackages = with pkgs; [
		vim
		git
		wl-clipboard
		xdg-desktop-portal-wlr

		sway
		swaylock

		wayland
		wl-clip-persist
		wl-clipboard
		wf-recorder # record screen
		wlprop # xprop clone for wlroots based compositors
		waypipe

		imv
		mpv
		mako
		libnotify

		traceroute
		nmap
	];

	virtualisation = {
		docker = {
			enable = true;
		};
	};

	xdg.portal = {
		enable = true;
		configPackages = with pkgs; [
			xdg-desktop-portal-wlr
		];
		extraPortals = with pkgs; [
			xdg-desktop-portal-wlr
		];
	};

	nixpkgs.config.allowUnfree = true;
	
	# This value determines the NixOS release from which the default
	# settings for stateful data, like file locations and database versions
	# on your system were taken. It‘s perfectly fine and recommended to leave
	# this value at the release version of the first install of this system.
	# Before changing this value read the documentation for this option
	# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
	system.stateVersion = "24.11"; # Did you read the comment?
}
