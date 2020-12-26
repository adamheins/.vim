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
  " Remove the old match, if it exists.
  if g:MatchCurrentSearchWord#match_id > 0
    call matchdelete(g:MatchCurrentSearchWord#match_id)
    let g:MatchCurrentSearchWord#match_id = -1
  endif

  " Don't do highlighting when highlight search is off.
  if !v:hlsearch
    return
  endif

  " \%#  : cursor position
  " \@<= : positive look-behind
  " \c   : case-insensitive search
  let l:pattern = join(['\%#\@<=', @/, '\c'], '')

  " Priority level 11 is chosen to be higher-priority than the default value
  " of 10.
  call matchadd('CurrentSearchWord', l:pattern, 11, g:MatchCurrentSearchWord#match_id)

endfunction

exe 'highlight CurrentSearchWord ctermbg=' . g:MatchCurrentSearchWord#match_bg . ' cterm=NONE'

autocmd CursorMoved * call MatchCurrentSearchWord()
