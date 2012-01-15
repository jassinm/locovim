from fabric.api import local, lcd

def _installdependenciesosx():
    local("sudo brew install ack")
    local("sudo brew install ctags")

def _installdependencieslinux():
    local("sudo apt-get install ack")
    local("sudo apt-get install ctags")

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
    with lcd("./bundle/vim-powerline/"):
        local("git checkout develop")
        local("git pull")
        local("git checkout locojay")
        local("git merge  develop")
    with lcd("./bundle/ctrlp.vim"):
        local("git checkout custom_statusline")
        local("git pull")

def install():
    local("git submodule init")
    local("git submodule update")
    _symlink()
    updatesubmodules()
    ostype=local("uname -s",capture=True)
    if ostype =="Darwin":
        _installdependenciesosx()
    elif ostype == "Linux":
        _installdependencieslinux()
    else:
        raise Exception , "Unknow os type" #todo
    _installcommandt()
    _installpythondependencies()
