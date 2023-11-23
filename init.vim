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

" This must be set to avoid a bug causing garbage characters to appear after
" the cursor.
" set guicursor=

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
set cscopetag

" Don't insert a double space when wrapping sentences.
set nojoinspaces

" Swapfiles on and saved to a single place.
set swapfile
set directory=~/.vim/swap//

" Protect against crash-during-write but don't keep the backup after
" successful write.
set writebackup
set nobackup
set backupcopy=auto
set backupdir=~/.vim/backup//

" Don't start with things folded.
set foldlevelstart=20
set fillchars="fold:' '"

" Automatically include system clipboard for yank and put
set clipboard+=unnamedplus

" Disable messages about insertion completion messages
set shortmess+=c

" Use xdg-open to open files/URLs under the cursor when pressing 'gx'.
let g:netrw_browsex_viewer="xdg-open"

" Required for deoplete
let g:python3_host_prog = '/usr/bin/python3'

" ================================ Plugins =================================== "

" Plug plugin manager.
call plug#begin('~/.vim/plugged')

Plug 'ntpeters/vim-better-whitespace'
Plug 'vim-scripts/cmdalias.vim'
Plug 'derekwyatt/vim-fswitch'
Plug 'tpope/vim-fugitive'
Plug 'Shougo/neoinclude.vim'
Plug 'scrooloose/nerdtree'
Plug 'adamheins/vim-simple-status'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'simnalamburt/vim-mundo'
Plug 'rhysd/vim-grammarous'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'adamheins/vim-highlight-match-under-cursor'
Plug 'tpope/vim-repeat'
Plug 'justinmk/vim-sneak'
Plug 'ludovicchabant/vim-gutentags'
Plug 'embear/vim-localvimrc'
" Plug 'adamheins/vim-col'
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'Konfekt/FastFold'
" Plug 'neomake/neomake'

" fzf is used to do fast searching of files and words
" previously searching for files was done with ctrlp
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Language/domain-specific plugins.
" TODO: probably replace some of these with LSP stuff?
Plug 'othree/html5.vim'
Plug 'daeyun/vim-matlab'
Plug 'digitaltoad/vim-pug'
Plug 'rust-lang/rust.vim'
Plug 'mrk21/yaml-vim'
Plug 'chr4/nginx.vim'
Plug 'lervag/vimtex'
Plug 'andymass/vim-matchup'
Plug 'psf/black', { 'branch': 'stable' }
Plug 'rhysd/vim-clang-format'
Plug 'cespare/vim-toml'

" nvim-cmp for autocompletion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-omni'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

call plug#end()

" Buffergator
" Sort buffer list by most recently used
let g:buffergator_sort_regime = 'mru'

" Gutentags
" Tag files are all generated in this directory
let g:gutentags_cache_dir = '~/.vim/tags/'

" Grammarous
let g:grammarous#enable_spell_check = 1

" LSP/autocompletion lua config
lua require('lsp')

" NERDTree
let NERDTreeQuitOnOpen = 1
let NERDTreeMapUpdir = '..'

" Neomake
let g:neomake_verbose = 0
let g:neomake_place_signs = 0
" autocmd! BufWritePost * Neomake

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

" Ctrl-p
let g:ctrlp_root_markers = ['cscope.files']
let g:ctrlp_user_command = ['cscope.files', 'cat %s/cscope.files']
let g:ctrlp_extensions = ['tag']
let g:ctrlp_regexp = 1

" FSwitch
" Don't create the corresponding file if it doesn't exist.
let g:fsnonewfiles = 1

" Define search paths to switch between header and source files.
augroup cppfiles
  au!
  " Switch from header files to source files.
  " Cases handled:
  "   file.h            -> file.cpp
  "   include/**/file.h -> file.cpp
  "   include/**/file.h -> src/**/file.cpp
  au BufEnter *.h let b:fswitchdst = 'c,cpp,cc'
  au BufEnter *.h let b:fswitchlocs = 'reg:|include.*||,reg:|include.*|src/**|'

  au BufEnter *.hpp let b:fswitchdst = 'cpp,cc'
  au BufEnter *.hpp let b:fswitchlocs = 'reg:|include.*||,reg:|include.*|src/**|'

  au BufEnter *.hh let b:fswitchdst = 'cc,cpp'
  au BufEnter *.hh let b:fswitchlocs = 'reg:|include.*||,reg:|include.*|src/**|'

  " Switch from source files to header files.
  " Cases handled:
  "   file.cpp     -> file.h
  "   file.cpp     -> include/**/file.h
  "   src/file.cpp -> include/**/file.h
  "
  " Explanation of \v(src)(.*src)@!:
  "   \v: Very magic
  "   (src): Match the substring 'src'
  "   (.*src)@!: Negative lookahead; don't match if followed by 'src'.
  au BufEnter *.c let b:fswitchdst = 'h'
  au BufEnter *.c let b:fswitchlocs = 'reg:|\v(src)(.*src)@!|include/**|,reg:|src.*|include/**|,include/**'

  au BufEnter *.cpp let b:fswitchdst = 'hpp,hh,h'
  au BufEnter *.cpp let b:fswitchlocs = 'reg:|\v(src)(.*src)@!|include/**|,reg:|src.*|include/**|,include/**'

  au BufEnter *.cc let b:fswitchdst = 'hh,hpp,h'
  au BufEnter *.cc let b:fswitchlocs = 'reg:|\v(src)(.*src)@!|include/**|,reg:|src.*|include/**|,include/**'
augroup END

" Clang format
let g:clang_format#detect_style_file = 1

" Matchup
let g:matchup_override_vimtex = 1
let g:matchup_matchparen_offscreen = {}

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

let &colorcolumn=80

" ============================ Persistent Undo =============================== "

" Create undo directory if it doesn't exist.
if has('persistent_undo') && !isdirectory(expand('~').'/.vim/undo')
  silent !mkdir ~/.vim/undo > /dev/null 2>&1
endif
set undodir=~/.vim/undo//
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

" Sneak mappings
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

" Escape does a number of convenience things now:
" * Unhighlight searches
" * Unhighlight misspelled words
" * Turn off cursorcolumn (only on when searching)
" * Clear matches
" * Clear the status area
nnoremap <Esc> :noh<CR>:call SpcOff()<CR>:set nocursorcolumn<CR>:call clearmatches()<CR>:echo ""<CR><Esc>

" fzf
" Open text search window by pressing Ctrl-F
noremap <C-F> :Rg<CR>
" Open file search window by pressing Ctrl-P
noremap <C-P> :Files<CR>

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

" Toggle NERDTree.
noremap <leader>n :NERDTreeFind<CR>

" Use Mundo as a 'super undo'
nnoremap <leader>u :MundoToggle<CR>

" Make interaction with the system clipboard easier.
" Paste from system clipboard.
" noremap "" "+p

" Copy to system clipboard.
" vnoremap "' "+y

" Cut to system clipboard.
" vnoremap "d "+d

" Paste from the yank register more quickly.
" noremap "p "0p

" Make C-a page down like C-b, since C-b is used as the tmux prefix key.
" nnoremap <C-a> <C-b>

" Don't overwrite the p buffer when pasting over something.
" This is useful when you copy something and want to paste it in more than one
" place.
xnoremap p pgvy

" Make it easier to get to the end of the line.
nnoremap Q $
vnoremap Q $

" tComment makes gc comment out code. I accidentally hit cg too often.
vmap cg gc

" Cscope mappings.
nmap <unique> <C-S>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <unique> <C-S>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <unique> <C-S>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <unique> <C-S>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <unique> <C-S>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <unique> <C-S>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <unique> <C-S>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <unique> <C-S>d :cs find d <C-R>=expand("<cword>")<CR><CR>
