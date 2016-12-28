#
# User configuration sourced by interactive shells
#

# Source zim
if [[ -s ${ZDOTDIR:-${HOME}}/.zim/init.zsh ]]; then
  source ${ZDOTDIR:-${HOME}}/.zim/init.zsh
fi

# Virtual Env
venv() {
  if [[ -n ${VIRTUAL_ENV} ]]; then
    echo "%F{blue}("${VIRTUAL_ENV:t}") "
  fi
}
PROMPT_LEAN_LEFT=venv

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Use fasd and fzf to implement z
eval "$(fasd --init posix-alias zsh-hook)"
unalias z
z() {
  local dir
  dir="$(fasd -Rdl "$1" | fzf -1 -0 --no-sort +m)" && cd "${dir}" || return 1
}

# base16-shell
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

