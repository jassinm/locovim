f=$(pwd)
#initialise and update submodules
git submodule init
git submodule update
sudo brew install ack
sudo easy_install pip
sudo pip install pysmell
sudo pip install virtualenv
sudo pip install virtualenvwrapper
sudo pip install vim_debug
sudo pip install ropevim
sudo pip install pyflakes
sudo brew install ctags
#
#command-t
cd $f"/bundle/command-t/ruby/command-t"
ruby extconf.rb
make

ln -sF $f"/vimrc" $HOME/.vimrc
