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
Plugin 'tpope/vim-rhubarb'
Plugin 'scrooloose/nerdtree'
Plugin 'klen/python-mode'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'yann2192/vim-colorschemes'
Plugin 'majutsushi/tagbar'
Plugin 'easymotion/vim-easymotion'
Plugin 'wincent/command-t'

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
" Specific warnings to ignore
let g:pymode_lint_ignore = "E231,C901,E266,E712"
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

" Tagbar sort by file order
let g:tagbar_sort = 0

" Easy Motion
" Still trying to get the hand of this...
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" map  s <Plug>(easymotion-sn)
" omap s <Plug>(easymotion-tn)
" map  / <Plug>(easymotion-sn)
" omap / <Plug>(easymotion-tn)
" map  n <Plug>(easymotion-next)
" map  N <Plug>(easymotion-prev)
" <Leader>f{char} to move to {char}
" map  <Leader>f <Plug>(easymotion-bd-f)
" nmap <Leader>f <Plug>(easymotion-overwin-f)
" " s{char}{char} to move to {char}{char}
nmap ss <Plug>(easymotion-overwin-f2)
" Move to line
map <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>l <Plug>(easymotion-overwin-line)
" Turn on case insensitive feature
" let g:EasyMotion_smartcase = 1
" Move to word
" map  <Leader>w <Plug>(easymotion-bd-w)
" nmap <Leader>w <Plug>(easymotion-overwin-w)

" Command-T
" nnoremap <silent> <Leader>t <Plug>(CommandT)
nnoremap <silent> <Leader>T <Plug>(CommandTJump)

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
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set backspace=indent,eol,start
" automatically change window's cwd to file's dir
set autochdir

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let python_highlight_all=1
syntax on

" Highlight characters over a max lint length and trailing space
highlight OverLengthAndTrailingSpaces ctermbg=red ctermfg=white guibg=#592929
match OverLengthAndTrailingSpaces /\%101v.\+\|\s\+$/

" Run an initial PyLint check
autocmd FileType python PymodeLint

" Tag Bar
map <F3> :TagbarToggle<CR>

" Indent Python in the Google way.
setlocal indentexpr=GetGooglePythonIndent(v:lnum)

let s:maxoff = 50 " maximum number of lines to look backwards.

function GetGooglePythonIndent(lnum)

  " Indent inside parens.
  " Align with the open paren unless it is at the end of the line.
  " E.g.
  "   open_paren_not_at_EOL(100,
  "                         (200,
  "                          300),
  "                         400)
  "   open_paren_at_EOL(
  "       100, 200, 300, 400)
  call cursor(a:lnum, 1)
  let [par_line, par_col] = searchpairpos('(\|{\|\[', '', ')\|}\|\]', 'bW',
        \ "line('.') < " . (a:lnum - s:maxoff) . " ? dummy :"
        \ . " synIDattr(synID(line('.'), col('.'), 1), 'name')"
        \ . " =~ '\\(Comment\\|String\\)$'")
  if par_line > 0
    call cursor(par_line, 1)
    if par_col != col("$") - 1
      return par_col
    endif
  endif

  " Delegate the rest to the original function.
  return GetPythonIndent(a:lnum)

endfunction

let pyindent_nested_paren="&sw*2"
let pyindent_open_paren="&sw*2"
" END - Indent Python in the Google way.

" Command to insert pdb
:command PDB :normal A<enter>import pdb; pdb.set_trace()<ESC>

" Open file to line where you left off
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif
