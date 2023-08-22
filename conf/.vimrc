"====================================================================
" Leader key
"====================================================================
nnoremap <space> <nop>
let g:mapleader = " "


"====================================================================
" Map - keep up-to-date as a quick reference and to avoid conflicts.
"====================================================================
" <leader>   |  
"         a  |  
"         b  |  
"         c  |  
"         d  |  
"         e  |  netrw explorer
"         f  |  fzf
"         g  |  
"         h  |  
"         i  |  
"         j  |  
"         k  |  
"         l  |  list buffers
"         m  |  
"         n  |  next buffer
"         o  |  
"         p  |  previous buffer
"         q  |  
"         r  |  
"         s  |  
"         t  |  
"         u  |  
"         v  |  
"         w  |  tree
"         x  |  
"         y  |  
"         a  |  
"   <space>  | toggle previous buffer
"         ;  | open terminal in tab

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

" Zippy
set timeoutlen=300
set updatetime=300
set ttyfast

set clipboard=unnamed

" Capture mouse (prevents tmux from scrolling out of vim).
set mouse=a
set ttymouse=sgr

" Nice vertical lines for window splits.
set fillchars+=vert:\▏

" Scroll a bit extra horizontally when scrolling past side edge.
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
nnoremap <silent> \\ :nohlsearch<CR><c-L>


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
nnoremap <silent> tn :set number! number?<CR>

" Toggle soft line wrapping: tw
set nowrap
nnoremap <silent> tw :set wrap! wrap?<CR>

" Toggle list (display) hidden whitespace: tl
set listchars=eol:↲,tab:→\ ,nbsp:_,extends:…,trail:•
set nolist
nnoremap <silent> tl :set list! list?<CR>

" Toggle current line highlighting: th
set cursorline
nnoremap <silent> th :set cursorline!<CR>


" Toggle syntax highlighting: ts
syntax enable
syntax on
nnoremap <silent> ts :if exists("g:syntax_on") <bar>
         \   syntax off <bar>
         \ else <bar>
         \   syntax on <bar>
         \ endif <CR>


" Disable syntax highlighting for specific file extensions, for ex:
"au BufNewFile,BufRead *.{json} setlocal syntax=off


"====================================================================
" Buffers
"====================================================================
" Go to next buffer.
nnoremap <silent> <leader>n :bn<CR>

" Go to previous buffer.
nnoremap <silent> <leader>p :bp<CR>

" Toggle buffer (switch between current and last buffer).
nnoremap <silent> <leader><space> <C-^>

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
nnoremap <silent> <leader>l :buffers<CR>
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
"nnoremap <silent> <leader>- :exe "resize " . (winheight(0) - 10)<CR>
"nnoremap <silent> <leader>= :exe "resize " . (winheight(0) + 10)<CR>

" Resize vertical splits (change width).
" <c-w><s-,> and <c-w><s-.> only shift one line at a time (too slow)
"nnoremap <silent> <C-w>, <C-w><s-,>
"nnoremap <silent> <C-w>. <C-w><s-.>
"nnoremap <silent> <leader>, :exe "vertical resize " . (winwidth(0) - 10)<CR>
"nnoremap <silent> <leader>. :exe "vertical resize " . (winwidth(0) + 10)<CR>

" Resize everything evently.
"nnoremap <silent> <leader>0 <c-w>=


"====================================================================
" Tabs
"====================================================================
nnoremap <silent> ttf :tabfirst<CR>
nnoremap <silent> ttl :tablast<CR>
nnoremap <silent> ttn :tabnext<CR>
nnoremap <silent> ttp :tabprev<CR>
nnoremap <silent> ttc :tabclose<CR>
nnoremap <silent> tls :tabs<CR>


"====================================================================
" Terminal
"====================================================================
nnoremap <silent> <leader>; :tab term<CR>
tnoremap <nowait> <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<C-w>N"


"====================================================================
" netrw file explorer (project drawer)
" Minimalist configuration; sometimes it's nice to see the file
" directory structure, but the rest of the time, use fzf (below).
" Note: <leader>t has been mapped to the shell tree command as well.
"====================================================================
let g:netrw_banner = 0
let g:netrw_liststyle = 3

" Acts as a toggle, but only works if netrw has been loaded first,
" such as by entering :e .<CR>
nnoremap <silent> <leader>e :Rexplore<CR>


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
nnoremap <silent> <leader>f :FZF<CR>

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
    set tabstop=8
    set softtabstop=4
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

augroup AutoEnter
    autocmd!
    autocmd VimEnter * call s:default()
augroup END

nnoremap <silent> <leader>t :!tree -C \| less -r <CR><CR>


"====================================================================
" Color scheme
"====================================================================
set bg=dark
colorscheme slate

command! Slate :colorscheme slate
command! Dark  :colorscheme quiet|set bg=dark
command! Light :colorscheme quiet|set bg=light

