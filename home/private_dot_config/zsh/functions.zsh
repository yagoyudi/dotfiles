function with_netbox() {
	export NETBOX_TOKEN=$(gopass NETBOX_TOKEN)
	export NETBOX_URL="https://netbox.c3sl.ufpr.br"

	if [ "$#" -gt 0 ]; then
		"$@"
	fi
}

function with_gitlab() {
	export GITLAB_USERNAME=yyvf
	export GITLAB_ACCESS_TOKEN=$(gopass GITLAB_TOKEN)

	if [ "$#" -gt 0 ]; then
		"$@"
	fi
}

function with_netbox_gitlab() {
	with_netbox
	with_gitlab

	"$@"
}

# https://codeberg.org/dnkl/foot/wiki#user-content-spawning-new-terminal-instances-in-the-current-working-directory
function osc7-pwd() {
	emulate -L zsh # also sets localoptions for us
	setopt extendedglob
	local LC_ALL=C
	printf '\e]7;file://%s%s\e\' $HOST ${PWD//(#m)([^@-Za-z&-;_~])/%${(l:2::0:)$(([##16]#MATCH))}}
}

function chpwd-osc7-pwd() {
	(( ZSH_SUBSHELL )) || osc7-pwd
}
add-zsh-hook -Uz chpwd chpwd-osc7-pwd

function keep_monitor() {
	# Verifica se jq e swaymsg estão instalados:
	for cmd in swaymsg jq; do
		if ! command -v "$cmd" &> /dev/null;
		then echo "Erro: O comando '$cmd' não foi encontrado." >&2; return 1;
		fi
	done

	# Coloca os nomes dos monitores em um array:
	local monitors
	monitors=(${(f)"$(swaymsg -t get_outputs | jq -r '.[] | select(.active) | .name')"})
	if [[ ${#monitors[@]} -eq 0 ]]; then
		echo "Nenhum monitor ativo encontrado."
		return 1
	fi

	local selected_monitor
	# Apresenta um menu numerado para seleção:
	PS3="Qual monitor você quer manter ligado? "
	select choice in "${monitors[@]}" "Sair"; do
		if [[ "$choice" == "Sair" ]]; then
			echo "Abortando."
			return 0
		elif [[ -n "$choice" ]]; then
			selected_monitor=$choice
			break
		else
			echo "Opção inválida. Tente novamente."
		fi
	done

	# Itera por todos os monitores e aplica as mudanças:
	for monitor in "${monitors[@]}"; do
		if [[ "$monitor" == "$selected_monitor" ]]; then
			swaymsg output "$monitor" enable
		else
			swaymsg output "$monitor" disable
		fi
	done

	echo "\nConfiguração de monitores aplicada!"
}
