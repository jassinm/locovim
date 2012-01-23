if !has('python')
    finish
endif
function! LoadRope()
python << EOF
import ropevim
EOF
endfunction

call LoadRope()
