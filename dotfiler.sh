HOME_FILES=(".tmux.conf" ".zsh" ".ctags" ".fasd" ".fasd-init-bash" ".vim" ".vimrc")
ZSH_FILES=("zlogin" "zlogout" "zpreztorc" "zprofile" "zshenv" "zshrc")
CONFIG_FILES=("nvim" "git")

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for i in "${HOME_FILES[@]}"
do
    if [ -d $BASEDIR/$i ] ; then
        ln -nsf $BASEDIR/$i ~/
    else
        ln -nsf $BASEDIR/$i ~/$i
    fi
done

for i in "${CONFIG_FILES[@]}"
do
    if [ -d $BASEDIR/.config/$i ] ; then
        ln -nsf $BASEDIR/.config/$i ~/.config/
    else
        ln -nsf $BASEDIR/.config/$i ~/.config/$i
    fi
done

ln -sf ~/.zsh/prezto ~/
rm -rf ~/.zprezto
mv ~/prezto ~/.zprezto

for i in "${LOCAL_FILES[@]}"
do
    if [ -d $BASEDIR/.local/share/$i ] ; then
        ln -nsf $BASEDIR/.local/share/$i ~/.local/share/
    else
        ln -nsf $BASEDIR/.local/share/$i ~/.local/share/$i
    fi
done
