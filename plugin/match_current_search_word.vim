" Highlight the current search word under the cursor.
" Problems:
" * Currently ignores case via \c, which doesn't match one-to-one with smart
"   search settings.
" * Only matches when the cursor is at the start of the word.

if exists('loaded_match_current_search_word')
  finish
endif
let loaded_match_current_search_word = 1

let g:MatchCurrentSearchWord#match_id = -1

if !exists('g:MatchCurrentSearchWord#match_bg')
  let g:MatchCurrentSearchWord#match_bg = 88
endif

function! MatchCurrentSearchWord()
  " Compare value under the cursor (<cword>) and the value in the search
  " register @/
  if v:hlsearch && expand('<cword>') =~ @/
    let l:pattern = join(['\%#\@<=', @/, '\c'], '')
    call matchadd('CurrentSearchWord', l:pattern, 1, g:MatchCurrentSearchWord#match_id)
  else
    if g:MatchCurrentSearchWord#match_id > 0
      call matchdelete(g:MatchCurrentSearchWord#match_id)
      let g:MatchCurrentSearchWord#match_id = -1
    endif
  endif
endfunction

exe 'highlight CurrentSearchWord ctermbg=' . g:MatchCurrentSearchWord#match_bg . ' cterm=NONE'

autocmd CursorMoved * call MatchCurrentSearchWord()
