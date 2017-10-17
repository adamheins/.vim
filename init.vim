" Run time configuration for neovim.
" Adam Heins

" ================================ General =================================== "

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Allow reuse of same window and switching from unsaved buffer without saving.
set hidden

" Show partial commands in the last line of the screen
set showcmd

" Visual autocomplete for commands.
set wildmenu

" Only redraw when needed.
set lazyredraw

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

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=0

" Hide the mode status messages, since mode is shown in status line.
set noshowmode

" The vim C syntax highlighter has a grudge against compound struct literals.
" Make it stop.
let c_no_curly_error=1

" Get rid of the preview scratch window.
set completeopt-=preview

" Reduce updatetime to something more reasonable. Makes gitgutter more usable.
set updatetime=250

" Use cscope rather than ctags.
set cst

" Don't insert a double space when wrapping sentences.
set nojoinspaces

" Use xdg-open to open files/URLs under the cursor when pressing 'gx'.
let g:netrw_browsex_viewer="xdg-open"

" ================================ Plugins =================================== "

" Plug plugin manager.
call plug#begin('~/.vim/plugged')

Plug 'https://github.com/tpope/vim-abolish'
Plug 'https://github.com/adamheins/vim-adam-util'
Plug 'https://github.com/ntpeters/vim-better-whitespace'
Plug 'https://github.com/vim-scripts/cmdalias.vim'
Plug 'https://github.com/adamheins/vim-col'
Plug 'https://github.com/ctrlpvim/ctrlp.vim'
Plug 'https://github.com/Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'https://github.com/easymotion/vim-easymotion'
Plug 'https://github.com/Konfekt/FastFold'
Plug 'https://github.com/derekwyatt/vim-fswitch'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/airblade/vim-gitgutter'
Plug 'https://github.com/adamheins/vim-indexed-search'
Plug 'https://github.com/Shougo/neoinclude.vim'
Plug 'https://github.com/neomake/neomake'
Plug 'https://github.com/scrooloose/nerdtree'
Plug 'https://github.com/jeffkreeftmeijer/vim-numbertoggle'
Plug 'https://github.com/tpope/vim-repeat'
Plug 'https://github.com/adamheins/vim-simple-status'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/tomtom/tcomment_vim'
Plug 'https://github.com/simnalamburt/vim-mundo'

"" Language/domain-specific plugins.
Plug 'https://github.com/othree/html5.vim'
Plug 'https://github.com/daeyun/vim-matlab'
Plug 'https://github.com/digitaltoad/vim-pug'
Plug 'https://github.com/rust-lang/rust.vim'
Plug 'https://github.com/mrk21/yaml-vim'
Plug 'https://github.com/ElmCast/elm-vim'
Plug 'https://github.com/evanmiller/nginx-vim-syntax'

call plug#end()

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "<TAB>"

" NERDTree
let NERDTreeQuitOnOpen = 1
let NERDTreeMapUpdir = '..'

" Gitgutter
let g:gitgutter_realtime = 1
call gitgutter#disable()

" Neomake
let g:neomake_verbose = 0
let g:neomake_place_signs = 0
autocmd! BufWritePost * Neomake

let g:neomake_error_sign = {
  \ 'text': 'E',
  \ 'texthl': 'NeomakeErrorSign',
  \ }
let g:neomake_warning_sign = {
  \ 'text': 'W',
  \ 'texthl': 'NeomakeWarningSign',
  \ }
let g:neomake_message_sign = {
  \ 'text': 'M',
  \ 'texthl': 'NeomakeMessageSign',
  \ }
let g:neomake_info_sign = {
  \ 'text': 'I',
  \ 'texthl': 'NeomakeInfoSign',
  \ }
augroup neomake_signs
  au!
  au ColorScheme * hi NeomakeErrorSign   ctermfg=red
  au ColorScheme * hi NeomakeWarningSign ctermfg=yellow
  au ColorScheme * hi NeomakeMessageSign ctermfg=white
  au ColorScheme * hi NeomakeInfoSign    ctermfg=blue
augroup END

" Toggle the neomake messages appearing in the gutter.
function NeomakeToggle()
  if g:neomake_place_signs == 1
    let g:neomake_place_signs = 0
  else
    let g:neomake_place_signs = 1
  endif
  Neomake
endfunction

command! NeomakeToggle call NeomakeToggle()

" Easymotion
let g:EasyMotion_do_mapping = 0

" Ctrl-p
let g:ctrlp_root_markers = ['cscope.files']
let g:ctrlp_user_command = ['cscope.files', 'cat %s/cscope.files']
let g:ctrlp_extensions = ['tag']
let g:ctrlp_regexp = 1

" FSwitch
" Define search paths to switch between header and source files.
augroup cppfiles
  au!
  " Switch from header files to source files.
  " Cases handled:
  "   file.h            -> file.cpp
  "   include/**/file.h -> file.cpp
  "   include/**/file.h -> src/**/file.cpp
  au BufEnter *.h let b:fswitchdst = 'cpp,c'
  au BufEnter *.h let b:fswitchlocs = 'reg:/include.*//,reg:/include.*/src\*\*/'

  " Switch from source files to header files.
  " Cases handled:
  "   file.cpp        -> file.h
  "   file.cpp        -> include/**/file.cpp
  "   src/**/file.cpp -> include/**/file.h
  au BufEnter *.cpp let b:fswitchdst = 'h,hpp'
  au BufEnter *.cpp let b:fswitchlocs = 'include/**,reg:/src.*/include\*\*/'
augroup END


" ================================= Search =================================== "

set hlsearch
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

let &colorcolumn=81

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

" A simple command for calling FSwitch to switch between source and header
" files.
command! FS call FSwitch('%', '')

" ================================ Mappings ================================== "

" Set the leader.
let mapleader = ","

" Map Y to yank until EOL.
map Y y$

" Map j,k to include wrapped lines.
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

" Easymotion mappings.
nmap f <Plug>(easymotion-fl)
vmap f <Plug>(easymotion-fl)
nmap F <Plug>(easymotion-Fl)
vmap F <Plug>(easymotion-Fl)

nmap J <Plug>(easymotion-j)
vmap J <Plug>(easymotion-j)
nmap K <Plug>(easymotion-k)
vmap K <Plug>(easymotion-k)

" Escape does a number of convenience things now:
" * Unhighlight searches
" * Unhighlight misspelled words
" * Clear the vim status area
nnoremap <Esc> :noh<CR>:call SpcOff()<CR>:redraw!<CR><Esc>

" Make switching between splits easier.
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" More useful window mappings.
nnoremap <leader><C-J> :split<CR><C-W><C-J>
nnoremap <leader><C-K> :split<CR>
nnoremap <leader><C-H> :vsplit<CR>
nnoremap <leader><C-L> :vsplit<CR><C-W><C-L>
nnoremap <leader>. :bNext<CR>
nnoremap <leader>, :b#<CR>
nnoremap <leader>m :enew<CR>

" CtrlP buffer search.
noremap <leader>b :CtrlPBuffer<CR>

" Toggle NERDTree.
noremap <leader>n :NERDTreeFind<CR>

" Use Mundo as a 'super undo'
nnoremap <leader>u :MundoToggle<CR>

" Make interaction with the system clipboard easier.
" Paste from system clipboard.
noremap "" "+p

" Copy to system clipboard.
vnoremap "' "+y

" Cut to system clipboard.
vnoremap "d "+d

" Paste from the yank register more quickly.
noremap "p "0p

" Make C-a page down like C-b, since C-b is used as the tmux prefix key.
nnoremap <C-a> <C-b>

" Don't overwrite the p buffer when pasting over something.
" This is useful when you copy something and want to paste it in more than one
" place.
xnoremap p pgvy

" Make it easier to get to the end of the line.
nnoremap Q $
vnoremap Q $

" Cscope mappings.
nmap <unique> <C-S>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <unique> <C-S>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <unique> <C-S>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <unique> <C-S>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <unique> <C-S>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <unique> <C-S>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <unique> <C-S>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <unique> <C-S>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" ============================= Auto Commands ================================ "

" Get rid of the python omnifunc, because it can be really slow.
au FileType python setlocal omnifunc=

