# install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# create private zshrc file
touch ~/.zshrc.private

# create symlink from dotfiles/.zshrc to ~/.zshrc
ln -sf "$(pwd)/.zshrc" ~/.zshrc
ln -sf "$(pwd)/Brewfile" ~/Brewfile


# non-brew applications #########################################################

# brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

# ################################################################################