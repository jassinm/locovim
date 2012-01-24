"-------------------------------------------------------------
"Vundle plugin
"-------------------------------------------------------------
set nocompatible               " be iMproved
set rtp+=~/.vim/vundle/
call vundle#rc()"

Bundle 'tpope/vim-fugitive'
"Bundle 'locojay/vim-powerline'
Bundle 'Lokaltog/vim-powerline'
Bundle 'kien/ctrlp.vim.git'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Shougo/neocomplcache.git'
Bundle 'sjl/gundo.vim.git'
Bundle 'scrooloose/syntastic.git'
"Bundle 'vim-scripts/Screen-vim---gnu-screentmux'
Bundle 'xaviershay/tslime.vim.git'
Bundle 'msanders/snipmate.vim'
Bundle 'tpope/vim-unimpaired.git'
Bundle 'tpope/vim-repeat.git'
Bundle 'tpope/vim-surround.git'
Bundle 'tpope/vim-speeddating.git'
Bundle 'chrismetcalf/vim-yankring.git'
Bundle 'vim-scripts/delimitMate.vim'
"tags
Bundle 'majutsushi/tagbar.git'
Bundle 'xolox/vim-easytags.git'
"Bundle 'vim-scripts/taglist.vim.git'

Bundle "jceb/vim-orgmode"
Bundle "aaronbieber/quicktask"

Bundle 'vim-scripts/SearchComplete.git'
Bundle 'mineiro/vim-latex.git'
Bundle 'hallettj/jslint.vim'
Bundle 'mileszs/ack.vim.git'
Bundle 'vim-scripts/bufkill.vim'
Bundle 'locojay/dbext.vim.git'
Bundle 'msanders/cocoa.vim'
Bundle 'nanki/vim-objj'
Bundle 'vim-scripts/Vim-R-plugin.git'
Bundle 'tsaleh/vim-align.git'
Bundle 'vim-scripts/timestamp.vim.git'
Bundle 'reinh/vim-makegreen'
Bundle 'vim-scripts/ZoomWin.git'
Bundle 'vim-scripts/open-terminal-filemanager.git'
Bundle 'Lokaltog/vim-easymotion.git'
Bundle 'gmarik/sudo-gui.vim.git'
Bundle 'vim-scripts/reload.vim.git'
Bundle 'mattn/gist-vim.git'
"RST
Bundle "vim-scripts/rest.vim.git"
Bundle "vim-scripts/VST.git"
Bundle "nvie/vim-rst-tables.git"
Bundle 'vim-scripts/DotOutlineTree.git'
"Bundle 'chrisbra/csv.vim'
"colors
Bundle 'nathanaelkane/vim-indent-guides.git'
Bundle 'nanotech/jellybeans.vim.git'
"Bundle 'guns/jellyx.vim.git'
"Bundle 'vim-scripts/xoria256.vim.git'
"Bundle 'altercation/vim-colors-solarized.git'

if has('ruby')
    Bundle 'sjbach/lusty.git'
    "Bundle 'Townk/vim-autoclose.git'
    "rst"
    Bundle "robgleeson/hammer.vim"
endif
if has('python')
    Bundle 'jmcantrell/vim-virtualenv.git'
    "Bundle 'orestis/pysmell.git'
    Bundle 'fs111/pydoc.vim'
    Bundle 'nvie/vim-pep8.git'
    Bundle 'jabapyth/vim-debug.git'
    Bundle 'vim-scripts/swap-parameters.git'
    Bundle 'vim-scripts/python_open_module.git'
    "Bundle 'gordyt/rope-vim.git'
endif
"-----------------------------------------------------------------------------
" Set up the window colors and size
"-----------------------------------------------------------------------------
if has('gui_running')
    " GUI colors
    "colorscheme jellybeans
    colorscheme jellybeans_locojay
    "set guifont=Monaco:h12
    set guifont=PragmataPro:h14
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
    colorscheme jellybeans_locojay
    "set guifont=Monaco:h12
    set guifont=PragmataPro:h14
endif
"-------------------------------------------------------------
"Vim Settings
"-------------------------------------------------------------
let mapleader=","

set encoding=utf-8

"shut up
set visualbell           " don't beep
set noerrorbells         " don't beep

"Motion Settings
ino jj <esc>
cno jj <esc>

"show invisible shars
set list
set listchars=tab:▸\ ,eol:¬
set cpoptions+=$
"add line numbers
set number
syntax on
filetype plugin on
filetype indent on

set noswapfile

" Mouse Support
"add mouse support
set mouse=a
"let this work in tmux 2
set ttymouse=xterm2


" Clipboad and Pasting
"add to clipbord
set clipboard+=unnamed
"paste mode
nnoremap <F5> :set invpaste paste?<CR>
set pastetoggle=<F5>
set showmode
"auto paste in paste mode
imap <Leader>v  <C-O>:set paste<CR><C-r>*<C-O>:set nopaste<CR>


" tell VIM to always put a status line in, even if there is only one window
set laststatus=2
"keep a longer history
set history=1000

"Completion
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

" Buffer commands
set hidden "Allows to change buffer w/o saving current buffer

noremap <silent> <Leader>bd :bd<CR>
noremap <silent> <Leader>bn :bn<CR>
noremap <silent> <Leader>bp :bp<CR>

"Tab commands
noremap <silent> <Leader>tp :tabprevious<CR>
noremap <silent> <Leader>tn :tabnext<CR>

" vimrc
nmap <silent> <Leader>ev :e $MYVIMRC<CR>
nmap <silent> <Leader>sv :so $MYVIMRC<CR>

if has("autocmd")
  "autocmd bufwritepost .vimrc source $MYVIMRC
  "autocmd bufwritepost .vimrc call Pl#Load()
endif


" When pressing <leader>cd switch to the directory of the open buffer
map <silent><Leader>cd :cd %:p:h<CR>

set wildignore=*.swp,*.bak,*.pyc,*.class


"Move lines up and down
nnoremap <Alt-j> :m+<CR>==
nnoremap <Alt-k>  :m-2<CR>==
inoremap <Alt-j>  <Esc>:m+<CR>==gi
inoremap <Alt-k>  <Esc>:m-2<CR>==gi
vnoremap <Alt-j>  :m'>+<CR>gv=gv
vnoremap <Alt-k>  :m-2<CR>gv=gv

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

noremap <silent><Leader>cj :wincmd j<CR>:close<CR>
noremap <silent><Leader>ck :wincmd k<CR>:close<CR>
noremap <silent><Leader>ch :wincmd h<CR>:close<CR>
noremap <silent><Leader>cl :wincmd l<CR>:close<CR>

noremap <silent><Leader>vs :vsplit <CR>
noremap <silent><Leader>hs :split <CR>

"Quickfix window Settings
noremap <silent> ,cn :cn<CR>
noremap <silent> ,cp :cp<CR>

"Calculator
inoremap <C-B> <C-O>yiW<End>=<C-R>=<C-R>0<CR>


"Search Settings

nnoremap / /\v
vnoremap / /\v
set smartcase
set incsearch
set gdefault "always /g
set ignorecase
set showmatch
set hlsearch
"replace word under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
map <silent><Leader><space> :noh<CR>


"-------------------------------------------------------------
"Folding
"-------------------------------------------------------------
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
"-------------------------------------------------------------
"Filetype Settings
"-------------------------------------------------------------
" Tabs, spaces, wrapping
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set wrap
set textwidth=85
set formatoptions=qrn1

if has("autocmd")
    "All filetypes
    "remove trailing whitespaces
    autocmd BufWritePre * :%s/\s\+$//e

    "Large files
    autocmd BufReadPost * if getfsize(bufname("%")) > 512*1024 | set syntax=| set filetype=| endif

    "Help
    "help in vertical split
    autocmd FileType help wincmd L

    " R
    autocmd FileType r setlocal ts=8 sts=4 sw=4 expandtab

    "Python
    autocmd FileType python setlocal ts=8 sts=4 sw=4 expandtab
    autocmd FileType python setlocal autoindent
    "nose for unittest
    autocmd FileType python compiler nose
    autocmd FileType python set omnifunc=pythoncomplete#Complete
    autocmd FileType python map <buffer> <Leader>p :call Pep8()<CR>
    autocmd BufNewFile,BufRead *.py set formatprg=PythonTidy

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

endif

"-------------------------------------------------------------
"Python Settings
"-------------------------------------------------------------
function! PythonTidySaver()
    let oldpos=getpos('.')
    %!PythonTidy
    call setpos('.',oldpos)
endfunction

"autocmd! bufwritepost *.py call PythonTidySaver()
"-------------------------------------------------------------
"CTAGS Settings
"-------------------------------------------------------------
map \pyt :exe '!ctags -R --languages=python -f ./pytags ' . system('python -c "from distutils.sysconfig import get_python_lib; print get_python_lib()"')<CR>
map <Leader>/ :exe '!ctags -R ./tags'
"-------------------------------------------------------------
"Latex Plugin Settings
"-------------------------------------------------------------
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_CompileRule_pdf = 'pdflatex -interaction nonstopmode $*'
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
"-------------------------------------------------------------
"NerdTree Plugin Settings
"-------------------------------------------------------------
"down't display the following files
let NERDTreeIgnore=['\.DS_Store$','\.pyc$', '\.xls$','\.zip$','\.pdf$','\.nav$','\.snm$','.\toc$','\.vrb$','\.aux$' , '\.git$', '\.db$', '\.ropeproject']
nmap <silent> <D-d> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "left"
" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
"let NERDTreeMinimalUI = 1
"let NERDTreeDirArrows = 1
hi Title guifg=red guibg=#202020
"-------------------------------------------------------------
"Tagbar Plugin Settings
"-------------------------------------------------------------
nmap <silent><Leader>k :TagbarToggle<CR>
"-------------------------------------------------------------
"Snipmate Settings
"-------------------------------------------------------------
let g:snips_author = 'Jassin MEKNASSI'
let g:snippets_dir = "~/.vim/bundle/snipmate/snippets/,~/.vim/mysnipets/"
"let g:snippets_dir = "~/.vim/mysnipets/,~/.vim/bundle/snipmate/snippets/"
"-------------------------------------------------------------
"Objective-J Settings
"-------------------------------------------------------------
"vim objj
set runtimepath+=~/.vim/bundle/vim-objj
"-------------------------------------------------------------
"make green plugin
"-------------------------------------------------------------
map <Leader>nose :call MakeGreen()<CR>
"-------------------------------------------------------------
"Ack plugin
"-------------------------------------------------------------
nnoremap <Leader>a :Ack --follow <C-r><C-w>
"-------------------------------------------------------------
"CTAGS plugin
"-------------------------------------------------------------
" Set the tags files to be the following
set tags=./tags,tags,pytags
"-------------------------------------------------------------
"ZoomWin plugin
"-------------------------------------------------------------
nmap <Leader>z :ZoomWin<CR>
" Without setting this, ZoomWin restores windows in a way that causes
" equalalways behavior to be triggered the next time CommandT is used.
" This is likely a bludgeon to solve some other issue, but it works
set noequalalways
"-------------------------------------------------------------
"OpenTerminal plugin
"-------------------------------------------------------------
nnoremap <silent><Leader>ot :OpenTerminal<CR>
nnoremap <silent><Leader>of :OpenFilemanager<CR><CR>
nnoremap <silent><Leader>oi :OpenIterm<CR>
"-------------------------------------------------------------
"Easymotion plugin
"-------------------------------------------------------------
"let g:EasyMotion_leader_key = '<Leader>m'
"-------------------------------------------------------------
"Yankring plugin
"-------------------------------------------------------------
nnoremap <silent><Leader>y :YRShow<cr>
inoremap <silent><Leader>y <ESC>:YRShow<cr>
let g:yankring_history_dir = "$HOME/.vim/"
let g:yankring_history_file = 'yankring_history'
"-------------------------------------------------------------
"Neocomplete plugin
"-------------------------------------------------------------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" AutoComplPop like behavior.
let g:neocomplcache_enable_auto_select = 1
"call add(s:snippets_dir,'~/.vim/bundle/snipmate/snippets/')
let g:neocomplcache_snippets_dir='~/.vim/mysnipets'
"let g:neocomplcache_snippets_dir='~/.vim/bundle/sipmate/snippets'
imap <c-j>     <Plug>(neocomplcache_snippets_jump)
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
map <Leader>nce :NeoComplCacheEnable<CR>
map <Leader>ncd :NeoComplCacheDisable<CR>
"-------------------------------------------------------------
"Git Fugitive plugin
"-------------------------------------------------------------
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gco :Gcheckout<CR>
nnoremap <Leader>gci :Gcommit<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gp :Git push<CR>
"-------------------------------------------------------------
"Gundo plugin
"-------------------------------------------------------------
nnoremap <Leader>gu :GundoToggle<CR>
"let g:gundo_debug = 1
let g:gundo_preview_bottom = 1
"-------------------------------------------------------------
"Sweave
"-------------------------------------------------------------
map <Leader>swe :execute '!/usr/local/bin/R CMD Sweave '.expand('%:p')<CR>
"-------------------------------------------------------------
"Ropevim
"-------------------------------------------------------------
let ropevim_vim_completion=1
"-------------------------------------------------------------
"dbext <Leaeder>se
"-------------------------------------------------------------
let dbext_default_DB2_bin='db2batch'
"let g:dbext_default_DB2_cmd_options="-q on -s off -l ';'"
"let g:dbext_default_DB2_cmd_options="-q del -s off"
"let dbext_default_DB2_cmd_terminator=""
"let dbext_default_DB2_cmd_terminator="':';"
"output command
"let dbext_default_display_cmd_line=1
"-------------------------------------------------------------
"Swap parameters plugin
"-------------------------------------------------------------
if has('ptyhon')
    noremap gb :call SwapParams("forwards")<cr>
    noremap gB :call SwapParams("backwards")<cr>
endif
"-------------------------------------------------------------
"Ctrl-p plugin
"-------------------------------------------------------------
let g:ctrlp_map = '<leader>,'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 1
let g:ctrlp_split_window = 0
let g:ctrlp_max_height = 20
let g:ctrlp_prompt_mappings = {
\ 'PrtSelectMove("j")':   ['<c-j>', '<down>', '<s-tab>'],
\ 'PrtSelectMove("k")':   ['<c-k>', '<up>', '<tab>'],
\ 'PrtHistory(-1)':       ['<c-n>'],
\ 'PrtHistory(1)':        ['<c-p>'],
\ 'ToggleFocus()':        ['<c-tab>'],
\ }
let g:ctrlp_extensions = ['tag']

nnoremap <leader>. :CtrlPTag<cr>
nnoremap <leader>mr :CtrlPMRUFiles<cr>
"-------------------------------------------------------------
"Powerline
"-------------------------------------------------------------
let g:Powerline_symbols = "fancy"
"-------------------------------------------------------------
" TimeStamp plugin
"-------------------------------------------------------------
"autocmd BufWritePre *.py :1,6s/T_IMESTAMP/Fri 13 Jan 2012 04:09:38 PM EST/e
"-------------------------------------------------------------
" Easy tags plugin
"-------------------------------------------------------------
let g:easytags_cmd = '/usr/local/bin/ctags'
set tags=./tags;
let g:easytags_dynamic_files = 1
"-------------------------------------------------------------
" Syntastic plugin
"-------------------------------------------------------------
let g:syntastic_enable_signs = 1
let g:syntastic_stl_format = '[%E{%e Errors}%B{, }%W{%w Warnings}]'
