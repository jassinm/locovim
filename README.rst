Loco's VIM configuration
========================

Intallation
-----------

+ from shell run (hopefully zsh + oh-myzsh) ::

    git clone https://locojay@github.com/locojay/locovim.git ~/.vim
    git submodule init
    git sumoduel update
    ln -s ~/vimrc .vimrc

+ install plugin's using `Vundle <https://github.com/gmarik/vundle>`_

    - start vim and type :BundleInstall

enjoy

Requirements
------------

- ack
- pyflakes
- ropevim
- ctags
- virtualenv / virtualenvwrapper
- vim_bridge

