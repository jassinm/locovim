vimf=$(pwd)
#initialise and update submodules
git submodule init
git submodule update
#sudo brew install ack
#sudo easy_install pip
#sudo pip install pysmell
#sudo pip install virtualenv
#sudo pip install virtualenvwrapper
#sudo pip install vim_debug
#sudo pip install ropevim
#sudo pip install pyflakes
#sudo pip install vim_bridge
#sudo brew install ctags

SYMLINK="ln -fs"

$SYMLINK $vimf/vimrc $HOME/.vimrc
