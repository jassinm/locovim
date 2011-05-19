f=$(pwd)
#initialise and update submodules
git submodule init
git submodule update
sudo brew install ack
sudo easy_install pip
sudo pip install pysmell
sudo pip install virtualenv
sudo pip install virtualenvwrapper
#ctags with Objc support
git clone https://github.com/fishman/ctags.git /tmp/ctags-objc
cd /tmp/ctags-objc
autoheader
autoconf
./configure
make
sudo make install
sudo rm -rf /tmp/ctags-obc
#
#command-t
cd $f"/bundle/command-t/ruby/command-t"
ruby extconf.rb
make

ln -sF $f"/vimrc" $HOME/.vimrc
