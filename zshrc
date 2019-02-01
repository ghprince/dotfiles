#
# User configuration sourced by interactive shells
#

# Prompt configuration
PROMPT_LEAN_LEFT=prompt_venv

# Source zim
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh

# virtualenv for python
prompt_venv() {
  if [[ -n ${VIRTUAL_ENV} ]]; then
    echo "%F{blue}("${VIRTUAL_ENV:t}") "
  fi
}

# fzf
if [[ -f ~/.fzf.zsh ]]; then
  source ~/.fzf.zsh
  [ -n "$NVIM_LISTEN_ADDRESS" ] && export FZF_DEFAULT_OPTS='--no-height'
fi

# Use fasd and fzf to implement z
if which fasd > /dev/null; then
  eval "$(fasd --init posix-alias zsh-hook)"
  unalias z
  z() {
    local dir
    dir="$(fasd -Rdl "$1" | fzf -1 -0 --no-sort +m)" && cd "${dir}" || return 1
  }
fi

# base16-shell
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# iTerm2
if [[ -e ${HOME}/.iterm2_shell_integration.zsh ]]; then
  source ${HOME}/.iterm2_shell_integration.zsh
fi

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then eval "$(pyenv init -)"; fi

# brew
export PATH="/usr/local/sbin:$PATH"

# nvm
if [[ -s "/usr/local/opt/nvm/nvm.sh" ]]; then
  export NVM_DIR="$HOME/.nvm"
  source "/usr/local/opt/nvm/nvm.sh"
fi

# alias
## bundler
alias be='bundle exec'

