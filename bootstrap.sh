f=$(pwd)
#initialise and update submodules
git submodule init
git submodule update
sudo brew install ack
sudo pip install pysmell
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
