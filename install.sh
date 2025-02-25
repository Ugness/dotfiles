#! /bin/bash

#==================================================#
# argument parser
# usage : https://stackoverflow.com/questions/7069682/how-to-get-arguments-with-flags-in-bash
while getopts 'cfu:' flag; do
  case "${flag}" in
    c) install_conda='true' ;;
    f) forced='true' ;;
    u) update="${OPTARG}" ;;
  esac
done


#==================================================#
DOT_DIR=$PWD
ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$ZSH/custom


#==================================================#
source "$PWD/aliases/misc"
if [ "$forced" != "true" ]; then
    buo .Xmodmap .vim .vimrc .tmux.conf .aliases .gitconfig .gitconfig.secret .condarc .zshrc .oh-my-zsh .fzf
fi
ln -sf $DOT_DIR/Xmodmap $HOME/.Xmodmap 
ln -sf $DOT_DIR/vimrc $HOME/.vimrc
ln -sf $DOT_DIR/tmux.conf $HOME/.tmux.conf
ln -sf $DOT_DIR/gitconfig $HOME/.gitconfig
ln -sf $DOT_DIR/aliases $HOME/.aliases
ln -sf $DOT_DIR/zshrc $HOME/.zshrc
echo; echo '** download oh-my-zsh.'
bash $DOT_DIR/install-omz.sh; 
ln -sf $DOT_DIR/themes/mrtazz_custom.zsh-theme $HOME/.oh-my-zsh/themes/


#==================================================#
# download useful plugins

# zsh
echo; echo '** download zsh plugins.'
## zsh-syntax-highlighting 
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$ZSH/custom}/plugins/zsh-syntax-highlighting
## zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$ZSH/custom}/plugins/zsh-autosuggestions
## fzf
git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
$HOME/.fzf/install --all

# vim 
echo; echo '** download vim plugins.'
## colorschemes
mkdir $HOME/.vim
git clone https://github.com/flazz/vim-colorschemes.git $HOME/.vim
## pathogen: vim plugins manager
mkdir -p $HOME/.vim/autoload $HOME/.vim/bundle && curl -LSso $HOME/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
## nerdtree: file/directory browser
git clone https://github.com/scrooloose/nerdtree.git $HOME/.vim/bundle/nerdtree
## jedi-vim: jumps, auto-suggestions/completions
git clone --recursive https://github.com/davidhalter/jedi-vim.git $HOME/.vim/bundle/jedi-vim
## airline: status/tabline customization
git clone https://github.com/vim-airline/vim-airline $HOME/.vim/bundle/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes $HOME/.vim/bundle/vim-airline-themes
## vim-flake8 : pep8 checker
git clone https://github.com/nvie/vim-flake8.git $HOME/.vim/bundle/vim-flake8
## vim-commentary
mkdir -p $HOME/.vim/pack/tpope/start
git clone https://tpope.io/vim/commentary.git $HOME/.vim/pack/tpope/start/commentary
vim -u NONE -c "helptags commentary/doc" -c q
## ctrlp.vim
git clone https://github.com/ctrlpvim/ctrlp.vim.git $HOME/.vim/bundle/ctrlp.vim
vim -u NONE -c "helptags $HOME/.vim/bundle/ctrlp.vim/doc" -c q
## vim themes
git clone https://github.com/mhartington/oceanic-next.git $HOME/.vim/bundle/oceanic-next

# set zsh to the default shell
# echo; echo '** set ZSH as default shell.'
# echo "exec zsh" >> $HOME/.bash_profile
# exec zsh
