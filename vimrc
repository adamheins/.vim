" Run time configuration for vim.
" Adam Heins

" ================================ General =================================== "

" Turn off compatibility with vi.
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Allow reuse of same window and switching from unsaved buffer without saving.
set hidden

" Show partial commands in the last line of the screen
set showcmd

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
set nomodeline

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" Stop certain movements from always going to the first character of a line.
set nostartofline

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialog asking if you wish to save changed files.
set confirm

" Don't flash or beep.
set visualbell
set t_vb=

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Hide the mode status messages, since mode is shown in status line.
set noshowmode

" The vim C syntax highlighter has a grudge against compound struct literals.
" Make it stop.
let c_no_curly_error=1

" Get rid of the preview scratch window.
set completeopt-=preview

" Reduce updatetime to something more reasonable. Makes gitgutter more usable.
set updatetime=750

" ================================ Plugins =================================== "

" Pathogen plugin manager.
execute pathogen#infect()

" Neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "<TAB>"

" NERDTree
let NERDTreeQuitOnOpen = 1
let NERDTreeMapUpdir = '..'

" Gitgutter.
let g:gitgutter_realtime = 1
call gitgutter#disable()

" Syntastic
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" ================================= Search =================================== "

set nohlsearch
set ignorecase
set smartcase
set incsearch

" ============================== Indentation ================================= "

set autoindent
set smarttab
set shiftwidth=2
set tabstop=2
set expandtab

" ================================ Colours =================================== "

syntax on
colorscheme lucid

set cursorline

let &colorcolumn=101

" ============================ Persistent Undo =============================== "

if has('persistent_undo') && !isdirectory(expand('~').'/.vim/undo')
  silent !mkdir ~/.vim/undo > /dev/null 2>&1
endif
set undodir=~/.vim/undo
set undofile

" ================================ Commands ================================== "

" Sometimes I still have shift pressed when I type these.
command! Q q
command! W w

" ================================ Mappings ================================== "

" Map Y to yank until EOL
map Y y$

" Map h,k to include wrapped lines.
noremap j gj
noremap k gk

" Disable arrow keys.
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Insert blank lines without entering insert mode.
nnoremap gj o<Esc>
nnoremap gk O<Esc>

" Avoid accidentally triggering J/K behaviour when navigating.
nnoremap gJ J
nnoremap gK K

" Move up/down regardless of case.
nnoremap J j
nnoremap K k

" Make switching between splits easier.
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" More useful window mappings.
nnoremap ,<C-J> :split<CR><C-W><C-J>
nnoremap ,<C-K> :split<CR>
nnoremap ,<C-H> :vsplit<CR>
nnoremap ,<C-L> :vsplit<CR><C-W><C-L>
nnoremap ,, :bNext<CR>
nnoremap ,m :enew<CR>

" CtrlP buffer search.
noremap ,b :CtrlPBuffer<CR>

" Toggle NERDTree.
noremap ,n :NERDTreeFind<CR>

" Make interaction with the system clipboard easier.
noremap "" "+p
vnoremap "' "+y

" Paste from the yank register more quickly.
noremap "p "0p
