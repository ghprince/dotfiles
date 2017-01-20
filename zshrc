#
# User configuration sourced by interactive shells
#

# Prompt configuration
PROMPT_LEAN_TMUX=""
PROMPT_LEAN_LEFT=prompt_venv

# Source zim
if [[ -s ${ZDOTDIR:-${HOME}}/.zim/init.zsh ]]; then
  source ${ZDOTDIR:-${HOME}}/.zim/init.zsh
fi

# virtualenv for python
prompt_venv() {
  if [[ -n ${VIRTUAL_ENV} ]]; then
    echo "%F{blue}("${VIRTUAL_ENV:t}") "
  fi
}

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

# iTerm2
test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# nvm
if [[ -s "/usr/local/opt/nvm/nvm.sh" ]]; then
  export NVM_DIR="$HOME/.nvm"
  source "/usr/local/opt/nvm/nvm.sh"
fi

# alias
## bundler
alias be='bundle exec'
