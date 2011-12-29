"--------------------------------------
"Remap here because vim-debug ...grr...
"--------------------------------------
noremap <silent> ,cj :wincmd j<CR>:close<CR>
noremap <silent> ,ck :wincmd k<CR>:close<CR>
noremap <silent> ,ch :wincmd h<CR>:close<CR>
noremap <silent> ,cl :wincmd l<CR>:close<CR>
""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader>t :CommandT<CR>
""""""""""""""""""""""""""""""""""""""""""""
noremap <silent> ,w :w<CR>


nmap <silent> <Leader>d :NERDTreeToggle<CR>
nmap <silent> <Leader>k :TlistToggle<CR>
map <silent><Leader>cd :cd %:p:h<CR>
"quickfix winow
noremap <silent> ,cn :cn<CR>
noremap <silent> ,cp :cp<CR>
set statusline=%<\ %n:%f\ %m%r%y%w%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
if has('python')
    set statusline=%<\ %n:%f\ %m%r%y%w%=%{fugitive#statusline()}%{VirtualEnvStatusline()}%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
endif
autocmd BufNewFile,BufRead *.pde setfiletype processing
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gco :Gcheckout<CR>
nnoremap <Leader>gci :Gcommit<CR>
