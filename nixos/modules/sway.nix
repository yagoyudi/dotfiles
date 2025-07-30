{ pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		swaylock
		grim
		slurp
		wl-clipboard
		mako
	];

	security.pam = {
		services.swaylock = {};
	};

	programs = {
		sway.enable = true;
	};
}
