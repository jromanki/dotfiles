" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Helps force plugins to load correctly when it is turned back on below.
filetype off

" TODO: Load plugins here (pathogen or vundle, we recommend vundle)

" Enable plugins and load plugin for the detected file type.
filetype plugin indent on

" Turn syntax highlighting on.
syntax on

" Highlight cursor line underneath the cursor horizontally.
"set cursorline

" Highlight cursor line underneath the cursor vertically.
"set cursorcolumn

" Set shift width to 4 spaces.
set shiftwidth=4

" Show line numbers.
set number

" Show file stats.
set ruler

" Blink cursor on error instead of beeping.
set visualbell

" Encoding.
set encoding=utf-8

" Security.
set modelines=0

" Show color column at 80 characters width, visual reminder of keepingcode line within a popular line width.
"set colorcolumn=80

"Wraps text instead of forcing a horizontal scroll
set wrap

"Reacts to the syntax/style of the code you are editing
set smartindent

"Makes sure that spaces are used for indenting lines, even when you press the "Tab" key
set expandtab

"This will insert 2 spaces for a line indent
set tabstop=2

"Manages the indentation when you use the ">>" or "<<" operators to add or remove indentation to an already existing line/block of code
set shiftwidth=2

"The previous commands can be combined into a single line
set tabstop=2 shiftwidth=2 expandtab

"Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" Allow hidden buffers.
set hidden

" Rendering.
set ttyfast

" Status bar.
set laststatus=2

"Show what mode you are currently editing in
set showmode

"Shows partial commands in the last line of the screen
set showcmd


" Optionally, customize the content of the status line
function! GitBranch()

  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")

endfunction



function! StatuslineGit()

  let l:branchname = GitBranch()

  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''

endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNum#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c

" Set the status line to be a specific color (background and foreground)
highlight StatusLine ctermfg=magenta ctermbg=black 
highlight StatusLineNC ctermfg=gray ctermbg=black 
highlight PmenuSel ctermbg=red guibg=red
highlight LineNum ctermbg=darkgray guibg=darkgray
highlight CursorColumn ctermbg=red guibg=red
highlight CursorColumn ctermfg=black guibg=black
