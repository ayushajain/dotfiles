HOME_FILES=(".tmux.conf" ".zlogin" ".zlogout" ".zprezto" ".zpreztorc" ".zprofile" ".zsh" ".zshenv" ".zshrc" ".ctags" ".fasd" ".fasd-init-bash" ".vim" ".vimrc")
CONFIG_FILES=("nvim" "git")
LOCAL_FILES=("nvim")

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

for i in "${LOCAL_FILES[@]}"
do
    if [ -d $BASEDIR/.local/share/$i ] ; then
        ln -nsf $BASEDIR/.local/share/$i ~/.local/share/
    else
        ln -nsf $BASEDIR/.local/share/$i ~/.local/share/$i
    fi
done
