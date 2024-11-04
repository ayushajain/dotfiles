# path to oh my zsh installation
export ZSH="$HOME/.oh-my-zsh"

# enable zsh completion system first
autoload -Uz compinit
compinit

# terminal theme
ZSH_THEME="robbyrussell"

# oh my zsh plugins (cli autocomplete)
# https://github.com/ohmyzsh/ohmyzsh/wiki/plugins
plugins=(git aws brew docker dotenv tailscale node nvm npm mise 1password)

# load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# up/own arrow key bindings for history search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# mise
eval "$(~/.local/bin/mise activate zsh)"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# git
alias g='git'
compdef g=git

# git checkout completion - show only local branches
zstyle ':completion::complete:git-checkout:argument-1:' tag-order '!remotes' local-branches

# git config aliases (these will maintain completion)
git config --global alias.s status
git config --global alias.c checkout
git config --global alias.co commit
git config --global alias.d diff
git config --global alias.p push
git config --global alias.pl pull
git config --global alias.b branch
git config --global alias.m merge
git config --global alias.st stash

# aliases
alias cursor="code" # cursor / code
alias rc="code ~/dotfiles/.zshrc" # edit zshrc
alias rcs="source ~/.zshrc" # reload zshrc

# load private configurations and secrets
if [ -f ~/.zshrc.private ]; then
    source ~/.zshrc.private
fi