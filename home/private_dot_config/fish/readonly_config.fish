# Verificar se o shell é interativo
if status --is-interactive
	set -g fish_greeting

	fish_vi_key_bindings
	bind -M insert \cf accept-autosuggestion

	function k
		kubectl $argv
	end

	# PATH
	set -U fish_user_paths $fish_user_paths $HOME/go/bin

	# Variáveis de ambiente
	set -x EDITOR vi
	set -x PASSWORD_STORE_DIR $HOME/github.com/yagoyudi/pass

	# Carregar variáveis de sessão do Nix
	# source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh

	# Inicializar o Starship
	starship init fish | source
end

