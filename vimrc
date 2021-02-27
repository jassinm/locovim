" The plugins for the coc.nvim
let g:coc_global_extensions = [
\ 'coc-tabnine',
\ 'coc-pyright'
\ ]

call plug#begin(has('nvim') ? '~/.config/nvim/plugged' : '~/.vim/plugged')

let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog  = '/usr/local/bin/python3'
Plug 'lifepillar/vim-gruvbox8'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'bling/vim-airline'
Plug 'mhinz/vim-startify'
Plug 'pineapplegiant/spaceduck'
"Plug 'sjl/badwolf'

" Nerd Tree------------------------------------------------------------------------------
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" File Management------------------------------------------------------------------------
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kien/ctrlp.vim'
"Plug 'mileszs/ack.vim'
Plug 'airblade/vim-rooter'
"
"Time Machine
Plug 'sjl/gundo.vim'
Plug 'vim-scripts/YankRing.vim'
"
Plug 'Lokaltog/vim-easymotion'
Plug 'SirVer/ultisnips'
"Plug 'vim-scripts/ZoomWin'
"Plug 'vim-scripts/open-terminal-filemanager'
"Plug 'vim-scripts/swap-parameters'
"Plug 'xolox/vim-easytags'
"Plug 'majutsushi/tagbar'
"Plug 'scrooloose/syntastic'
"Plug 'mattn/gist-vim'
"Plug 'gmarik/sudo-gui.vim'
Plug 'gcmt/wildfire.vim'
"

Plug 'sheerun/vim-polyglot'
"Tpopeplugins---------------------------------------------------------------------------
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-speeddating'
"
"Git
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'        " shows git changes in gutter

" Display
Plug 'Yggdroot/indentLine'


"Pythonj--------------------------------------------------------------------------------
"Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins', 'for': 'python'}
Plug 'Vimjas/vim-python-pep8-indent', {'for': 'python'}
Plug 'vim-python/python-syntax'
Plug 'jmcantrell/vim-virtualenv', {'for': 'python'}
Plug 'fisadev/vim-isort', {'for': 'python'} " Python sort imports [dep]: pip3 install isort
Plug 'tmhedberg/SimpylFold', {'for': 'python'}
Plug 'alfredodeza/pytest.vim'
"Plug 'ivanov/vim-ipython', {'for': 'python'}
"Plug 'xolox/vim-pyref', {'for': 'python'}
"Plug 'davidhalter/jedi-vim', {'for': 'python'} /# moved to  coc.vim and  coc-python

" LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'liuchengxu/vista.vim'
Plug 'dense-analysis/ale' " linter

"Web dev---------------------------------------------------------------------------------
Plug 'mattn/emmet-vim', {'for': 'html'}

"C/C++-----------------------------------------------------------------------------------
"Plug 'vim-scripts/scons.vim'
Plug 'vim-scripts/a.vim', {'for': 'cpp'}

"Scala----------------------------------------------------------------------------------
Plug 'derekwyatt/vim-scala', {'for': 'scala'}
"
"Erlang----------------------------------------------------------------------------------
Plug 'jimenezrick/vimerl', {'for': 'erlang'}
Plug 'edkolev/erlang-motions.vim', {'for': 'erlang'}


"Plug 'karoliskoncevicius/vim-sendtowindow'
"Tmux
Plug 'jpalardy/vim-slime'

"Other-----------------------------------------------------------------------------------
Plug 'vim-scripts/SearchComplete'
Plug 'tsaleh/vim-align'
"Plug 'IndexedSearch'
"Editing
Plug 'kana/vim-smartinput'
"help
"Plug 'sjbach/lusty'
Plug 'kien/rainbow_parentheses.vim', {'for': 'erlang'}
"Nice markers
"Plug 'AndrewRadev/linediff.vim'
Plug 'goldfeld/vim-seek'
Plug 'vim-scripts/LargeFile'
"vim scripting
"Plug 'vim-scripts/reload.vim'
Plug 'rizzatti/dash.vim'

Plug 'psliwka/vim-smoothie'

"Icon / must be last one
Plug 'ryanoasis/vim-devicons'
call plug#end()

"---------------------------------------------------------------------------------------
"Look good
"---------------------------------------------------------------------------------------

"Alt key
if has("gui_mac")
    set macmeta
endif

"
"Set up the window colors and size
if has('gui_running')
    " GUI colors
    set background=dark
    "set guifont=Monaco:h12
    if has("gui_gtk2")
        set guifont=PragmataPro:h15
        "set guifont=PragmataPro\ Nerd\ Font:h15
    else
        set guifont=PragmataPro:h15
        "set guifont=PragmataPro\ Nerd\ Font:h15
    endif
    set guioptions=egmrt
    set guioptions-=T
    winpos 0 0
    winsize 270 70
    set go-=L
    set go-=r
elseif exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
    " Non-GUI (terminal) colors

    set guifont=PragmataPro:h15
    "set guifont=PragmataPro\ Nerd\ Font:h15
endif


set background=dark
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

highlight Comment cterm=italic gui=italic

"GruvboxAqua
"set background=dark
"colorscheme gruvbox8_hard
"

"---------------------------------------------------------------------------------------
"Vim Settings
"---------------------------------------------------------------------------------------

let mapleader=","
"let mapleader="\<Space>"
let maplocalleader = "\\"

"save a keypress
map ; :

set encoding=utf-8
"https://github.com/morhetz/gruvbox/issues/81
set t_ut=

set fillchars+=vert:│

filetype plugin indent on

" Set backspace config
set backspace=eol,start,indent
set showbreak=↪

"shut up
set visualbell           " don't beep
set noerrorbells         " don't beep

"Motion Settings
"Life saver
ino jk <esc>
cno jk <esc>

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

"fast
set ttyfast

"undo statck
set undofile
"enable backups
set backup
set undodir=$HOME/.vim/tmp/undo/
set backupdir=$HOME/.vim/tmp/backup/
set directory=$HOME/.vim/tmp/swap/

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif

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

"---------------------------------------------------------------------------------------
"Completion/Wildmenu
"---------------------------------------------------------------------------------------

set wildmode=longest:full
set wildmenu
set completeopt=menu,preview
"autoclose preview window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"omnifocus as constrol space
" inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
"             \ "\<lt>C-n>" :
"             \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
"             \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
"             \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
" imap <C-@> <C-Space>

set wildignore=*.swp,*.bak
set wildignore+=*/.svn/*,/*.hg/*,/*.git/* " Version control (not git as otherwise conflict with fugitive)
set wildignore+=*/.virtualenvs/*
set wildignore+=*.aux,*.out,*.toc " LaTeX stuff
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg "Pics
set wildignore+=*.o,*.obj,*.pyc,*.class "compiled files, bytecode
set wildignore+=*.DS_Store
set wildignore+=*.pdf,*.xls,*.xlsx,*.doc
set wildignore+=*.jar
set wildignore+=*.beam
" Lein
set wildignore+=classes
set wildignore+=lib


"---------------------------------------------------------------------------------------
" Buffer/Tab/Window nativgation
"---------------------------------------------------------------------------------------

set hidden "Allows to change buffer w/o saving current buffer

" Some lp servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" LSP Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

noremap <silent><Leader>bn :bn<CR>
noremap <silent><Leader>bp :bp<CR>
noremap <silent><Leader>bd :bd<CR>
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
noremap <silent><Leader>wq :wincmd q<cr>


noremap <silent><Leader>ws :split <CR>
noremap <silent><Leader>wv :vsplit <CR>

"location list
noremap <silent> <leader>lo :lopen<CR>

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


"---------------------------------------------------------------------------------------
" Default Tabs, spaces, wrapping
"---------------------------------------------------------------------------------------

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set wrap
set textwidth=85
set formatoptions=qrn1


"---------------------------------------------------------------------------------------
"Search Settings
"---------------------------------------------------------------------------------------

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

"---------------------------------------------------------------------------------------
"Filetype Settings
"---------------------------------------------------------------------------------------

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

"Yml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

"
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
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4 expandtabjj
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

"Scons
autocmd BufNewFile,BufRead SConstruct set filetype=scons

highlight! link Function GruvboxAqua
highlight! link PythonFunction GruvboxBlue

"highlight! link Function GruvboxAqua
highlight! link pythonImport GruvboxRed
hi! link pythonDottedName GruvboxBlue
hi! link Structure GruvboxYellow
hi! link pythonDecorator GruvboxGray
"
"---------------------------------------------------------------------------------------
"C/C++
"---------------------------------------------------------------------------------------
" Plug 'Rip-Rip/clang_complete'
" autocmd FileType c let g:clang_user_options = "-std=c99 2>/dev/null || exit 0"
" autocmd FileType cpp let g:clang_user_options = "-std=c++11 2>/dev/null || exit 0"
" let g:clang_use_library=1
" let g:clang_library='/usr/lib'
" let g:clang_snippets=1
" let g:clang_snippets_engine='ultisnips'
" Plug 'osyo-manga/neocomplcache-clang_complete'
if has("autcmd")
    autocmd BufNewFile,BufRead *.cpp set syntax=cpp11
    autocmd BufNewFile,BufRead *.hpp set syntax=cpp11
endif
"
"
"---------------------------------------------------------------------------------------
"Python
"---------------------------------------------------------------------------------------

autocmd FileType python setlocal ts=8 sts=4 sw=4 expandtab
autocmd FileType python setlocal autoindent
au FileType python setlocal commentstring=#\ %s

autocmd FileType python compiler nose
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd BufNewFile,BufRead *.pyx setlocal foldmethod=indent
"Coc-python
autocmd FileType python nmap <silent> gd <Plug>(coc-definition)
autocmd FileType python nmap <leader>rn <Plug>(coc-rename)
autocmd FileType python noremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

let g:vim_isort_map = '<C-i>'

set makeprg=scons

" Pytest
nmap <silent><Leader>tf <Esc>:Pytest file<CR>
nmap <silent><Leader>tc <Esc>:Pytest class<CR>
nmap <silent><Leader>tm <Esc>:Pytest method<CR>


"---------------------------------------------------------------------------------------
"Erlang
"---------------------------------------------------------------------------------------

autocmd FileType erlang setlocal ts=8 sts=4 sw=4 expandtab
let erlang_force_use_vimerl_indent = 0
let erlang_skel_header = { "author": "Locojay", "owner" : "Locojay" }
let erlang_folding=1

"use syntastic
let erlang_show_errors = 0


"---------------------------------------------------------------------------------------
"Coc.nvim
"---------------------------------------------------------------------------------------

" Use <c-space> to trigger completion.
"inoremap <silent><expr> <c-space> coc#refresh()

inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"


"Goto
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


"---------------------------------------------------------------------------------------
"Linter Settings
"---------------------------------------------------------------------------------------

" Check Python files with flake8
let g:ale_linters = {'python': ['flake8']}
" Fix Python files with autopep8 and yapf.
let g:ale_fixers = {'python': ['black', 'autopep8', 'isort']} "['autopep8', 'yapf']
" Disable warnings about trailing whitespace for Python files.
let g:ale_warn_about_trailing_whitespace = 0
"let g:ale_fix_on_save = 1
nnoremap <Leader>fx :ALEFix<CR>
"
"---------------------------------------------------------------------------------------
"Code Folding
"---------------------------------------------------------------------------------------

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

"---------------------------------------------------------------------------------------
"Comments
"---------------------------------------------------------------------------------------
xmap <Leader>c  <Plug>Commentary
nmap <Leader>c  <Plug>Commentary
nmap <Leader>cl <Plug>CommentaryLine
au FileType htmldjango setlocal commentstring={#\ %s\ #}
au FileType jinja setlocal commentstring={#\ %s\ #}
au FileType clojurescript setlocal commentstring=;\ %s
au FileType scons setlocal commentstring=#\ %s


"---------------------------------------------------------------------------------------
" Tmux
"---------------------------------------------------------------------------------------
let g:slime_python_ipython = 1
if executable("tmux")
    let g:slime_target = "tmux"
    let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": "1"}
endif

"---------------------------------------------------------------------------------------
"Git
"---------------------------------------------------------------------------------------

"fugitive
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gco :Gcheckout<CR>
nnoremap <Leader>gci :Gcommit<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gp :Git push<CR>
nnoremap <Leader>gcaa :Git commit -a --amend -C HEAD


"Gundo plugin
if has('python')
    nnoremap <Leader>gu :GundoToggle<CR>
    "let g:gundo_debug = 1
    let g:gundo_preview_bottom = 1
endif


"---------------------------------------------------------------------------------------
"Swap parameters
"---------------------------------------------------------------------------------------

if has('python')
    noremap gb :call SwapParams("forwards")<cr>
    noremap gB :call SwapParams("backwards")<cr>
endif


"---------------------------------------------------------------------------------------
"Find Stuff Fast
"---------------------------------------------------------------------------------------

set grepprg=rg\ --vimgrep\ --smart-case\ --hidden\ --follow
let g:rg_derive_root = 1

nnoremap <Leader>fw :Rg <C-R><C-W><space>
"Fzf
"
let $FZF_DEFAULT_COMMAND = 'rg --files --follow --hidden --glob "!.git/*"'
nnoremap <leader>ff :Files<cr>
nnoremap <leader>bb :Buffers<cr>
nnoremap <leader>ss :Lines<cr>
nnoremap <leader>sb :Lines<cr>
nnoremap <leader>sp :Rg<cr>


"
"
"---------------------------------------------------------------------------------------
"Vim rooter
"---------------------------------------------------------------------------------------
let g:rooter_patterns = ['.git', 'Makefile', 'src']

"---------------------------------------------------------------------------------------
"Ctrl-p plugin
"---------------------------------------------------------------------------------------

"let g:ctrlp_map = '<leader>ff'
"let g:ctrlp_jump_to_buffer = 0
"let g:ctrlp_working_path_mode = 0
"let g:ctrlp_match_window_reversed = 1
"let g:ctrlp_split_window = 0
"let g:ctrlp_max_height = 20
"let g:ctrlp_open_new_file = 'v'
"let g:ctrlp_extensions = ['tag']
"let g:ctrlp_prompt_mappings = {
"\ 'PrtSelectMove("j")':   ['<c-j>', '<down>', '<s-tab>'],
"\ 'PrtSelectMove("k")':   ['<c-k>', '<up>', '<tab>'],
"\ 'PrtHistory(-1)':       ['<c-n>'],
"\ 'PrtHistory(1)':        ['<c-p>'],
"\ 'ToggleFocus()':        ['<c-tab>'],
"\ }
"let g:ctrlp_extensions = ['tag']
"" let g:ctrlp_custom_ignore = {
"" \ 'dir' : '\.git/',
"" \
"" \ }
""let g:ctrlp_dont_split = 'NERD_tree_2'
"
"nnoremap <leader>bb :CtrlPBuffer<cr>
"
"nnoremap <leader>. :CtrlPTag<cr>
"nnoremap <leader>mr :CtrlPMRUFiles<cr>
"
"let g:webdevicons_conceal_nerdtree_brackets = 0

"---------------------------------------------------------------------------------------
" NerdTree
"---------------------------------------------------------------------------------------

"let NERDTreeMinimalUI=1 " remove the first line help info
"let g:WebDevIconsOS = 'Darwin'
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
map <Leader>ft :NERDTreeToggle<CR>
"map <Leader>ft :NERDTreeFind<CR>
let NERDTreeIgnore = ['\.pyc$', '\.egg-info$', '__pycache__', '__pycache__', '.git$']
let NERDTreeShowHidden=1

"---------------------------------------------------------------------------------------
"TAGS Settings
"---------------------------------------------------------------------------------------

if executable('ctags')
    map \pyt :exe '!ctags -R --languages=python -f ./pytags ' . system('python -c "from distutils.sysconfig import get_python_lib; print get_python_lib()"')<CR>
    map <Leader>/ :exe '!ctags -R . ./tags'

    " Easy tags plugin
    let g:easytags_cmd = '/usr/local/bin/ctags'
    set tags=./tags;
    let g:easytags_dynamic_files = 1
    let g:easytags_async = 1

    let g:tagbar_ctags_bin='/usr/local/bin/ctags'
    "Tagbar Plugin Settings
    nmap <silent><Leader>k :TagbarToggle<CR>
endif
"

"---------------------------------------------------------------------------------------
"Visualization
"---------------------------------------------------------------------------------------

"Powerline
" Plug 'Lokaltog/vim-powerline'
" let g:Powerline_symbols = "fancy"
let g:airline_powerline_fonts = 1


"IndentationGuide <Leader>ig
let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#998f84 ctermbg=245
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#d9cec3 ctermbg=252


" TimeStamp plugin--------------------------------------------------
"autocmd BufWritePre *.py :1,6s/T_IMESTAMP/TIMESTAMP/e
"

let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list=2
let g:syntastic_python_checkers = ['flake8']

"use YoucompleteMe
" let g:syntastic_cpp_config_file='.clang_complete'
let g:syntastic_stl_format = '[%E{%e Errors}%B{, }%W{%w Warnings}]'
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++ -Wall'
"erlang
let g:syntastic_erlang_checkers=['syntaxerl']
let g:syntastic_javascript_checkers = ['jshint']



"---------------------------------------------------------------------------------------
"Gitst plugin
"---------------------------------------------------------------------------------------
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
"---------------------------------------------------------------------------------------
"Other
"---------------------------------------------------------------------------------------
"Task Management
command! CsvCleanup :%s/\%x0d/\r/

"Rainbow Parenthesis
"let g:rbpt_max = 16
" autocmd FileType clojure RainbowParenthesesToggle
" au VimEnter * RainbowParenthesesToggle
