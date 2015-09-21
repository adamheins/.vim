au BufNewFile,BufRead .bash_* set ft=sh
au BufNewFile,BufRead .bash_* setf sh

au BufNewFile,BufRead .bash_* call SetFileTypeSH("bash")
