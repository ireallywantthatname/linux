if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

cd() {
  builtin cd "$@" && ls -a
}

alias vim='nvim'
alias cat='bat'
alias nano='nvim'
alias neofetch='fastfetch'
alias rm='trash-put'
alias cmatrix='neo-matrix'

eval "$(zoxide init zsh)"

bindkey -v
export KEYTIMEOUT=1

export PATH="$PATH:/home/irwtn/.local/bin"

export PATH="/home/irwtn/.bun/bin:$PATH"

autoload -U compinit && compinit

bindkey '^ ' autosuggest-accept
bindkey '^H' backward-kill-word

export LESS_TERMCAP_mb=$'\e[1;31m'
export LESS_TERMCAP_md=$'\e[1;31m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;44;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;32m'

export PATH="$HOME/.cargo/bin:$PATH"

export PATH="/home/irwtn/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/home/irwtn/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"
export PATH="$PATH:/home/irwtn/.dotnet/tools"

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

export TERM=xterm

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source /usr/share/fzf/key-bindings.zsh
