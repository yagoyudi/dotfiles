{ pkgs, ... }:
{
	xdg.portal = {
		enable = true;
		configPackages = with pkgs; [
			xdg-desktop-portal-wlr
		];
		extraPortals = with pkgs; [
			xdg-desktop-portal-wlr
		];
	};
}
