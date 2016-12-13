ZSH_THEME_DATE_PREFIX="%{$reset_color%}%{$fg[white]%}"
ZSH_THEME_DATE_SUFFIX=" %{$reset_color%}"
date_custom_status() {
  echo "$ZSH_THEME_DATE_PREFIX$(date +"%r")$ZSH_THEME_DATE_SUFFIX"
}

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
git_custom_status() {
  local cb=$(current_branch)
  if [ -n "$cb" ]; then
    echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

ZSH_THEME_PROMPT_PREFIX="%{$fg[cyan]%}"
ZSH_THEME_PROMPT_SUFFIX="%{$reset_color%}%B$%b "
my_zsh_prompt() {
  echo "$ZSH_THEME_PROMPT_PREFIX %~ % $ZSH_THEME_PROMPT_SUFFIX"
}

PROMPT='$(date_custom_status)$(git_custom_status)$(my_zsh_prompt)'
