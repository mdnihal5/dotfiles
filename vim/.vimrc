" Enable syntax highlighting and set color scheme to Monokai Phoenix
syntax enable
"colorscheme monokai-phoenix
colorscheme monokai_pro
set relativenumber
set termguicolors
" Set GUI options to include the 'a' flag
set guioptions+=a
set formatoptions-=c
set formatoptions-=r
set formatoptions-=o
" Enable system clipboard support for copying and pasting
"set clipboard=unnamedplus
" Key mappings for moving to the beginning and end of the line
nnoremap <C-b> ^        
" Move to the beginning of the line
nnoremap <C-e> $       
" Move to the end of the line
" Map Ctrl-1 to go to the first window
nnoremap <C-1> <C-w>1w
" Map Ctrl-2 to go to the second window
nnoremap <C-2> <C-w>2w
" Map Ctrl-3 to go to the third window
nnoremap <C-3> <C-w>3w

" move lines up down
" Normal mode
nnoremap <A-Down> :m .+1<CR>==
nnoremap <A-Up> :m .-2<CR>==

" Insert mode
inoremap <A-Down> <Esc>:m .+1<CR>==gi
inoremap <A-Up> <Esc>:m .-2<CR>==gi

" Visual mode
vnoremap <A-Down> :m '>+1<CR>gv=gv
vnoremap <A-Up> :m '<-2<CR>gv=gv

" Add more mappings for additional windows as needed
" If you want to use these in insert mode as well
inoremap <C-b> <C-o>^   
" Move to the beginning of the line
inoremap <C-e> <C-o>$  
" Move to the end of the line

" Custom key mappings for copying and pasting

" Copy to clipboard in normal mode
nnoremap <C-c> "+y
" Nerde Tree
nnoremap <C-t> :NERDTreeToggle<CR>
" Copy to clipboard in visual mode
vnoremap <C-c> "+y
nnoremap <C-r> :g/^$/d<CR>

" Copy to clipboard in insert mode (copies the current line)
inoremap <C-c> <C-o>"+yy

" Paste from clipboard in normal mode
nnoremap <C-p> "+p

" Paste from clipboard in visual mode (replaces the selected text)
vnoremap <C-p> "+p

" Paste from clipboard in insert mode
inoremap <C-p> <C-r><C-o>+

" Enable mouse support in all modes
set mouse=a

" Map Ctrl-F to trigger the Format() function in normal mode
nnoremap <C-f> :call Format()<CR>

" Map Ctrl-F to trigger the Format() function in insert mode
inoremap <C-f> <C-o>:call Format()<CR>

" Mapping to format the entire file and preserve cursor position
map <leader>fm gg=G'.

" Key mappings for tab navigation
noremap <F1> <ESC>:tabprev <CR>
vnoremap <F1> <ESC>:tabprev <CR>
inoremap <F1> <ESC>

" Key mappings for saving and compiling code
noremap <F3> <ESC> :w <CR> :make <CR>
inoremap <F3> <ESC> :w <CR> :make <CR>

" Key mapping for running Python scripts
" Key mappings for compiling C++ code with different sanitizer options
" Utility function to compile and run C++ code with given flags, timeout, and optional input redirection
" Utility function to compile and run C++ code with given flags and optional input redirection
function! CompileAndRun(flags, input, clear_output, output_file)
    execute 'w'
    let l:cmd = ''
    if a:clear_output
        let l:cmd .= 'clear && '
    endif
    let l:cmd .= 'g++ ' . a:flags . ' -o %< %'
    if !empty(a:input)
        let l:cmd .= ' && ./%< < ' . a:input
    else
        let l:cmd .= ' && ./%<'
    endif
    if !empty(a:output_file)
        let l:cmd .= ' > ' . a:output_file
    endif
    execute '!' . l:cmd
endfunction

" Common compilation flags
" Common compilation flags
let g:common_flags = '-std=c++23 -Wall -Wextra -Wshadow -DONPC'

" Key mappings for compiling C++ code with essential sanitizers
nnoremap <F9> :call CompileAndRun(g:common_flags . ' -O3 -DDEBUG -g -fsanitize=undefined,address', '', 0, '')<CR>
inoremap <F9> <ESC> :call CompileAndRun(g:common_flags . ' -O3 -DDEBUG -g -fsanitize=undefined,address', '', 0, '')<CR>

" F8 clears the terminal output before compiling and running (with output clearing)
nnoremap <F8> :call CompileAndRun(g:common_flags . ' -O3 -DDEBUG -g', '', 1, '')<CR>
inoremap <F8> <ESC> :call CompileAndRun(g:common_flags . ' -O3 -DDEBUG -g', '', 1, '')<CR>

" Key mappings for compiling and running C++ code with output to output.txt (no input from file)
nnoremap <F7> :call CompileAndRun(g:common_flags . ' -O3 -DDEBUG -g -fsanitize=undefined,address', '', 0, 'output.txt')<CR>
inoremap <F7> <ESC> :call CompileAndRun(g:common_flags . ' -O3 -DDEBUG -g -fsanitize=undefined,address', '', 0, 'output.txt')<CR>

" Key mappings for compiling and running C++ code with AddressSanitizer (redirecting input from a file)
nnoremap <F10> :call CompileAndRun(g:common_flags . ' -O2 -fsanitize=address', 10, 'inp')<CR>
inoremap <F10> <ESC> :call CompileAndRun(g:common_flags . ' -O2 -fsanitize=address', 10, 'inp')<CR>
" Initialize Vim plugins
call plug#begin('~/.vim/plugged')
" Plugin configurations
Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='general'
Plug 'preservim/nerdtree'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
Plug 'ayu-theme/ayu-vim' "
let ayucolor="dark"   " for dark version of theme
Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
Plug 'honza/vim-snippets'
Plug 'searleser97/cpbooster.vim'
Plug 'Abstract-IDE/Abstract-cs'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'martinsione/darkplus.nvim'
Plug 'reewr/vim-monokai-phoenix'
call plug#end()

" Filetype-specific settings
au FileType c,cpp,java setlocal equalprg=astyle

" Function to format code and remove trailing spaces
function! Format()
    silent! execute 'norm! mz'

    if &ft ==? 'c' || &ft ==? 'cpp' || &ft ==? 'php'
        set formatprg=astyle\ --mode=c
        silent! execute 'norm! gggqG'
    elseif &ft ==? 'java'
        set formatprg=astyle\ --mode=java
        silent! execute 'norm! gggqG'
    endif

    silent! call RemoveTrailingSpaces()
    silent! execute 'retab'
    silent! execute 'gg=G'
    silent! execute 'norm! `z'
    set formatprg=
endfunction

function! RemoveTrailingSpaces()
    silent! execute '%s/\s\+$//ge'
    silent! execute 'g/\v^$\n*%$/norm! dd'
endfunction

" Define a function to format the buffer, select all text, and copy it to the system clipboard
function! FormatAndCopyToClipboard()
    let save_cursor = getpos('.')
    %!astyle
    normal ggVG
    normal "+y
    call setpos('.', save_cursor)
    write
endfunction

" Comment/Uncomment selected text or line with Ctrl+/
function! ToggleComment()
    if mode() ==# 'v'
        '<,'>s/^/\<C-r>=CommentChar()<CR>/
    else
        s/^/\<C-r>=CommentChar()<CR>/
    endif
endfunction

" Set the comment character based on file type
function! CommentChar()
    if &filetype == 'python' || &filetype == 'sh' || &filetype == 'bash'
        return '# '
    elseif &filetype == 'c' || &filetype == 'cpp' || &filetype == 'java'
        return '// '
    elseif &filetype == 'html'
        return '<!-- '
    " Add other file types and comment styles as needed
    else
        return '# ' " Default to hash if file type is not detected
    endif
endfunction

" Map Ctrl + / to toggle comment for normal and visual mode
nnoremap <C-/> :call ToggleComment()<CR>
vnoremap <C-/> :call ToggleComment()<CR>

" Map Ctrl+A to execute the custom function in normal mode
nnoremap <C-a> :call FormatAndCopyToClipboard()<CR>

" Map Ctrl+A to execute the custom function in insert mode
inoremap <C-a> <C-o>:call FormatAndCopyToClipboard()<CR>

" Leader key mapping for common actions
let mapleader = "\<Space>"
noremap <Leader>b ^
noremap <Leader>e <ESC>:e .<CR>
noremap <Leader>r <C-R>
noremap <Leader>j <C-W><C-J>
nmap <leader>y ggVG"+y''
noremap <Leader>u i_<ESC>r
noremap <Leader>n :vs
noremap <Leader>q :q<CR>
noremap <Leader>o <C-O>
noremap <Leader>i <C-I>
noremap <Leader>a ggVG
noremap <Leader>/ 0i//<ESC>
noremap <Leader>s :source ~/.vimrc <CR>

" Custom commands for quick file navigation
command! Prog :e ~/Documents/programming/
command! SP :e ~/Documents/SPBU_SP_6_term/
command! Kek source ~/.vimrc
command! Gdb !g++ -std=c++17 -O0 -g -o %<

" General settings for Vim
set autoindent
set autoread
set cin
set expandtab
set guifont=Menlo\ Regular:h16
set history=1000
set hlsearch
set ignorecase
set incsearch
set mousehide
set noerrorbells
set noswapfile
set number
set pastetoggle=
set shiftwidth=4
set smarttab
set tabstop=4
set vb t_vb=
"set relativenumber

" Enable filetype detection and indentation
filetype on
filetype plugin on
autocmd FileType cpp setlocal makeprg=g\+\+\ %\ \-g\
" Prevent auto-commenting on new lines
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

