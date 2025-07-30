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
		../../modules/system-pkgs.nix
		../../modules/pipewire.nix
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
	
	hardware.graphics.enable = true;
	
	system.stateVersion = "24.11";
}
