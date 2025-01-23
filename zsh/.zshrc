export ZSH="$HOME/.oh-my-zsh"

# Cacheo de autocompletado
autoload -Uz compinit
if [[ -n "$ZDOTDIR" && -f "$ZDOTDIR/.zcompdump" ]]; then
    compinit -C
else
    compinit
fi
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$HOME/.zsh_cache"



plugins=(git compleat zsh-autosuggestions zsh-syntax-highlighting history-substring-search docker sudo)

source $ZSH/oh-my-zsh.sh

#ALIAS
alias idea="$HOME/Documentos/idea/bin/idea"
alias docker="sudo docker"
alias docker-compose="sudo docker-compose"
alias zed="$HOME/.local/bin/zed"
alias npm="sudo npm"
alias dotfiles="stow"

#ENVIRONMENT
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"


setopt CORRECT
setopt NO_CASE_GLOB

#STARSHIP
eval "$(starship init zsh)"
