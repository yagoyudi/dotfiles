{ pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
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

		eza
	];
}
