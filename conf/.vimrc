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
"         f  |  
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
"         rn |  rename symbol
"         s  |  
"         t  |  
"         u  |  
"         v  |  
"         w  |  tree
"         x  |  
"         y  |  
"         a  |  
"   <space>  | toggle previous buffer
"         ;  | fzf
" <C-M>      | CTRL-Enter: open terminal in tab

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
set confirm

" Automatically save changes when leaving buffers.
" The opposite of the above (maybe useful if you always want changes
" saved when leaving a buffer, such as watching for files changes
" in a dev environment and you don't want to keep saving everything
" explicitly.
"set nohidden
"set autowriteall


"====================================================================
" Toggles
" tn - toggle numbers (line numbers)
" tw - toggle wrapping (line wrapping)
" th - toggle highlighting for current line
" ts - toggle syntax highlighting
" tl - toggle list (whitespace characters)
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
         \ endif <CRdisplay >


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
"nnoremap <silent> <Tab> :buffer<space>


"====================================================================
" Windows
" Generally avoid using windows and embrace using buffers primarily.
" However, sometimes you really do need a window. If try to avoid
" being dependent on customizations and embrace the following:
" Avoid the custom settings and embrace the following:
" :new         | add horizontal split and active window below
" :vnew        | add vertical split and active window to right
" <c-w>h|j|k|l | move to window to left|below|above|right
" <c-w>c       | close window (not buffer)
" <c-w>=       | resize windows evently
"
" I use windows rarely enough that I don't mind using the mouse
" on those occasions to resize windows, so don't feel a need to
" customize the keys. However, uncomment and use the following
" if you must.
"====================================================================
" If you prefer opening windows to right and below. However, I
" recommend embracing the vim way. Just think of your windows
" as a stack and then the default behavior of opening above and
" to the left make sense.
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
" I only use tabs for the terminal.
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
nnoremap <silent> <C-M> :tab term<CR>
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
nnoremap <silent> <leader>; :FZF<CR>

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


"====================================================================
" coc.nvim
"====================================================================
set encoding=utf-8
set signcolumn=yes

noremap <silent><expr> <TAB>
        \ coc#pum#visible() ? coc#pum#next(1) :
        \ CheckBackspace() ? "\<Tab>" :
        \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
"set statusline+=%{coc#status()}%{get(b:,'coc_current_function','')}
set statusline=%<%f\ \ \ %{coc#status()}%{get(b:,'coc_current_function','')}\ %r%=%-14.(%l,%c%V%)\ %P

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

