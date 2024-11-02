# Create private zshrc file
touch ~/.zshrc.private

# Create symlink from dotfiles/.zshrc to ~/.zshrc
ln -sf "$(pwd)/.zshrc" ~/.zshrc
