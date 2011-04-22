
function! s:open_iterm()
  let l:current_dir = getcwd()
  execute("chdir " . escape(expand("%:p:h"), " \"'"))

  if has("mac")
    let l:cmd = "
      \ tell application 'System Events'	    \n
      \   set is_term_running to exists application process '$Terminal' \n
      \ end tell				    \n
      \
      \ set cmd to 'cd $current_path'	       \n
      \ tell application '$Terminal'		\n
      \   activate				  \n
      \   tell application 'System Events' to tell process '$Terminal' to keystroke 't' using command down      \n
      \	  tell current session of current terminal		\n
      \		write text cmd		\n
      \   end tell		\n
      \ end tell				    \n
      \ "
    let l:cmd = substitute(l:cmd,  "'", '\\"', 'g')
    let l:cmd = substitute( l:cmd, "$Terminal", "iTerm", "g" )
    let l:cmd = substitute( l:cmd, "$current_path", "'" . expand("%:p:h") . "'" , "g")
    call system('osascript -e " ' . l:cmd . '"')

  elseif has("gui_gnome") && executable("gnome-terminal")
    call system("gnome-terminal &")
  elseif has("gui_gnome") && executable("konsole")
    call system("konsole &")
  elseif has("gui_win32")
    try
      call system("start cmd")
    catch /E484:/
      echo "Ignore E484 error in Windows platform"
    endtry
  elseif executable("bash")
    !bash
  elseif has("win32")
    stop
  endif

  execute("chdir " . escape(l:current_dir, " \"'"))
endfunction

command! -nargs=0 -bar OpenIterm call s:open_iterm()



      "\   if is_term_running is true then	   \n
      "\     do script with command cmd	      \n
      "\   else				      \n
      "\     do script with command cmd in window 1  \n
      "\   end if				    \n
