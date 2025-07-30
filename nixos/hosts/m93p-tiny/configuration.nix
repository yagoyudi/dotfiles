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
		../../modules/podman.nix
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
		useNetworkd = true;
		wireless = {
			enable = true;
			userControlled.enable = true;
		};
	};

	systemd.network = {
		enable = true;

		networks."10-eno1" = {
			matchConfig.Name = "eno1";
			networkConfig.DHCP = "ipv4";
		};

		networks."20-wlp2s0" = {
			matchConfig.Name = "wlp2s0";
			networkConfig.DHCP = "ipv4";
		};
	};
	
	console.keyMap = "br-abnt2";

	system.stateVersion = "24.11";
}
