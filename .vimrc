" Basic settings
set number              " Show line numbers
set tabstop=4           " Set the width of a tab character
set shiftwidth=4        " Set the number of spaces to use for autoindent
set expandtab           " Convert tabs to spaces
set autoindent          " Enable automatic indentation
set smartindent         " Enable smart indentation

" Colorscheme
syntax on               " Enable syntax highlighting
colorscheme desert      " Default colorscheme; you can replace it with your preferred one

" Better search
set hlsearch            " Highlight search results
set incsearch           " Show incremental search matches
set ignorecase          " Case-insensitive search
set smartcase           " Case-sensitive if uppercase is used in search

" Quality of life improvements
set cursorline          " Highlight the current line
set wrap                " Enable line wrapping
set showcmd             " Show incomplete commands in the status bar
set wildmenu            " Enhanced command-line completion
set backspace=indent,eol,start " Make backspace behave in a more intuitive way
set clipboard=unnamedplus " Use system clipboard

" Optional UI enhancements (if supported)
set relativenumber      " Show relative line numbers
set ruler               " Show cursor position
set laststatus=2        " Always show the status line
