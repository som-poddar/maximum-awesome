# IMPORTANT setup an environment variable name 'CONFIGHOME'

# step 1: remove existings configs, store them in a backup folder

# mkdir ~/.conf.bak
# 
# mv ~/.gitconfig ~/.conf.bak/
# mv ~/.oh-my-zsh ~/.conf.bak/
# mv ~/.profile ~/.conf.bak/
# mv ~/.tmux.conf ~/.conf.bak/
# mv ~/.tmux-init ~/.conf.bak/
# mv ~/.vimrc ~/.conf.bak/
# mv ~/.vimrc.bundles ~/.conf.bak/
# mv ~/.vimrc.local ~/.conf.bak/


# export CONFIGHOME= {the location of maximux-awesome/ folder}


ln -s $CONFIGHOME/gitconfig ~/.gitconfig 
ln -s $CONFIGHOME/oh-my-zsh ~/.oh-my-zsh 
ln -s $CONFIGHOME/profile ~/.profile 
ln -s $CONFIGHOME/tmux.conf ~/.tmux.conf 
ln -s $CONFIGHOME/tmux-init ~/.tmux-init 
ln -s $CONFIGHOME/vimrc ~/.vimrc 
ln -s $CONFIGHOME/vim ~/.vim 
ln -s $CONFIGHOME/vimrc.bundles ~/.vimrc.bundles 
ln -s $CONFIGHOME/vimrc.local ~/.vimrc.local 

# clone vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim