"====================================================================
" Leader key
"====================================================================
nnoremap <space> <nop>
let g:mapleader = " "


"====================================================================
" Basic editor settings
"====================================================================
" Don't pollute current directory
set backupdir=/tmp//
set directory=/tmp//
set undodir=/tmp//

" Disable beep / flash.
set vb t_vb=
set novisualbell
set noerrorbells
set backspace=indent,eol,start

" Shorten from default 2 seconds.
set timeoutlen=500

" Good for faster connections
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

" Always show statusline even if only window.
set laststatus=2

" Highlight matches when searching.
set hlsearch
" Clear highlighted search items (redraw screen).
nnoremap <silent> \\ :nohlsearch<enter><c-L>


"====================================================================
" Unsaved files behavior
"====================================================================
" Leave buffers without being forced to write changes, but get
" reminded if unsaved changes when quitting.
" Also, netrw will use the whole window when `hidden` is set.
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
" Toggles
"====================================================================
" Toggle line numbers: tn
set nonumber
nnoremap <silent> tn :set number! number?<enter>

" Toggle soft line wrapping: tw
set nowrap
nnoremap <silent> tw :set wrap! wrap?<enter>

" Toggle list (display) hidden whitespace: tl
set listchars=eol:↲,tab:→\ ,nbsp:_,extends:…,trail:•
set nolist
nnoremap <silent> tl :set list! list?<enter>

" Toggle current line highlighting: th
set cursorline
nnoremap <silent> th :set cursorline!<enter>


" Toggle syntax highlighting: ts
syntax enable
syntax on
nnoremap <silent> ts :if exists("g:syntax_on") <bar>
         \   syntax off <bar>
         \ else <bar>
         \   syntax on <bar>
         \ endif <enter>


" Disable syntax highlighting for specific file extensions, for ex:
"au BufNewFile,BufRead *.{json} setlocal syntax=off


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
nnoremap <C-j> <c-e>
nnoremap <C-k> <c-y>

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
" Avoid these settings and embrace vim. Use only if you must.
" :new         | add horizontal split and active window below
" :vnew        | add vertical split and active window to right
" <c-w>h|j|k|l | move to window to left|below|above|right
" <c-w>c       | close window (not buffer)
" <c-w>=       | resize windows evently
"====================================================================
" If you prefer opening windows to right and below.
" I recommend embracing the vim way. Think of your windows as a stack
" and then opening above and to the left make sense.
"set splitright
"set splitbelow

" Resize horizontal splits (change height).
" <c-w><s--> and <c-w><s-=> only shift one line at a time (too slow)
"nnoremap <silent> <C-w>- :exe <C-w><s-->
"nnoremap <silent> <C-w>= :exe <C-w><s-=>
"nnoremap <silent> <leader>- :exe "resize " . (winheight(0) - 10)<enter>
"nnoremap <silent> <leader>= :exe "resize " . (winheight(0) + 10)<enter>

" Resize vertical splits (change width).
" <c-w><s-,> and <c-w><s-.> only shift one line at a time (too slow)
"nnoremap <silent> <C-w>, <C-w><s-,>
"nnoremap <silent> <C-w>. <C-w><s-.>
"nnoremap <silent> <leader>, :exe "vertical resize " . (winwidth(0) - 10)<enter>
"nnoremap <silent> <leader>. :exe "vertical resize " . (winwidth(0) + 10)<enter>

" Resize everything evently.
"nnoremap <silent> <leader>0 <c-w>=


"====================================================================
" Tabs
"====================================================================
nnoremap <silent> ttf :tabfirst<enter>
nnoremap <silent> ttl :tablast<enter>
nnoremap <silent> ttn :tabnext<enter>
nnoremap <silent> ttp :tabprev<enter>
nnoremap <silent> ttc :tabclose<enter>
nnoremap <silent> tls :tabs<enter>


"====================================================================
" Terminal
"====================================================================
nnoremap <silent> <leader>; :tab term<enter>

" The following seems to interfere with <esc> when using fzf...
"tnoremap <esc><esc> <C-w>N
" ...so, unfortunately, we need an explicit test for fzf:
tnoremap <expr> <esc><esc> (&filetype == "fzf") ? "<esc>" : "<C-w>N"

" Start terminal in insert mode.
"au Bufenter * if &buftype == 'terminal' | :startinsert | endif

" New terminal below.
"nnoremap <silent> <leader>; :botright terminal<enter>


" New terminal to the right.
"nnoremap <silent> <leader>, :vertical terminal<enter>
"tnoremap <silent> <leader>, <c-w>:vertical terminal ++close<enter>

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
"tnoremap <silent> <leader>; <c-w>:close!<enter>

" Close window and terminate the shell.
"tnoremap <silent> <leader>c <c-w>:bd!<enter>


"====================================================================
" netrw file explorer (project drawer)
" Minimalist configuration; sometimes it's nice to see the file
" directory structure, but the rest of the time, use fzf (below).
" Note: <leader>t has been mapped to the shell tree command as well.
"====================================================================
let g:netrw_banner = 0
let g:netrw_liststyle = 3

" Acts as a toggle, but only works if netrw has been loaded first,
" such as by entering :e .<enter>
nnoremap <silent> <leader>e :Rexplore<enter>


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
nnoremap <silent> <leader>f :FZF<enter>

" To enable history for MRU...
" I prefer Ctrl-n and Ctrl-p navigates the visual list, not history
"let g:fzf_history_dir = '~/.local/share/fzf-history'


"====================================================================
" Configuration
"====================================================================
" Initial settings likely to change often
function s:default()
	" wild menu tab completion
	set wildmenu
	set wildmode=longest:list,full

	" Format
	set tabstop=4
	set shiftwidth=4
	set noexpandtab
	set autoindent
	filetype plugin indent on

	" find
	set wildignore=.git/,node_modules/,build/,tmp/,scratch
	set path+=**
endfunction

" Reload .vimrc
command! ConfigReload source $MYVIMRC|echom "Reloaded .vimrc"

" Edit .vimrc
command! ConfigEdit edit $MYVIMRC

" Reset just the default settings
command! ConfigDefault call s:default()

" Follow ConfigDefault command pattern to create other setting profiles

autocmd VimEnter * call s:default()

nnoremap <silent> <leader>t :!tree -C \| less -r <enter><enter>


"====================================================================
" Color scheme
"====================================================================
set bg=dark
colorscheme slate

command! Slate :colorscheme slate
command! Dark  :colorscheme quiet|set bg=dark
command! Light :colorscheme quiet|set bg=light

