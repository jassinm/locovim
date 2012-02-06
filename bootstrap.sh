vimf=$(pwd)
#initialise and update submodules
git submodule init
git submodule update
git submodule foreach git pull origin master
#sudo brew install ack
#sudo brew install ctags
#sudo easy_install pip
#sudo pip install pysmell
#sudo pip install virtualenv
#sudo pip install virtualenvwrapper
#sudo pip install vim_debug
#sudo pip install ropevim
#sudo pip install pyflakes
#sudo pip install vim_bridge

SYMLINK="ln -nfs"

$SYMLINK $vimf/vimrc $HOME/.vimrc
