if exists("loaded_spc")
  finish
endif
let loaded_spc = 1
let g:spc_on = 0

function! SpcToggle()
  if g:spc_on
    let g:spc_on = 0
    unmap n
    unmap N
  else
    let g:spc_on = 1
    nmap n ]s
    nmap N [s
  endif
  set spell! spelllang=en_ca
endfunction

function! SpcOff()
  unmap n
  unmap N
  set nospell
endfunction
