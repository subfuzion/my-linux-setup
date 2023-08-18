"====================================================================
" Configure (edit) and (re)oad .vimrc
"====================================================================
nnoremap conf :e $MYVIMRC <enter>
nnoremap confs :source $MYVIMRC <enter>


"====================================================================
" Leader key
"====================================================================
nnoremap <space> <nop>
let g:mapleader = " "


"====================================================================
" Basic editor settings
"====================================================================
set backupdir=/tmp//
set directory=/tmp//
set undodir=/tmp//

" Disable beep / flash.
set vb t_vb=
set novisualbell
set noerrorbells
set backspace=indent,eol,start

" Shorten from default 2 seconds.
set timeoutlen=1000

" For faster connections, otherwise disable this:
set ttyfast

set clipboard=unnamed

" Capture mouse (prevents tmux from scrolling out of vim).
set mouse=a
set ttymouse=sgr

" Nicer vertical lines for splits.
set fillchars+=vert:\▏

" Scroll a bit extra horizontally when moving cursor out of view.
set sidescroll=6

" Enable line and column display.
set ruler

" Note: set noshowmode if using vim-airline.
set showmode

" Show command in statusline
set showcmd

" Always show statusline even if only window
set laststatus=2

" Highlight current line
set cursorline
nnoremap <silent> <leader>h :set cursorline!<enter>

" Highlight matches when searching.
" Use <esc><esc> to clear.
set hlsearch
" Redraw screen and clear search highlighted items.
" http://stackoverflow.com/questions/657447/vim-clear-last-search-highlighting#answer-25569434
" nnoremap <silent> <c-L> :nohlsearch<enter><c-L>
nnoremap <silent> <esc><esc> :nohlsearch<enter><c-L>

" Visual matching for :e.
set wildmenu
"set wildmode=list:longest
set wildmode=full:lastused


"====================================================================
" Dirty files behavior
"====================================================================
" Leave buffers without being forced to write changes, but get
" reminded if unsaved changes when quitting.
set hidden
set noautowriteall

" Automatically save changes when leaving buffers.
" The opposite of the above (maybe useful if you always want changes
" saved when leaving a buffer, such as watching for files changes
" in a dev environment and you don't want to keep saving everything
" explicitly.
"set nohidden
"set autowriteall

" Safety check to ensure no unsaved buffers when quitting.
set confirm


"====================================================================
" Format
"====================================================================
set tabstop=4
set shiftwidth=4
set noexpandtab
set autoindent
filetype plugin indent on


"====================================================================
" Toggle line numbers
"====================================================================
set nonumber
nnoremap <silent> tn :set number! number?<enter>


"====================================================================
" Toggle soft line wrapping
"====================================================================
set nowrap
nnoremap <silent> tw :set wrap! wrap?<enter>


"====================================================================
" Toggle syntax
"====================================================================
syn enable
syn on

" Disable syntax highlighting for:
"au BufNewFile,BufRead *.{json} setlocal syntax=off

nnoremap <silent> ts :if exists("g:syntax_on") <bar>
         \   syntax off <bar>
         \ else <bar>
         \   syntax on <bar>
         \ endif <enter>


"====================================================================
" Toggle list (show hidden whitespace)
"====================================================================
set listchars=eol:↲,tab:→\ ,nbsp:_,extends:…,trail:•
set nolist
nnoremap <silent> tl :set list! list?<enter>


"====================================================================
" Color scheme
"====================================================================
set bg=dark
colorscheme slate

command! Slate :colorscheme slate
command! Dark  :colorscheme quiet|set bg=dark
command! Light :colorscheme quiet|set bg=light


"====================================================================
" Buffers
"====================================================================
" Write buffer.
nnoremap <silent> <leader>w :w<enter>

" Go to next buffer.
nnoremap <silent> <leader>n :bn<enter>

" Go to previous buffer.
nnoremap <silent> <leader>p :bp<enter>

" Toggle buffer (switch between current and last buffer).
nnoremap <silent> <leader><space> <C-^>


" Close buffer.
nnoremap <silent> <leader>d :bd<enter>

" Kill buffer (ignore edits).
nnoremap <silent> <leader>k :bd!<enter>

" Page forward and back.
nnoremap <S-f> <c-f>
nnoremap <S-b> <c-b>

" Scroll up and down using same keys for cursor up and down.
"nnoremap <C-j> <c-e>
"nnoremap <C-k> <c-y>

" Move cursor to top, middle, or bottom.
" Easier for me to remember "go top" than "HIGH" (or "home"), etc.
"nnoremap gt H
"nnoremap gm M
"nnoremap gb L

" Try to scroll current line to top, middle, or bottom.
" I really have trouble hitting the z key with my pinky, so "m" for "move".
" Plus I like to return cursor to column 1.
" Reminder: Ctrl-e and Ctrl-y scroll line by line.
nnoremap mt zt 0
nnoremap mm zz 0
nnoremap mb zb 0

" Go to buffer.
"
" 1.  <space>l
"     => list buffers and then enter :b# to go to buffer
"        or :b<space><tab> to select
nnoremap <silent> <leader>l :buffers<enter>
"
" 2.  <tab><tab>
"     => list buffers and select by tabbing
nnoremap <silent> <Tab> :buffer<space>


"====================================================================
" Windows
" :new         | add horizontal split and active window below
" :vnew        | add vertical split and active window to right
" <c-w>h|j|k|l | move to window to left|below|above|right
" <c-w>c       | close window (not buffer)
"====================================================================
" Prefer opening windows to right and below.
set splitright
set splitbelow

" Resize horizontal splits (change height).
" <c-w><s--> and <c-w><s-=> only shift one line at a time (too slow)
"nnoremap <silent> <C-w>- :exe <C-w><s-->
"nnoremap <silent> <C-w>= :exe <C-w><s-=>
"nnoremap <silent> <leader>- :exe "resize " . (winheight(0) - 10)<cr>
"nnoremap <silent> <leader>= :exe "resize " . (winheight(0) + 10)<cr>

" Resize vertical splits (change width).
" <c-w><s-,> and <c-w><s-.> only shift one line at a time (too slow)
"nnoremap <silent> <C-w>, <C-w><s-,>
"nnoremap <silent> <C-w>. <C-w><s-.>
"nnoremap <silent> <leader>, :exe "vertical resize " . (winwidth(0) - 10)<cr>
"nnoremap <silent> <leader>. :exe "vertical resize " . (winwidth(0) + 10)<cr>

" Resize everything evently.
"nnoremap <silent> <leader>0 <c-w>=


"====================================================================
" Terminal
"====================================================================
" Start terminal in insert mode.
"au Bufenter * if &buftype == 'terminal' | :startinsert | endif

" New terminal below.
"nnoremap <silent> <leader>; :botright terminal<cr>


" New terminal to the right.
"nnoremap <silent> <leader>, :vertical terminal<cr>
"tnoremap <silent> <leader>, <c-w>:vertical terminal ++close<cr>

" Navigation
"tnoremap <leader>hh <c-w>h
"tnoremap <leader>jj <c-w>j
"tnoremap <leader>kk <c-w>k
"tnoremap <leader>ll <c-w>l

" Go to previous / next buffer
"tnoremap <leader>p <c-w><c-p>
"tnoremap <leader>n <c-w><c-n>

" toggle buffer (switch between current and last buffer).
"tnoremap <silent> <leader>bb <C-^>

" Close terminal
" ==============

" Enter terminal "normal" mode.
" tnoremap <silent> <esc> <c-\><c-n>

" Close window but don't terminate the shell buffer (can go back to it later)
"tnoremap <silent> <leader>; <c-w>:close!<cr>

" Close window and terminate the shell.
"tnoremap <silent> <leader>c <c-w>:bd!<cr>


"====================================================================
" find
"====================================================================
set wildignore=.git/,node_modules/,build/,tmp/,scratch
set path+=**


"====================================================================
" netrw file explorer (project drawer)
" This is a crutch; use fzf instead (see below), but sometimes it's
" nice to see the tree vertically.
"
" https://shapeshed.com/vim-netrw/
" https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/
" http://ellengummesson.com/blog/2014/02/22/make-vim-really-behave-like-netrw/
" https://github.com/tpope/vim-vinegar
"====================================================================
set nocp
filetype plugin on
let g:netrw_altv = 1
let g:netrw_banner = 0
let g:netrw_browse_split = 0
let g:netrw_keepdir = 0
"let g:netrw_liststyle = 3
let g:netrw_localcopydircmd = 'cp -r'
let g:netrw_winsize = 25
hi! link netrwMarkFile Search

nnoremap <silent> mm :Lexplore %:p:h<enter>
nnoremap <silent> m; :Lexplore<enter>
"nnoremap <silent> <Space> :Lexplore<enter>

augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * if argc() == 0 | :Lexplore | endif
augroup END

" Comment this out to leave project drawer open after selecting file
autocmd FileType netrw autocmd BufLeave <buffer> if &filetype == 'netrw' | :bd | endif


"====================================================================
" fzf
" https://github.com/junegunn/fzf/blob/master/README-VIM.md
" Check out: https://github.com/junegunn/fzf.vim
"====================================================================
set rtp+=~/.fzf
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'belowright split',
  \ 'ctrl-v': 'vsplit' }

" map :fzf to :FZF
cnoreabbrev <expr> fzf getcmdtype() == ":" && getcmdline() == 'fzf' ? 'FZF' : 'fzf'

" map ;; to :FZF
nnoremap <silent> <enter> :FZF<enter>

" To enable history for MRU...
" Personally, I prefer Ctrl-n and Ctrl-p for navigating the visual
" list, not history
"let g:fzf_history_dir = '~/.local/share/fzf-history'


