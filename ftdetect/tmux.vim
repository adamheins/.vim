au BufNewFile,BufRead .tmux.conf*,tmux.conf* set filetype=tmux " Overrule existing filetype.
au BufNewFile,BufRead .tmux.conf*,tmux.conf* setfiletype tmux  " If no filetype exists yet.
