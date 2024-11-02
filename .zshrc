# load private configurations and secrets
if [ -f ~/.zshrc.private ]; then
    source ~/.zshrc.private
fi

# .zshrc
alias rc="code ~/dotfiles/.zshrc"
alias rcs="source ~/.zshrc"

# prompt - currently using pure
fpath+=($HOME/.zsh/pure)
autoload -U promptinit; promptinit
prompt pure

# Enable ZSH completion system first
autoload -Uz compinit
compinit

# up/own arrow key bindings for history search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# aliases
alias cursor="code" # cursor / code

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

# mise
eval "$(~/.local/bin/mise activate zsh)"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
