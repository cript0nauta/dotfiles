" allow plugins by file type (required for plugins!)
filetype plugin on

" tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" tab length exceptions on some file types
"autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
"autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
"autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2

" always show status bar
set ls=2

" incremental search
" TODO: Documentar qué es esto
set incsearch

" syntax highlight on
syntax on

" show line numbers
set number

" mostrar números de línea relativos a la posición del cursor
set relativenumber

" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3

" Habilitar uso del mouse 
set mouse=a

" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
" TODO: chequar alternativas
set wildmode=list:longest 

" better backup, swap and undos storage
set directory=~/.vim/dirs/tmp     " directory to place swap files in
set backup                        " make backup files
set backupdir=~/.vim/dirs/backups " where to put backup files
set undofile                      " persistent undos - undo after you re-open the file
set undodir=~/.vim/dirs/undos
"set viminfo+=n~/.vim/dirs/viminfo
set viminfo='100,<50,s10,h,n~/.vim/dirs/viminfo

" Tamaño del historial 
set history=500 

" No foldear al abrir un archivo con folds 
" set foldlevelstart=99

" TODO: timeout
" TODO: search case

" create needed directories if they don't exist
if !isdirectory(&backupdir)
    call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
    call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
endif




