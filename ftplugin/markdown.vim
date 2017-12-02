if exists("b:loaded_md_ftplugin")
  finish
endif
let b:loaded_md_ftplugin = 1

function MarkdownFoldExpr()
  let l0 = getline(v:lnum)
  let l1 = getline(v:lnum + 1)

  let h0 = matchstr(l0, '^#\+')
  let h1 = matchstr(l1, '^#\+')

  if empty(l0) && len(h1) > 0
    return -1
  endif

  if empty(h0)
    return "="
  else
    return ">" . len(h0)
  endif
endfunction

function MarkdownFoldText()
  let linetext = getline(v:foldstart)
  let length = v:foldend - v:foldstart + 1
  return linetext . ' (' . length . ' lines)'
endfunction

setlocal foldexpr=MarkdownFoldExpr()
setlocal foldtext=MarkdownFoldText()
setlocal foldmethod=expr
