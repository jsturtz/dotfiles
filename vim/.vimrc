augroup NewFile
    autocmd!
    autocmd BufNewFile *.cpp 0r ~/.vim/templates/template.cpp
    autocmd BufNewFile *.tex 0r ~/.vim/templates/template.tex
augroup end

set tabstop=8 
set softtabstop=4 
set smarttab 
set expandtab
set shiftwidth=4

set number
set relativenumber

set statusline=
set statusline+=\ %{expand('%~:.')}
set statusline+=\ %m
set statusline+=%=
set statusline+=%{strlen(&ft)?&ft:'none'}\ \|
set statusline+=\ %{&fileformat}\ \  
set statusline+=\ (%l,\ %c:\%P\ \  
set laststatus=2

set hidden
set viminfo='1025,f1,%1024

call plug#begin()

Plug 'lervag/vimtex'
Plug 'tpope/vim-commentary'

call plug#end()

let g:vimtex_view_method = 'zathura'
