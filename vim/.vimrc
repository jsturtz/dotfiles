augroup NewFile
    autocmd!
    autocmd BufNewFile *.cpp 0r ~/.vim/templates/template.cpp
    autocmd BufNewFile *.tex 0r ~/.vim/templates/template.tex
augroup end

nnoremap <Space>m :update<CR>:call Make()<CR>

set tabstop=8 
set softtabstop=4 
set smarttab 
set expandtab
set shiftwidth=4

if has('nvim')
    set inccommand=nosplit
endif
set incsearch
set hlsearch
set ignorecase
set smartcase

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
set path&
let &path .= "**"

set wildignore+=*.swp,*.bak
set wildignore+=*.pyc,*.class,*.sln,*.Master,*.csproj.user,*.cache,*.dll,*.pdb,*.min.*,*.bundle.*
set wildignore+=*/.git/**/*
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.aux,*.log,*.fdb*,*.fls,*.synctex*

call plug#begin()

Plug 'lervag/vimtex'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'romainl/vim-tinyMRU'
Plug 'ervandew/supertab'
Plug 'w0rp/ale'
if executable('wal')
    Plug 'dylanaraps/wal'
endif

call plug#end()
if executable('wal')
    colorscheme wal
endif

function! Make()
    let curr_dir = expand('%:h')
    if curr_dir == ''
        let curr_dir = '.'
    endif
    echo curr_dir
    execute 'lcd ' . curr_dir execute 'make %:r'
    execute 'lcd -'
endfunction

" let g:vimtex_mappings_enabled = 0


" nnoremap <localleader>li <plug>(vimtex-info)
" nnoremap <localleader>lI <plug>(vimtex-info-full)
" nnoremap <localleader>lt <plug>(vimtex-toc-open)
" nnoremap <localleader>lT <plug>(vimtex-toc-toggle)
" nnoremap <localleader>ly <plug>(vimtex-labels-open)
" nnoremap <localleader>lY <plug>(vimtex-labels-toggle)
" nnoremap <localleader>lq <plug>(vimtex-log)
" nnoremap <localleader>lv <plug>(vimtex-view)
" nnoremap <localleader>lr <plug>(vimtex-reverse-search)
" nnoremap <localleader>ll <plug>(vimtex-compile)
" nnoremap <localleader>lL <plug>(vimtex-compile-selected)
" xnoremap <localleader>lL <plug>(vimtex-compile-selected)
" nnoremap <localleader>lk <plug>(vimtex-stop)
" nnoremap <localleader>lK <plug>(vimtex-stop-all)
" nnoremap <localleader>le <plug>(vimtex-errors)
" nnoremap <localleader>lo <plug>(vimtex-compile-output)
" nnoremap <localleader>lg <plug>(vimtex-status)
" nnoremap <localleader>lG <plug>(vimtex-status-all)
" nnoremap <localleader>lc <plug>(vimtex-clean)
" nnoremap <localleader>lC <plug>(vimtex-clean-full)
" nnoremap <localleader>lm <plug>(vimtex-imaps-list)
" nnoremap <localleader>lx <plug>(vimtex-reload)
" nnoremap <localleader>lX <plug>(vimtex-reload-state)
" nnoremap <localleader>ls <plug>(vimtex-toggle-main)
" nnoremap dse             <plug>(vimtex-env-delete)
" nnoremap dsc             <plug>(vimtex-cmd-delete)
" nnoremap ds$             <plug>(vimtex-env-delete-math)
" nnoremap dsd             <plug>(vimtex-delim-delete)
" nnoremap cse             <plug>(vimtex-env-change)
" nnoremap csc             <plug>(vimtex-cmd-change)
" nnoremap cs$             <plug>(vimtex-env-change-math)
" nnoremap csd             <plug>(vimtex-delim-change-math)
" noremap <F7>             <plug>(vimtex-cmd-create)
" inoremap ]]              <plug>(vimtex-delim-close)
" xnoremap ac              <plug>(vimtex-ac)
" xnoremap ic              <plug>(vimtex-ic)
" xnoremap ad              <plug>(vimtex-ad)
" xnoremap id              <plug>(vimtex-id)
" xnoremap ae              <plug>(vimtex-ae)
" xnoremap ie              <plug>(vimtex-ie)
" xnoremap a$              <plug>(vimtex-a$)
" xnoremap i$              <plug>(vimtex-i$)
" xnoremap aP              <plug>(vimtex-aP)
" xnoremap iP              <plug>(vimtex-iP)
" onoremap ac              <plug>(vimtex-ac)
" onoremap ic              <plug>(vimtex-ic)
" onoremap ad              <plug>(vimtex-ad)
" onoremap id              <plug>(vimtex-id)
" onoremap ae              <plug>(vimtex-ae)
" onoremap ie              <plug>(vimtex-ie)
" onoremap a$              <plug>(vimtex-a$)
" onoremap i$              <plug>(vimtex-i$)
" onoremap aP              <plug>(vimtex-aP)
" onoremap iP              <plug>(vimtex-iP)
" noremap %                <plug>(vimtex-%)
" noremap ]]               <plug>(vimtex-]])
" noremap ][               <plug>(vimtex-][)
" noremap []               <plug>(vimtex-[])
" noremap [[               <plug>(vimtex-[[)
" nnoremap K               <plug>(vimtex-doc-package)

let g:vimtex_view_method = 'zathura'
