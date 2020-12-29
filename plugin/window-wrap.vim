"
" Wrap window-move-cursor
" Core functionality courtesy of this StackOverflow answer:
" http://stackoverflow.com/a/13855458
"
if exists("loaded_window_wrap")
  finish
endif
let loaded_window_wrap = 1

function! s:GotoNextWindow( direction, count )
  let l:prevWinNr = winnr()
  execute a:count . 'wincmd' a:direction
  return winnr() != l:prevWinNr
endfunction

function! s:JumpWithWrap( direction, opposite )
  if ! s:GotoNextWindow(a:direction, v:count1)
    call s:GotoNextWindow(a:opposite, 999)
  endif
endfunction

nnoremap <silent> <C-h> :<C-u>call <SID>JumpWithWrap('h', 'l')<CR>
nnoremap <silent> <C-j> :<C-u>call <SID>JumpWithWrap('j', 'k')<CR>
nnoremap <silent> <C-k> :<C-u>call <SID>JumpWithWrap('k', 'j')<CR>
nnoremap <silent> <C-l> :<C-u>call <SID>JumpWithWrap('l', 'h')<CR>
