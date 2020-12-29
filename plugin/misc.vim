if exists("loaded_misc")
  finish
endif
let loaded_misc = 1

function! SourceVimrc()
  source ~/.vimrc
endfunction

command! Reload call SourceVimrc()
