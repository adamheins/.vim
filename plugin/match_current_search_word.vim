" Highlight the current search word under the cursor.

if exists('g:loaded_match_current_search_word')
  finish
endif
let g:loaded_match_current_search_word = 1

let g:MatchCurrentSearchWord#match_id = -1

if !exists('g:MatchCurrentSearchWord#match_bg')
  let g:MatchCurrentSearchWord#match_bg = 88
endif

function! MatchCurrentSearchWord()
  " Remove the old match, if it exists.
  if g:MatchCurrentSearchWord#match_id > 0
    silent! call matchdelete(g:MatchCurrentSearchWord#match_id)
    let g:MatchCurrentSearchWord#match_id = -1
  endif

  " Don't do highlighting when highlight search is off.
  if !v:hlsearch
    return
  endif

  let l:match_len = strlen(@/)
  let l:save_cursor = getcurpos()
  let l:cursor_lnum = l:save_cursor[1]
  let l:cursor_col = l:save_cursor[2]

  " Move the cursor to before a possible match to do the search
  let l:cursor_col_before = max([l:cursor_col - l:match_len + 1, 1])
  call cursor(l:cursor_lnum, l:cursor_col_before)

  " Get the position of the match. Flags:
  " c: accept a match at the cursor position
  " n: don't move the cursor
  let [l:match_lnum, l:match_col] = searchpos(@/, 'cn')

  " Restore the cursor
  call setpos('.', l:save_cursor)

  " Only do the match if the cursor is actually over top of the search string.
  if l:match_lnum ==# l:save_cursor[1]
        \ && l:cursor_col >= l:match_col
        \ && l:cursor_col < l:match_col + l:match_len
    " Priority level 11 is chosen to be higher-priority than the default value
    " of 10.
    let g:MatchCurrentSearchWord#match_id = matchaddpos('CurrentSearchWord',
          \ [[l:match_lnum, l:match_col, l:match_len]], 11)
  endif
endfunction

exe 'highlight CurrentSearchWord ctermbg=' . g:MatchCurrentSearchWord#match_bg . ' cterm=NONE'

autocmd CursorMoved * call MatchCurrentSearchWord()
