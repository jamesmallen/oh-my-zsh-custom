# auto tab coloring

function set_iterm_tab_color () {
  local red=$1;
  local green=$2;
  local blue=$3;
  printf "\033]6;1;bg;red;brightness;$red\a"
  printf "\033]6;1;bg;green;brightness;$green\a"
  printf "\033]6;1;bg;blue;brightness;$blue\a"
}

function auto_tab_color_from_cmd () {
  local cmd=$2
  for (( i = 1; i <= $#AUTO_TAB_CMDS; i += 3)) do
    cmd_regex="${AUTO_TAB_CMDS[i]}"
    rgb=(${=AUTO_TAB_CMDS[i+1]})
    if [[ "$cmd" =~ "$cmd_regex" ]]; then
      set_iterm_tab_color $rgb
      AUTO_TAB_CLEAR="${AUTO_TAB_CMDS[i+2]}"
      break
    fi
  done
}

function auto_tab_color_from_cmd_clear () {
  if (( AUTO_TAB_CLEAR == 1 )); then
    printf "\033]6;1;bg;*;default\a"
    AUTO_TAB_CLEAR=0
  fi
}

AUTO_TAB_CMDS=(
  "ssh.*@salt-master.internal.ignitionpai.com" "214 90 84" 1
  "ssh.*@salt-master.internal.stage.vkdata.io" "210 144 64" 1
  "ssh.*@salt-master.internal.dev.vkdata.io" "152 181 65" 1
)
AUTO_TAB_CLEAR=0

add-zsh-hook preexec auto_tab_color_from_cmd
add-zsh-hook precmd auto_tab_color_from_cmd_clear
