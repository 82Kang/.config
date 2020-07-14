execute pathogen#infect()
"================================================================================
"                             ENVIRONMENT
"================================================================================
syntax on
filetype plugin indent on
set number
set relativenumber
set splitright
set splitbelow

" This color allows comments to be shown in this color. Earlier comments were
" and sort of unvisible to the eye.
:color desert

" Tell syntastic to run when we open a file
" Not to run when we close it
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" Get rid of accidental trailing whitespace on space
" TODO: From where it came?
autocmd BufWritePre * :%s/\s\+$//e

""NERDTree config
"close NERDTree if it's the last buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"open NERDTree on RHS.
let g:NERDTreeWinPos = "right"

"==============================================================================
"                              THEMES
"=============================================================================
"Airline config
"set Airline theme
"TODO: Figure out how airline and gruvbox can co-exist.
let g:airline_theme='distinguished'
autocmd vimenter * colorscheme gruvbox

"If working in windows subsystem linux or in Putty, disable the irritating beep of console
"NOTE: This also requires that '"set bell-style none" to be set in
"/etc/inputrc
"this will change the feedback from console beep to visual blips
set visualbell

"this will turn off the visual blips for the visualbell
set t_vb=

"TODO:
"
"2. tab and space settings.
"3. marker setting for the global environment. How many of them we can have?
"3. understand syntastic.
"

"Set no tabs and tabwidth of 4 spaces
set tabstop=4
set shiftwidth=4
"setting expandtab will make tab use spaces, and number of spaces need to be
"""inserted is dictated by softtabstop (usually same as tabstop).
set expandtab


"Searching in file
"ignorecase
"smartcase. NOTE: This requires setting ignorecase to work
set ignorecase
set smartcase

"place a purple colored cursor on the 81th coloum, if there is a text in it.
"TODO: not working in vertical splits and sometimes have to reload the config
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)


"undo list
set undofile            "save undos after file closes.
set undodir=$HOME/.vim/file_history  "where to keep undo histories.
"some other undo options
"set undolevels=1000    "how many undos
"set undoreload=10000   "number of lines to save for undo

"keep swap files at one place (swap files are not friendly with CIFS share for
"MIT)
"NOTE: This dir must be there, vim doesn't create it for us.
set directory=$HOME/.vim/swapfiles/

"To view commands in bottom right corner
set showcmd
"Automatically create View files
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

"set minimum height to 0 to avoid extra line shown when maximize splits
set wmh=0
"=======================================================================
"                          PLUGIN MANAGE
"=======================================================================
" Diable the default yankstack mapping which use meta(alt)
" let g:yankstack_map_keys = 0
"PLUGIN: Yankring
"nmap <C-w> <Plug>yankstack_substitute_older_paste
"nmap <C-m> <Plug>yankstack_substitute_newer_paste
"========================================================================
"                          KEY MAPPINGS
"========================================================================

"map space key to leader
nmap <Space> <leader>
"Pane navigation
"
"Use Ctrl hjkl to move b/w panes

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Change local list navigation
nnoremap <C-N> :lnewer<CR>
nnoremap <C-P> :lolder<CR>

"Change global list navigation
"Tried using <C-M> instead of <C-X> but it's treated as <CR> :(
nnoremap <C-X> :cnewer<CR>
nnoremap <C-C> :colder<CR>

"map to change word from current yanked text
nnoremap cii ciw<C-r>0
nnoremap ciI ciW<C-r>0
"nnoremap dii diw"0p TODO:Why this isn't working?

"Need to call yankstack#setup before defining my own yanks.
" call yankstack#setup()
nnoremap Y y$
" other mappings involving y, d, c, etc
" set ignores for vimgrep
set wildignorecase
set wildignore+=debug/**,release/**,*.out,tags,*.a
augroup quickfix
	    autocmd!
		autocmd QuickFixCmdPost [^l]* cwindow
		autocmd QuickFixCmdPost l* lwindow
	augroup END
"======================================================================
"                         LEADER MAPS
"======================================================================
"Change current line
nnoremap <leader>c ddO
"map to enter the lvim regex search for cur file (local window)
nnoremap <leader>s :lvim /\v/jg %<left><left><left><left><left>
"map to enter the lvim regex search for last selection (local window)
"need escaping in second '\%V' because we are in very magic mode.
nnoremap <leader>v :lvim /\%V\v%\V/jg %<left><left><left><left><left><left><left><left>
"map to enter the lvim regex search for last selection (quickfix: global window)
nnoremap <leader>V :vim /\%V\v%\V/jg %<left><left><left><left><left><left><left><left>
"map to enter the vim regex search for cur file (quickfix: global window)
nnoremap <leader>S :vim /\v/jg %<left><left><left><left><left>
"map to enter the vim regex search for cur dir, recursive (local window)
"**/ -> recursive
"*   -> all files
"to search for specific file, use **/*.c (for c files only)
nnoremap <leader>d :lvim /\v/jg **/*<left><left><left><left><left><left><left><left>
"map to enter the vim regex search for cur dir, recursive (quickfix: global window)
nnoremap <leader>D :vim /\v/jg **/*<left><left><left><left><left><left><left><left>
"======================================================================
"                        CUSTOMS
"======================================================================
"Map gl to :tablast (cycle b/w two vim tabs)
if !exists('g:lasttab')
	  let g:lasttab = 1
endif
nmap gl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

"===============================================================
"                           STORE ROOM
"===============================================================
""Cycle through tabs key changes
"execute set <M-h>=\eh"
"execute set <M-l>=\el"
"nnoremap <M-h> gT
"nnoremap <M-l> gt
""This is cleanup of above two maps: pressing <Esc>+h/l fast in insert mode
""was inserting special characters, just make <Alt-h/l> and hence <Esc>+h/l,
""exit out of insert mode (with h/l movements), when that happens.
"inoremap <M-h> <Esc>h
"inoremap <M-l> <Esc>l
"
""Cycle through panes
"nnoremap <Tab> <c-W>w
"nnoremap g<Tab> <c-W>W

"As terminal send same keycode with <c-i> and <Tab>,
"remapping <Tab> above made jump list next by <c-i>
"fuctionality disabled (it worked as <Tab>), to
"enable it we need different binding for jump list next
"nnoremap <c-N> <c-i>

