if exists("loaded_spc")
  finish
endif
let loaded_spc = 1

" 1 if spell checking is currently on. False otherwise.
let g:spc_on = 0

function! SpcToggle()
  if g:spc_on
    let g:spc_on = 0
    " Revert n and N to their default behaviour.
    unmap n
    unmap N
  else
    let g:spc_on = 1
    " When turning on spell check, remap n and N to search through the
    " misspelled words.
    nmap n ]s
    nmap N [s
  endif
  set spell! spelllang=en_ca
endfunction

function! SpcOff()
  if g:spc_on
    let g:spc_on = 0
    unmap n
    unmap N
  endif
  set nospell
endfunction
