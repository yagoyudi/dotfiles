{ pkgs, ... }:
{
	fonts = {
		packages = with pkgs; [
			fira-code
			fira-mono
			fira-sans
			fira-code-symbols
			twitter-color-emoji
		];
		fontconfig = {
			defaultFonts = {
				monospace = ["Fira Mono" "Source Code Pro"];
				serif = ["Fira Serif" "Source Serif Pro"];
				sansSerif = ["Fira Sans" "Source Sans Pro"];
				emoji = ["Twitter Color Emoji"];
			};
		};
	};
}
