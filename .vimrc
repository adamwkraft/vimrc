"""""""""""""""""
" Vundle Set Up "
"""""""""""""""""

if $TERM == "xterm"
    set t_Co=256               " 256 colors
endif
" set t_AB=^[[48;5;%dm
" set t_AF=^[[38;5;%dm

set nocompatible              " be iMproved, required
let mapleader=","             " change the leader to be a comma vs slash
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" My plugins
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'klen/python-mode'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'kien/ctrlp.vim'
Plugin 'desert-warm-256'
Plugin 'yann2192/vim-colorschemes'
Plugin 'majutsushi/tagbar'

call vundle#end()            " required
filetype plugin indent on    " required

" Powerline setup
set laststatus=2
" let g:Powerline_symbols = 'fancy'
" NOTE: Need to configure fonts for iterm preferences

" NerdTree set up
map <F2> :NERDTreeToggle<CR>

" Python-mode set up
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 0
" Documentation
let g:pymode_doc = 0
" let g:pymode_doc_key = 'K'
"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = ["pyflakes","pep8"]
" Sort errors by relevance
let g:pymode_lint_sort = ['E', 'C', 'I']
let g:pymode_options_max_line_length = 120
" Auto check on save
let g:pymode_lint_write = 1
" Show message on current line
let g:pymode_lint_message = 1
" Don't show the popup window
let g:pymode_lint_cwindow = 0
let g:pymode_quickfix_minheight = 0
let g:pymode_quickfix_maxheight = 0
" Turn off max line bar
" let g:colorcolumn=
" Support virtualenv
" let g:pymode_virtualenv = 1
" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'
" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
" Don't autofold code
let g:pymode_folding = 0
" Turn off max-line width colorbar
autocmd FileType python set colorcolumn=

" NERDTree set up
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTreeToggle

" SimplyFold set up
let g:SimpylFold_docstring_preview = 1
" Enable folding with the spacebar
nnoremap <space> za
" Start with no folds
set foldlevelstart=20

" YouCompleteMe set up
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_goto_buffer_command = 'same-buffer'
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Ctrl-p custom root marker
let g:ctrlp_root_markers = ['.adam_ctrlp_marker']

" Tagbar sort by file order
let g:tagbar_sort = 0

" Colors set up
if has("gui_running")
    colorscheme kellys
    " Remove menu bar
    set guioptions-=m

    " Remove toolbar
    set guioptions-=T
else
    if &t_Co >= 256
        colorscheme kellys
    else
        colorscheme wargrey
    endif
endif

""""""""""""""""""""
" Other Vim Set Up "
""""""""""""""""""""

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
" automatically change window's cwd to file's dir
set autochdir

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" TODO: Look into Repeat.vim
" Add Python Doc Strings like numpy format
:command Pydoc :normal i<tab>Parameters<return>----------<return><return>Returns<return>-------<ESC>

let python_highlight_all=1
syntax on

" Highlight characters over a max lint length and trailing space
highlight OverLengthAndTrailingSpaces ctermbg=red ctermfg=white guibg=#592929
match OverLengthAndTrailingSpaces /\%101v.\+\|\s\+$/

" Run an initial PyLint check
autocmd FileType python PymodeLint

" Tag Bar
map <F3> :TagbarToggle<CR>
