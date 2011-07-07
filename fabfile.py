from fabric.api import local, lcd

def _installdependencies():
        local("sudo brew install ack")
        local("sudo brew install ctags")

def _installpythondependencies():
        local("sudo pip install pysmell")
        local("sudo pip install virtualenv")
        local("sudo pip install virtualenvwrapper")
        local("sudo pip install vim_debug")
        local("sudo pip install ropevim")
        local("sudo pip install pyflakes")

def _installcommandt():
    with lcd("./bundle/command-t/ruby/command-t/"):
        local("ruby extconf.rb")
        local("make")

def _symlink():
    currendir = local('echo $PWD',capture =True)
    local("ln -sF " + currendir+"/vimrc $HOME/.vimrc")

def updatesubmodules():
    local("git submodule foreach git checkout master")
    local("git submodule foreach git pull")

def install():
    local("git submodule init")
    local("git submodule update")
    _symlink()
    updatesubmodules()
    _installdependencies()
    _installcommandt()
    _installpythondependencies()
