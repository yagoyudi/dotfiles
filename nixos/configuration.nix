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
		tmp.cleanOnBoot = true;
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
		
		sudo = {
			enable = false;
			wheelNeedsPassword = false;
		};

		doas = {
			enable = true;
			extraRules = [
				{
					users = [
						"y"
					];
					keepEnv = true;
					persist = true;
				}
			];
		};
	};

	virtualisation = {
		docker = {
			enable = true;
		};
		containerd = {
			enable = true;
		};
	};

	hardware = {
		bluetooth = {
			enable = true;
			powerOnBoot = true;
		};
		pulseaudio.enable = false;
		graphics.enable = true;
	};

	users.users.y = {
		isNormalUser = true;
		description = "y";
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
			foot
			dmenu
			gh
			chezmoi
			tmux
			lua-language-server
			clang-tools
			opentofu
			go-task
			gopls
			pyright
			gopass
			eza
			zoxide
			starship
			go
			gotools
			mage
			glow
			emacs
			gcc
			tree
			lua
			zig
			tldr
			qutebrowser
			rootlesskit
			slirp4netns
			cni-plugins
			runc
			nerdctl
			mdbook
			pulsemixer
			just
			grim
			thunderbird
			gnumake
			firefox
			yamlfmt
			slurp
			speedtest-go
			talosctl
			kubectl
			minikube
			podman
			buildah
			kubernetes-helm
			k9s
			argocd
			fluxcd
			brightnessctl
			tea
			geek-life
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
			kubecolor
			gotop
			gopls
			nuclei
			gofumpt
			helix
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
			# If you want to use JACK applications, uncomment this
			#jack.enable = true;

			# use the example session manager (no others are packaged yet so this is enabled by default,
			# no need to redefine it in your config for now)
			#media-session.enable = true;
		};

		tailscale = {
			enable = false;
		};
	};

	environment = {
		systemPackages = with pkgs; [
			neovim
			git
			wl-clipboard
			xdg-desktop-portal-wlr

			sway
			river
			swaylock

			wayland
			wlr-randr
			wl-clip-persist
			wl-clipboard
			wf-recorder # record screen
			wlprop # xprop clone for wlroots based compositors
			waypipe
			wdisplays

			xdg-utils

			devbox

			busybox
			dig

			imv
			mpv
			mako
			libnotify

			traceroute
			nmap
			
			man-pages
			man-pages-posix
		];
		etc = {
			"alternatives/vi".source = "${pkgs.neovim}/bin/nvim";
		};
	};

	documentation = {
		dev.enable = true;
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
	
	programs = {
		ssh.startAgent = true;
		gnupg.agent.enable = true;
	};

	system = {
		stateVersion = "24.11";
		autoUpgrade = {
			enable = true;
			allowReboot = false;
		};
	};
}
