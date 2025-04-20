ZSH_THEME="avit"

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
alias webstorm='/opt/webstorm-eap/bin/webstorm'
alias idea='/opt/intellij-idea-ce-eap/bin/idea.sh'

eval "$(zoxide init zsh)"

bindkey -v
export KEYTIMEOUT=1

export PATH="$PATH:/home/irwtn/.local/bin"

export PATH="/home/irwtn/.bun/bin:$PATH"
export PATH="/home/irwtn/.cache/.bun/bin:$PATH"

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

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source /usr/share/fzf/key-bindings.zsh

export WINAPPS_SRC_DIR="$HOME/.local/bin/winapps-src"

export ANDROID_AVD_HOME="$HOME/.config/.android/avd"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

export PATH="$PATH:$(go env GOBIN):$(go env GOPATH)/bin"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

