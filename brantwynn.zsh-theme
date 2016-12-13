#Ruby settings
if [[ -s ~/.rvm/scripts/rvm ]] ; then 
  #RPS1="%{$fg[cyan]%}rvm:%{$reset_color%}%{$fg[blue]%}\$(~/.rvm/bin/rvm-prompt)%{$reset_color%} $EPS1"
else
  if which rbenv &> /dev/null; then
    #RPS1="%{$fg[cyan]%}rbenv:%{$reset_color%}%{$fg[blue]%}\$(rbenv version | sed -e 's/ (set.*$//')%{$reset_color%} $EPS1"
  fi
fi

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

#Customized git status, oh-my-zsh currently does not allow render dirty status before branch
git_custom_status() {
  local cb=$(current_branch)
  if [ -n "$cb" ]; then
    echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

ZSH_THEME_DATE_PREFIX="%{$reset_color%}%{$fg[gray]%}"
ZSH_THEME_DATE_SUFFIX=" %{$reset_color%}"
date_custom_status() {
  echo "$ZSH_THEME_DATE_PREFIX$(date +"%r")$ZSH_THEME_DATE_SUFFIX"
}

PROMPT='$(date_custom_status)$(git_custom_status)%{$fg[cyan]%} %~ % %{$reset_color%}%B$%b '
