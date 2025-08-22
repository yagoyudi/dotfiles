{ pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		zsh-vi-mode
	];

	programs.zsh = {
		enable = true;
		enableCompletion = true;
		autosuggestions.enable = true;
		syntaxHighlighting.enable = true;
		interactiveShellInit = ''
			source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
		'';
	};
}
