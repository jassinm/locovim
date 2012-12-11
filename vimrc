"-------------------------------------------------------------
"Vundle plugin
"-------------------------------------------------------------
set nocompatible "turn off vi compatibility, required for vundle"
filetype off

set rtp+=~/.vim/vundle/
call vundle#rc()"



" Look good ---------------------------------------------------------------- {{{
Bundle 'nanotech/jellybeans.vim.git'
Bundle 'sjl/badwolf'
Bundle 'godlygeek/csapprox'
Bundle 'altercation/vim-colors-solarized'

"Alt key
if has("gui_mac")
    set macmeta
endif

"Set up the window colors and size
if has('gui_running')
    " GUI colors
    "colorscheme jellybeans
    " colorscheme jellybeans_locojay
    colorscheme badwolf
    "set guifont=Monaco:h12
    if has("gui_gtk2")
        set guifont=PragmataPro\ 15
    else
        set guifont=PragmataPro:h15
    endif
    set guioptions=egmrt
    set guioptions-=T
    winpos 0 0
    winsize 270 70
    set go-=L
    set go-=r
elseif $TERM == "xterm-256color" || $TERM == "screen-256color"
    " Non-GUI (terminal) colors
    set t_Co=256
    "colorscheme jellybeans
    " colorscheme jellybeans_locojay
    colorscheme badwolf
    "set guifont=Monaco:h12
    set guifont=PragmataPro:h15
    set lazyredraw
endif
" }}}


"Vim Settings---------------------------------------------------------------- {{{
let mapleader=","
let maplocalleader = "\\"

"save a keypress
map ; :

set encoding=utf-8

set fillchars+=vert:│


" Set backspace config
set backspace=eol,start,indent
set showbreak=↪

"shut up
set visualbell           " don't beep
set noerrorbells         " don't beep

"Motion Settings
"Life saver
ino jj <esc>
cno jj <esc>

"visual
vnoremap < <gv
vnoremap > >gv

"got to middle of the line (vimbits.com)
nnoremap gm :call cursor(0, len(getline('.'))/2)<cr>

"show invisible shars
set list
set listchars=tab:▸\ ,eol:¬
set cpoptions+=$
"add line numbers
set number
function! ToggleRelativeNumber()
    if &nu == 1
        set rnu
    else
        set nu
    endif
endfunction

command! Rn call ToggleRelativeNumber()

syntax on

set noswapfile

" Mouse Support
"add mouse support
set mouse=a
"let this work in tmux 2
set ttymouse=xterm2


"fast
set ttyfast

"undo statck
set undofile


" Clipboad and Pasting
"add to clipbord
set clipboard+=unnamed
"paste mode
"nnoremap <F5> :set invpaste paste?<CR>
"set pastetoggle=<F5>
set showmode
"auto paste in paste mode
imap <Leader>v  <C-O>:set paste<CR><C-r>*<C-O>:set nopaste<CR>


" tell VIM to always put a status line in, even if there is only one window
set laststatus=2
"keep a longer history
set history=1000

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
" sjl
set notimeout
set ttimeout
set ttimeoutlen=10

" }}}


"Completion/Wildmenu ----------------------------------------------------------- {{{
set wildmode=longest:full
set wildmenu
set completeopt=menu,preview
"autoclose preview window
if has("autocmd")
    autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
    autocmd InsertLeave * if pumvisible() == 0|pclose|endif
endif
"omnifocus as constrol space
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
            \ "\<lt>C-n>" :
            \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
            \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
            \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

set wildignore=*.swp,*.bak
set wildignore+=*/.svn/*,/*.hg/*,/*.git/* " Version control (not git as otherwise conflict with fugitive)
set wildignore+=*/.virtualenvs/*
set wildignore+=*.aux,*.out,*.toc " LaTeX stuff
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg "Pics
set wildignore+=*.o,*.obj,*.pyc,*.class "compiled files, bytecode
set wildignore+=*.DS_Store
set wildignore+=*.pdf,*.xls,*.xlsx,*.doc
set wildignore+=*.jar
" Lein
set wildignore+=classes
set wildignore+=lib

" }}}


" Buffer/Tab/Window nativgation ----------------------------------------------------------- {{{
set hidden "Allows to change buffer w/o saving current buffer

Bundle 'orftz/sbd.vim'
"Bundle 'vim-scripts/bufkill.vim'

"noremap <silent><Leader>bd :bd<CR>
nnoremap <silent><leader>bd :Sbd<CR>
"nnoremap <silent><leader>bdm :Sbdm<CR>

noremap <silent><Leader>bn :bn<CR>
noremap <silent><Leader>bp :bp<CR>
noremap <silent><Leader>ba :1,300 bd!<CR> "close all buffer


"Tab commands
noremap <silent> <Leader>tp :tabprevious<CR>
noremap <silent> <Leader>tn :tabnext<CR>

"Windows Settings
" Move the cursor to the window left of the current one
noremap <silent><Leader>wh :wincmd h<cr>
" Move the cursor to the window below the current one
noremap <silent><Leader>wj :wincmd j<cr>
" Move the cursor to the window above the current one
noremap <silent><Leader>wk :wincmd k<cr>
" Move the cursor to the window right of the current one
noremap <silent><Leader>wl :wincmd l<cr>

noremap <silent><Leader>cj :wincmd j<CR>:close<CR>
noremap <silent><Leader>ck :wincmd k<CR>:close<CR>
noremap <silent><Leader>ch :wincmd h<CR>:close<CR>
noremap <silent><Leader>cl :wincmd l<CR>:close<CR>
noremap <silent><Leader>cc :wincmd c<CR>:close<CR>

noremap <silent><Leader>wr :wincmd r<CR>
noremap <silent><Leader>wo :wincmd o<CR>
noremap <silent><Leader>wx :wincmd x<CR>
noremap <silent><Leader>ww :wincmd w<CR>


noremap <silent><Leader>vs :vsplit <CR>
noremap <silent><Leader>hs :split <CR>

"Quickfix window Settings
"use vim -unimpaired
"noremap <silent> ,cn :cn<CR>
"noremap <silent> ,cp :cp<CR>

"location list
noremap <silent> <leader>lo :lopen<CR>

" }}}


"Some more-------------------------------------------------- {{{
nmap <silent> <Leader>ev :vsplit $HOME/.vimrc<CR>
nmap <silent> <Leader>sv :so $HOME/.vimrc<CR>

" When pressing <leader>cd switch to the directory of the open buffer
map <silent><Leader>cd :cd %:p:h<CR>
"Move lines up and down
nnoremap <M-j> :m+<CR>==
nnoremap <M-k> :m-2<CR>==
inoremap <M-j><Esc> :m+<CR>==gi
inoremap <M-k><Esc> :m-2<CR>==gi
vnoremap <M-j> :m'>+<CR>gv=gv
vnoremap <M-k> :m-2<CR>gv=gv
"Calculator
inoremap <C-B> <C-O>yiW<End>=<C-R>=<C-R>0<CR>
"urlview
noremap <silent><leader>u :! urlview %<CR>
" }}}


"Search Settings -------------------------------------------------- {{{

nnoremap / /\v
vnoremap / /\v
set smartcase
set incsearch "search as you type
set gdefault "always /g
set ignorecase
set showmatch "show matching braces
set hlsearch
"replace word under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
map <silent><Leader><space> :noh<CR>

"Spell Checking
map <leader>ss :setlocal spell! spelllang=en_us<cr>
" }}}


"Folding ------------------------------------------------ {{{
" Javadoc comments (/** and */ pairs) and code sections (marked by {} pairs) mark the start and end of folds. All other
" lines simply take the fold level that is going so far.
function! MyFoldLevel( lineNumber )
  let thisLine = getline( a:lineNumber )
  " If the entire Javadoc comment or the {} pair is on one line, then don't create a fold for it.
  if ( thisLine =~ '\%(\%(/\*\*\).*\%(\*/\)\)\|\%({.*}\)' )
    return '='
  elseif ( thisLine =~ '\%(^\s*/\*\*\s*$\)\|{' )
    return "a1"
  elseif ( thisLine =~ '\%(^\s*\*/\s*$\)\|}' )
    return "s1"
  endif
  return '='
endfunction

"}}}


" Default Tabs, spaces, wrapping ------------------------------------ {{{
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set wrap
set textwidth=85
set formatoptions=qrn1

" }}}


"Filetype Settings -------------------------------------------------{{{
if has("autocmd")
    "All filetypes
    "remove trailing whitespaces
    autocmd BufWritePre * :%s/\s\+$//e

    "vim
    au FileType vim setlocal foldmethod=marker

    "Large files
    autocmd BufReadPost * if getfsize(bufname("%")) > 512*1024 | set syntax=| set filetype=| endif

    "Help
    "help in vertical split
    autocmd FileType help wincmd L

    " R
    autocmd FileType r setlocal ts=8 sts=4 sw=4 expandtab

    "Html
    autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType htmldjango setlocal ts=2 sts=2 sw=2 expandtab

    "Python
    autocmd FileType python setlocal ts=8 sts=4 sw=4 expandtab
    autocmd FileType python setlocal autoindent
    "nose for unittest
    autocmd FileType python compiler nose
    autocmd FileType python set omnifunc=pythoncomplete#Complete
    autocmd FileType python set formatprg=PythonTidy
    if exists('+colorcolumn')
          " autocmd FileType python set colorcolumn=80
    endif
    "Clojure"
    " autocmd FileType clojure set ts=2 sts=2 sw=2 expandtab
    autocmd FileType clojure compiler clojure
    autocmd FileType clojure silent! call TurnOnClojureFolding()
    autocmd BufNewFile,BufRead *.clj set filetype=clojure
    autocmd Filetype clojure setlocal lispwords+=defpage,defpartial,deftest,defroute

    "clojurescript
    autocmd BufNewFile,BufRead *.cljs set filetype=clojure

    "
    "Css
    autocmd Filetype css set omnifunc=csscomplete#CompleteCSS

    "Javascript
    autocmd Filetype javascript setlocal ts=4 sts=4 sw=4 expandtab
    autocmd BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

    "Tex
    autocmd FileType tex setlocal ts=8 sts=4 sw=4 expandtab

    "Json
    autocmd BufNewFile,BufRead *.json setfiletype json

    "Processing
    autocmd BufNewFile,BufRead *.pde setfiletype processing

    "Pweave
    autocmd BufNewFile,BufRead *.Pnw set filetype=python

    "Objective-j
    au BufNewFile,BufRead *.j  setfiletype objc
    au BufNewFile,BufRead *.j  setlocal ts=8 sts=4 sw=4 expandtab
    au BufNewFile,BufRead *.j setlocal foldexpr=MyFoldLevel(v:lnum)
    au BufNewFile,BufRead *.j setlocal foldmethod=expr

    "Java
    au Filetype java setlocal foldexpr=MyFoldLevel(v:lnum)
    au Filetype java setlocal foldmethod=expr

    "Sweave
    au BufNewFile,BufRead *.Rnw map <Leader>swe :execute '!/usr/local/bin/R CMD Sweave '.expand('%:p')<CR>

    au BufRead ~/.mutt/temp/mutt* set spell
    "Mutt

    "Scala
    autocmd BufNewFile,BufRead *.scala set filetype=scala


endif

" }}}


"Python Settings/Plugins --------------------------------------------- {{{
function! PythonTidySaver()
    let oldpos=getpos('.')
    %!PythonTidy
    call setpos('.',oldpos)
endfunction

"autocmd! bufwritepost *.py call PythonTidySaver()
"Virtualenv
if  has('python')
    Bundle 'jmcantrell/vim-virtualenv.git'
    if !empty($VIRTUAL_ENV)
        let g:virtualenv_auto_activate=1
    endif

    "make sure to change /etc/paths"
    function! MakePyProjet(projectname)
        " execute '!source /usr/local/share/python/virtualenvwrapper.sh'
        execute '!mkproject& -t locodev ' . a:projectname
    endfunction
else
    "ack to make vi work
    function! VirtualEnvStatusline()
    endfunction

endif

Bundle 'ivanov/vim-ipython'
"tmux does no like C-s
let g:ipy_perform_mappings = 0
autocmd FileType python map<silent>K :py get_doc_buffer()<CR>
autocmd FileType python map<silent><C-i> :python run_this_line()<CR>
autocmd FileType python vmap <silent> <C-i> :python run_these_lines()<CR>


"make green plugin
Bundle 'reinh/vim-makegreen'
map <Leader>nose :call MakeGreen()<CR>

if has('python')
    Bundle 'nvie/vim-pyunit'
    let g:PyUnitCmd = '/usr/local/share/python/nosetests -q --with-machineout'
    if !empty($VIRTUAL_ENV)
        let g:PyUnitCmd = $VIRTUAL_ENV . '/bin/nosetests -q --with-machineout'
    endif
    let g:PyUnitTestsStructure="nose"
    autocmd Filetype python noremap <Leader>nose :call PyUnitRunTests()<CR>
    autocmd Filetype python noremap! <Leader>nose <Esc>:call PyUnitRunTests()<CR>
    autocmd Filetype python noremap <Leader>ut :call PyUnitSwitchToCounterpart()<CR>
    autocmd Filetype python noremap! <Leader>ut <ESC>:call PyUnitSwitchToCounterpart()<CR>
endif

"Ropevim
let ropevim_vim_completion=1

"Pep8 plugin # using flake8
if has('python')
    "Bundle 'orestis/pysmell.git'
    if executable("pep8")
        "Bundle 'nvie/vim-pep8.git'
        "autocmd FileType python map <buffer> <Leader>p :call Pep8()<CR>
    endif
endif

"Pydoc, Pyref plugin
Bundle 'xolox/vim-pyref'
Bundle 'fs111/pydoc.vim'
let g:pydoc_cmd='/usr/local/bin/pydoc'

" }}}

"Latex Plugin ---------------------------------------------------- {{{
Bundle 'mineiro/vim-latex.git'

let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_CompileRule_pdf = 'mkdir -p latex-build; /usr/texbin/pdflatex -output-directory latex-build -interaction nonstopmode $*; cp latex-build/*.pdf .'
let g:Tex_ViewRule_pdf = 'Preview'
let g:Tex_IgnoredWarnings="Font""\n"
let g:Tex_IgnoredWarnings =
                \'Underfull'."\n".
                \'Overfull'."\n".
                \'specifier changed to'."\n".
                \'You have requested'."\n".
                \'Missing number, treated as zero.'."\n".
                \'There were undefined references'."\n".
                \'Latex Warning:'."\n".
                \'LaTeX Warning:' " float stuck
let g:Tex_IgnoreLevel = 8

" }}}


"NerdTree Plugin---------------------------------------------------- {{{
Bundle 'scrooloose/nerdtree'

nmap <silent><Leader>d  :NERDTreeToggle<CR>
nmap <silent><leader>nf :NERDTreeFind<CR>

let g:NERDTreeWinPos = "left"
"down't display the following files
let NERDTreeIgnore=['\.DS_Store$','\.pyc$', '\.xls$','\.zip$','\.pdf$','\.nav$','\.snm$','.\toc$','\.vrb$','\.aux$' , '\.git$', '\.db$', '\.ropeproject', '\.so$', '\.un\~$', '\.lein-plugins$']
let NERDTreeHighlightCursorline=1
" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1
"quit after opening a file
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
"some styling
let NERDTreeDirArrows = 1
"hi Title guifg=red guibg=#202020
if has("autocmd")
    autocmd Filetype nerdtree setlocal nolist
endif

" }}}


"Ultinips Settings------------------------------------------------------- {{{
if has('python')
    Bundle 'SirVer/ultisnips'

    let g:UltiSnipsEditSplit='vertical'
    let g:UltiSnipsUsePythonVersion = 2
    autocmd BufNewFile,BufRead *.snippets set filetype=snippets

    " let g:UltiSnipsListSnippets="<c-tab>"
    "does not seem to work so call it"
    nnoremap <Leader>us :call UltiSnips_ListSnippets()<CR>
    inoremap <Leader>us <ESC>:call UltiSnips_ListSnippets()<CR>

    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<tab>"
    let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

    autocmd Filetype python :UltiSnipsAddFiletypes python
    autocmd Filetype html :UltiSnipsAddFiletypes html
    autocmd Filetype c :UltiSnipsAddFiletypes c
endif

" }}}


"Objective-J Settings--------------------------------------------------------- {{{
Bundle 'nanki/vim-objj'
"vim objj
set runtimepath+=~/.vim/bundle/vim-objj

" }}}


"Ack plugin -----------------------------------------------------------------{{{
if executable("ack")
    Bundle 'mileszs/ack.vim.git'
    nnoremap <Leader>a :Ack --follow <C-r><C-w>
endif

" }}}


"ZoomWin plugin ------------------------------------------------------------{{{
Bundle 'vim-scripts/ZoomWin.git'

nnoremap <Leader>z :ZoomWin<CR>
inoremap <Leader>z <ESC>:ZoomWin<CR>
" Without setting this, ZoomWin restores windows in a way that causes
" equalalways behavior to be triggered the next time CommandT is used.
" This is likely a bludgeon to solve some other issue, but it works
set noequalalways

" }}}


"OpenTerminal plugin -------------------------------------------------------- {{{
Bundle 'vim-scripts/open-terminal-filemanager.git'

nnoremap <silent><Leader>of :OpenFilemanager<CR><CR>

" }}}


"Easymotion plugin ---------------------------------------------------------- {{{
Bundle 'Lokaltog/vim-easymotion.git'

let g:EasyMotion_leader_key = 'e'

" }}}


"Yankring plugin ------------------------------------------------------------- {{{
Bundle 'vim-scripts/YankRing.vim'

nnoremap <silent><Leader>y :YRShow<cr>
inoremap <silent><Leader>y <ESC>:YRShow<cr>
let g:yankring_history_dir = "$HOME/.vim/"
let g:yankring_history_file = 'yankring_history'

" }}}


"Neocomplete plugin ---------------------------------------------------------- {{{
Bundle 'Shougo/neocomplcache.git'

" Disable AutoComplPop.
"let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" AutoComplPop like behavior.
let g:neocomplcache_enable_auto_select = 1

" }}}


"Git plugins ------------------------------------------------------------------ {{{
"fugitive
Bundle 'tpope/vim-fugitive'

nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gco :Gcheckout<CR>
nnoremap <Leader>gci :Gcommit<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gp :Git push<CR>
nnoremap <Leader>gcaa :Git commit -a --amend -C HEAD

"gitv
Bundle 'gregsexton/gitv'

"Gundo plugin
if has('python')
    Bundle 'sjl/gundo.vim.git'

    nnoremap <Leader>gu :GundoToggle<CR>
    "let g:gundo_debug = 1
    let g:gundo_preview_bottom = 1
endif

" }}}


"SQL plugin's --------------------------------------------------{{{
Bundle 'locojay/dbext.vim.git'
"dbext <Leaeder>se
let dbext_default_DB2_bin='db2batch'
"let g:dbext_default_DB2_cmd_options="-q on -s off -l ';'"
"let g:dbext_default_DB2_cmd_options="-q del -s off"
"let dbext_default_DB2_cmd_terminator=""
"let dbext_default_DB2_cmd_terminator="':';"
"output command
"let dbext_default_display_cmd_line=1

"}}}


"Swap parameters plugin-------------------------------------------------{{{
if has('python')
    Bundle 'vim-scripts/swap-parameters.git'

    noremap gb :call SwapParams("forwards")<cr>
    noremap gB :call SwapParams("backwards")<cr>
endif

"}}}


"Ctrl-p plugin-----------------------------------------------------------------{{{
Bundle 'kien/ctrlp.vim.git'

let g:ctrlp_map = '<leader>,'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 1
let g:ctrlp_split_window = 0
let g:ctrlp_max_height = 20
let g:ctrlp_open_new_file = 'v'
let g:ctrlp_prompt_mappings = {
\ 'PrtSelectMove("j")':   ['<c-j>', '<down>', '<s-tab>'],
\ 'PrtSelectMove("k")':   ['<c-k>', '<up>', '<tab>'],
\ 'PrtHistory(-1)':       ['<c-n>'],
\ 'PrtHistory(1)':        ['<c-p>'],
\ 'ToggleFocus()':        ['<c-tab>'],
\ }
let g:ctrlp_extensions = ['tag']
" let g:ctrlp_custom_ignore = {
" \ 'dir' : '\.git/',
" \
" \ }
"let g:ctrlp_dont_split = 'NERD_tree_2'

nnoremap <leader>. :CtrlPTag<cr>
nnoremap <leader>mr :CtrlPMRUFiles<cr>

"}}}


"TAGS Settings ---------------------------------------------------------{{{
if executable('ctags')
    map \pyt :exe '!ctags -R --languages=python -f ./pytags ' . system('python -c "from distutils.sysconfig import get_python_lib; print get_python_lib()"')<CR>
    map <Leader>/ :exe '!ctags -R . ./tags'

    " Easy tags plugin
    Bundle 'xolox/vim-easytags.git'
    let g:easytags_cmd = '/usr/local/bin/ctags'
    set tags=./tags;
    let g:easytags_dynamic_files = 1

    Bundle 'majutsushi/tagbar.git'
    let g:tagbar_ctags_bin='/usr/local/bin/ctags'
    "Tagbar Plugin Settings
    nmap <silent><Leader>k :TagbarToggle<CR>
endif
" }}}


"Visualization ---------------------------------------------------------{{{
"Powerline
Bundle 'Lokaltog/vim-powerline'
let g:Powerline_symbols = "fancy"
if has("autocmd")
  "autocmd bufwritepost .vimrc source $MYVIMRC
  "autocmd bufwritepost .vimrc call Pl#Load()
endif

"IndentationGuide <Leader>ig
Bundle 'nathanaelkane/vim-indent-guides.git'

"ShowMarks
"Bundle "garbas/vim-showmarks"
"
" }}}


" TimeStamp plugin--------------------------------------------------{{{
"autocmd BufWritePre *.py :1,6s/T_IMESTAMP/TIMESTAMP/e
" }}}


" Syntastic plugin ---------------------------------------------------------- {{{
Bundle 'scrooloose/syntastic.git'
"checks syntax for multiple file type install
"   - cpp , c g++, gcc
"   - flake8 or pyflakes or pylint for python
"   - jsonlint for json
"   - java ?? / use eclim
"   - jslint for javascript

let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list=2
let g:syntastic_python_checker = 'flake8'
" let g:syntastic_python_checker = 'flake8 --ignore=E221,E225,E231,E251,E302,E303,W391,E501,E702'

let g:syntastic_stl_format = '[%E{%e Errors}%B{, }%W{%w Warnings}]'

" }}}


"Gitst plugin ------------------------------------------------------ {{{
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim.git'
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1

"}}}


"Comments---------------------------------------------------------------{{{
"Bundle 'scrooloose/nerdcommenter'

Bundle 'tpope/vim-commentary'
xmap <Leader>c  <Plug>Commentary
nmap <Leader>c  <Plug>Commentary
nmap <Leader>cc <Plug>CommentaryLine
au FileType htmldjango setlocal commentstring={#\ %s\ #}
au FileType jinja setlocal commentstring={#\ %s\ #}
au FileType clojurescript setlocal commentstring=;\ %s

" Bundle "tomtom/tcomment_vim"
" nnoremap <silent><leader>c :TComment<CR>
" vnoremap <silent><leader>c :TComment<CR>
"
" let g:tcomment_jinja="{#\ %s \#}""
"}}}


" Tmux -----------------------------------------------------------------{{{
if executable("tmux")
    "Bundle 'vim-scripts/Screen-vim---gnu-screentmux'
    Bundle 'xaviershay/tslime.vim.git'
    Bundle 'acustodioo/vim-tmux'
    Bundle 'benmills/vimux'


    "change pane number at runtime by setting
    function! TmuxPaneNumber()
          let b:tmux_panenumber = input("pane number: ", "", "custom,Tmux_Pane_Numbers")
    endfunction
    command! TmuxPaneNumber call TmuxPaneNumber()

    " Bundle 'sjl/vitality.vim'
    " Save when losing focus
    " " Save when losing focus
    " au FocusLost * :silent! wall

endif

" }}}


"Tpope plugins -------------------------------------------- {{{
Bundle 'tpope/vim-unimpaired.git'
Bundle 'tpope/vim-repeat.git'
Bundle 'tpope/vim-surround.git'
Bundle 'tpope/vim-speeddating.git'

" }}}


"Clojure ---------------------------------------------------------------- {{{
Bundle 'locojay/VimClojure'
"Highlight Clojure's builtins
let g:vimclojure#HighlightBuiltins=1
let g:vimclojure#DynamicHighlighting=1
"Rainbow parentheses'!
let g:vimclojure#ParenRainbow=1
"using slimv
" let vimclojure#WantNailgun = 1
let vimclojure#FuzzyIndent = 1

" syn keyword clojureNoirDef defpage
" hi def link clojureNoirDef Define



" setlocal lispwords+=defpage, defpartial, deftest, defroute

" Bundle 'vim-scripts/slimv.vim'
" Bundle 'gberenfield/sjl-slimv'
let g:slimv_leader = '\'
let g:slimv_keybindings = 2
let g:slimv_swank_clojure = "! tmux new-window -d -n swank 'lein swank'"

let g:lisp_rainbow = 1
let g:slimv_repl_syntax = 1
" }}}


"Web dev -------------------------------------------------------- {{{
Bundle 'mattn/zencoding-vim'
let g:user_zen_leader_key = '<leader>h'
" Bundle 'Glench/Vim-Jinja2-Syntax'
Bundle 'nono/jquery.vim'
"}}}


"Other ----------------------------------------------------- {{{
"Task Management
"Bundle 'jceb/vim-orgmode'
Bundle 'aaronbieber/quicktask'

Bundle 'vim-scripts/SearchComplete.git'
Bundle 'tsaleh/vim-align.git'
Bundle 'vim-scripts/timestamp.vim.git'

Bundle 'IndexedSearch'


"Bundle 'gmunkhbaatarmn/vim-largefile.git'
Bundle 'vim-scripts/LargeFile'
Bundle 'leshill/vim-json'
Bundle 'msanders/cocoa.vim'
Bundle 'vim-scripts/Vim-R-plugin.git'

Bundle 'gmarik/sudo-gui.vim.git'

"vim scripting
Bundle 'vim-scripts/reload.vim.git'

"RST
Bundle "vim-scripts/rest.vim.git"
Bundle "vim-scripts/VST.git"
Bundle "nvie/vim-rst-tables.git"
Bundle 'vim-scripts/DotOutlineTree.git'
"Bundle 'chrisbra/csv.vim'
command! CsvCleanup :%s/\%x0d/\r/

if has('ruby')
    "rst"
    Bundle "matthias-guenther/hammer.vim"
    let g:mdown_preview_cmd="/Users/locojay/.cabal/bin/pandoc -s --highlight-style pygments"
    Bundle "locojay/vim-markdown-preview"
    " autocmd BufWritePost *.rst :Hammer<CR>
endif

"Editing
"Bundle 'vim-scripts/delimitMate.vim'
Bundle 'kana/vim-smartinput'
"help
Bundle 'sjl/strftimedammit.vim'


if has('ruby')
    "add lusty jugler and lusty finder"
    "Todo: only use jugle ( ctrlp replaces   Sat Feb 11 18:29:47 2012
    Bundle 'sjbach/lusty.git'
endif

"Rainbow Parenthesis
Bundle 'kien/rainbow_parentheses.vim'
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16


Bundle 'sjl/clam.vim'

Bundle "derekwyatt/vim-scala"

Bundle "AndrewRadev/linediff.vim"


" }}}



filetype plugin indent on

