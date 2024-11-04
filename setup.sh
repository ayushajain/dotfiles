# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Create private zshrc file
touch ~/.zshrc.private

# Create symlink from dotfiles/.zshrc to ~/.zshrc
ln -sf "$(pwd)/.zshrc" ~/.zshrc
ln -sf "$(pwd)/.zshrc.completions" ~/.zshrc.completions
ln -sf "$(pwd)/Brewfile" ~/Brewfile


# Non-brew applications #########################################################

# brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

# ################################################################################