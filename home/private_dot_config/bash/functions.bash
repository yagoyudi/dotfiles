# https://codeberg.org/dnkl/foot/wiki#user-content-spawning-new-terminal-instances-in-the-current-working-directory
function osc7_cwd() {
    local strlen=${#PWD}
    local encoded=""
    local pos c o
    for (( pos=0; pos<strlen; pos++ )); do
        c=${PWD:$pos:1}
        case "$c" in
            [-/:_.!\'\(\)~[:alnum:]] ) o="${c}" ;;
            * ) printf -v o '%%%02X' "'${c}" ;;
        esac
        encoded+="${o}"
    done
    printf '\e]7;file://%s%s\e\\' "${HOSTNAME}" "${encoded}"
}

PROMPT_COMMAND=${PROMPT_COMMAND:+${PROMPT_COMMAND%;}; }osc7_cwd

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
