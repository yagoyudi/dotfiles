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
		../../modules/auto-upgrade.nix
		../../modules/system-pkgs.nix
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

	system.stateVersion = "24.11";
}
