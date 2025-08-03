{ pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		river
		river-tag-overlay
		bemenu
		lswt
		sandbar
	];
}
