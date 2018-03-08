BULLETTRAIN_PROMPT_ORDER=(
  time
  status
  custom
  context
  dir
  virtualenv
  aws
  git
  cmd_exec_time
)

BULLETTRAIN_STATUS_EXIT_SHOW=true

BULLETTRAIN_CONTEXT_DEFAULT_USER=jamesallen

BULLETTRAIN_DIR_BG=blue
BULLETTRAIN_DIR_FG=black

BULLETTRAIN_GIT_PREFIX=" "
BULLETTRAIN_GIT_COLORIZE_DIRTY=true
BULLETTRAIN_GIT_BG=green
BULLETTRAIN_GIT_DIRTY=
BULLETTRAIN_GIT_CLEAN=
BULLETTRAIN_GIT_ADDED=" "
BULLETTRAIN_GIT_MODIFIED=" "
BULLETTRAIN_GIT_DELETED=" "
BULLETTRAIN_GIT_UNTRACKED=" "
BULLETTRAIN_GIT_RENAMED=" "
BULLETTRAIN_GIT_UNMERGED=" "
BULLETTRAIN_GIT_AHEAD=" ⬆"
BULLETTRAIN_GIT_BEHIND=" ⬇"
BULLETTRAIN_GIT_DIVERGED=" ⬍"
BULLETTRAIN_GIT_TAG=" "

BULLETTRAIN_VIRTUALENV_BG=blue
BULLETTRAIN_VIRTUALENV_FG=black
BULLETTRAIN_VIRTUALENV_PREFIX=" "

BULLETTRAIN_GIT_PROMPT_CMD="\$(custom_git_prompt)"

git_tag() {
    local tag
    tag=$(git describe --tags --exact-match HEAD 2>/dev/null)
    if [[ -n "${tag}" ]] ; then
        echo "$BULLETTRAIN_GIT_TAG $tag"
    fi
}

custom_git_prompt() {
    prompt=$(git_prompt_info)
    prompt+=$(git_tag)
    echo ${prompt}
}
