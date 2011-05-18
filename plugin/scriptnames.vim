function! s:Filter_lines(cmd, filter)
  redir => lines
  let saveMore = &more
  set nomore
  execute a:cmd
  redir END
  let &more = saveMore
  call feedkeys("\<CR>")
  wincmd n
  set buftype=nofile noswapfile
  execute 'normal! i' . lines . "\<CR>"
  execute 'vglobal/' . a:filter . '/delete'
  %substitute#^[[:space:]]*[[:digit:]]\+:[[:space:]]*##eg
  0
endfunction
command! -nargs=1 Scriptnames call <sid>Filter_lines('scriptnames', <q-args>)
