" Aliases
" Supported via the cmdalias plugin.
" Alias commands must run after other plugins (so plugin commands are
" defined), so this file is symlinked from the after/plugin directory.

" Shorten the command to strip trailing whitespace.
Alias sws StripWhitespace

Alias col Col

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

" Cscope
call CmdAlias('csc', 'cs find c')
call CmdAlias('cse', 'cs find e')
call CmdAlias('csd', 'cs find d')
call CmdAlias('csf', 'cs find f')
call CmdAlias('csg', 'cs find g')
call CmdAlias('csi', 'cs find i')
call CmdAlias('css', 'cs find s')
call CmdAlias('cst', 'cs find t')

" FSwitch
call CmdAlias('fs', 'FS')

" Spell check
call CmdAlias('spc', 'setlocal spell! spelllang=en')
