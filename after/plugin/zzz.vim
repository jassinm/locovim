"--------------------------------------
"Remap here because vim-debug ...grr...
"--------------------------------------
noremap <silent> ,cj :wincmd j<CR>:close<CR>
noremap <silent> ,ck :wincmd k<CR>:close<CR>
noremap <silent> ,ch :wincmd h<CR>:close<CR>
noremap <silent> ,cl :wincmd l<CR>:close<CR>


nmap <silent> <Leader>d :NERDTreeToggle<CR>
map <silent><Leader>cd :cd %:p:h<CR>
"quickfix winow
noremap <silent> ,cn :cn<CR>
noremap <silent> ,cp :cp<CR>
"autocmd BufNewFile,BufRead *.pde setfiletype processing
