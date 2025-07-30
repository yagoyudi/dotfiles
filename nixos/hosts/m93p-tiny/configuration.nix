{ config, pkgs, ... }:
{
	imports = [
		./hardware-configuration.nix
		../../modules/ssh.nix
		../../modules/ssh-agent.nix
		../../modules/gpg-agent.nix
		../../modules/nix.nix
		../../modules/nixpkgs.nix
		../../modules/i18n.nix
		../../modules/timezone.nix
		../../modules/docker.nix
		../../modules/y.nix
		../../modules/zsh.nix
		../../modules/fonts.nix
		../../modules/bluetooth.nix
		../../modules/sway.nix
		../../modules/doas.nix
		../../modules/documentation.nix
		../../modules/xdg-portal.nix
		../../modules/rtkit.nix
		../../modules/auto-upgrade.nix
	];
	
	boot = {
		loader = {
			systemd-boot.enable = true;
			efi.canTouchEfiVariables = true;
		};
	};
	
	networking = {
		hostName = "m93p-tiny";
		networkmanager.enable = true;
	};
	
	console.keyMap = "br-abnt2";

	environment = {
		systemPackages = with pkgs; [
			neovim
			git
			wl-clipboard
			xdg-desktop-portal-wlr

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

	system.stateVersion = "24.11";
}
