with_netbox() {
  NETBOX_TOKEN=$(gopass NETBOX_TOKEN)
  NETBOX_URL="https://netbox.c3sl.ufpr.br"

  if [ "$#" -gt 0 ]; then
    "$@"
  fi
}

with_gitlab() {
  GITLAB_USERNAME=yyvf
  GITLAB_ACCESS_TOKEN=$(gopass GITLAB_TOKEN)

  if [ "$#" -gt 0 ]; then
    "$@"
  fi
}

with_netbox_gitlab() {
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

function netboxadm() {
	curl -sL https://netbox.c3sl.ufpr.br/api/plugins/netbox-proxmox-sync/update/ 2>&1 > /dev/null
	$HOME/gitlab.c3sl.ufpr.br/root/netboxadm/netboxadm $@
}
