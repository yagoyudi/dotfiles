{ config, pkgs, ... }:
{
	imports = [
		./hardware-configuration.nix
		../../modules/docker.nix
		../../modules/nix.nix
		../../modules/nixpkgs.nix
		../../modules/timezone.nix
		../../modules/i18n.nix
		../../modules/keymap.nix
		../../modules/sway.nix
		../../modules/y.nix
		../../modules/doas.nix
		../../modules/fonts.nix
		../../modules/documentation.nix
		../../modules/xdg-portal.nix
		../../modules/zsh.nix
		../../modules/ssh-agent.nix
		../../modules/gpg-agent.nix
		../../modules/auto-upgrade.nix
		../../modules/bluetooth.nix
	];

	
	boot = {
		loader = {
			systemd-boot.enable = true;
			efi.canTouchEfiVariables = true;
		};
		initrd.luks.devices."luks-50927432-5e4d-4527-a574-5beee22cc209".device = "/dev/disk/by-uuid/50927432-5e4d-4527-a574-5beee22cc209";
		tmp.cleanOnBoot = true;
	};
	
	networking = {
		hostName = "swift3";
		networkmanager.enable = true;
		nameservers = [
			"8.8.8.8"
			"1.1.1.1"
		];
	};
	
	security = {
		rtkit.enable = true;
	};

	hardware = {
		graphics.enable = true;
	};
	
	services = {
		pulseaudio.enable = false;
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

			#sway
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

			eza

			zsh-vi-mode
		];
	};

	nixpkgs.config.allowUnfree = true;

	system.stateVersion = "24.11";
}
