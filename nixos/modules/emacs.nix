{ pkgs, ... }:
{
	environment.systemPackages = [ pkgs.emacs ];

	services.emacs = {
		enable = true;
		package = pkgs.emacs;
	};
}
