" Aliases
" Supported via the cmdalias plugin.
" Alias commands must run after other plugins (so plugin commands are
" defined), so this file is symlinked from the after/plugin directory.

" Shorten the command to strip trailing whitespace.
Alias sws StripWhitespace

" Reload .vimrc without closing vim.
Alias reload Reload

" GitGutter
Alias gu GitGutterUndoHunk
Alias gt GitGutterToggle

" Fugitive (more git)
Alias gb Gblame
Alias gd Gdiff

" Neomake
Alias nm Neomake
Alias nt NeomakeToggle

" FSwitch
call CmdAlias('fs', 'FS')

" Spell check
call CmdAlias('spc', 'call SpcToggle()')

" JSON formatting.
"call CmdAlias('json', '%!python -m json.tool')
