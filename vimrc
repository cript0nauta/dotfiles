" Instalación y configuración de plugins y su gestor {{{
let g:using_nix_config = exists('g:using_nix_config')

" Inicializar vundle (si no se está usando nix) {{{
if !g:using_nix_config
    " Avoid modify this section, unless you are very sure of what you are doing

    " no vi-compatible
    set nocompatible

    " Setting up Vundle - the vim plugin bundler
    let iCanHazVundle=1
    let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
    if !filereadable(vundle_readme)
        echo "Installing Vundle..."
        echo ""
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
        let iCanHazVundle=0
    endif

    filetype off
    set rtp+=~/.vim/bundle/vundle/
    call vundle#begin()
else
    function! Nop()
    endfunction
    command -nargs=* Plugin :call Nop()
    command -nargs=* Bundle :call Nop()
endif
" }}}
" Definir los plugins acá {{{
"
" let Vundle manage Vundle {{{
Plugin 'gmarik/vundle'
" }}}
" Better file browser: nerdtree {{{
Plugin 'scrooloose/nerdtree'
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']
" }}}
" " ctrlp: Code and files fuzzy finder {{{
" Plugin 'kien/ctrlp.vim'
" let g:ctrlp_map = ',e'

" function! CtrlPWithSearchText(search_text, ctrlp_command_end)
"     execute ':CtrlP' . a:ctrlp_command_end
"     call feedkeys(a:search_text)
" endfunction

" " don't change working directory
" let g:ctrlp_working_path_mode = 0
" " ignore these files and folders on file finder
" let g:ctrlp_custom_ignore = {
"   \ 'dir':  '\v[\/](\.git|\.hg|\.svn)$',
"   \ 'file': '\.pyc$\|\.pyo$',
"   \ }
" " }}}
" FZF (alternativa a ctrlp) {{{
Plugin 'junegunn/fzf.vim'
nmap ,e :GFiles<CR>
nmap ,E :Files<CR>
nmap ,b :Buffers<CR>
nmap ,m :History<CR>
nmap ,h :History:<CR>
nnoremap <F5> :ALEToggle<CR>
" }}}
" Zen coding {{{
Plugin 'mattn/emmet-vim'
" }}}
" Git integration {{{
" TODO: ver el de tpope que parece mejor
Plugin 'motemen/git-vim'
" }}}
" Class/module browser {{{
Plugin 'majutsushi/tagbar'
let g:tagbar_autofocus = 1
" }}}
" Airline {{{
" Plugin 'bling/vim-airline'
" let g:airline_powerline_fonts = 0
" let g:airline_theme = 'bubblegum'
" let g:airline#extensions#whitespace#enabled = 0
" " to use fancy symbols for airline, uncomment the following lines and use a
" " patched font (more info on the README.rst)
" "if !exists('g:airline_symbols')
" "   let g:airline_symbols = {}
" "endif
" "let g:airline_left_sep = '⮀'
" "let g:airline_left_alt_sep = '⮁'
" "let g:airline_right_sep = '⮂'
" "let g:airline_right_alt_sep = '⮃'
" "let g:airline_symbols.branch = '⭠'
" "let g:airline_symbols.readonly = '⭤'
" "let g:airline_symbols.linenr = '⭡'
" }}}
" Powerline {{{
Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
" }}}
" Pending tasks list {{{
Plugin 'fisadev/FixedTaskList.vim'
" }}}
" Surround {{{
Plugin 'tpope/vim-surround'
" }}}
" " Autoclose {{{
" Plugin 'Townk/vim-autoclose'
" " Fix to let ESC work as espected with Autoclose plugin
" let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}
" " }}}
" Indent text object {{{
Plugin 'michaeljsmith/vim-indent-object'
" }}}
" Python mode  {{{
" (indentation, doc, refactor, lints, code checking, motion and
" operators, highlighting, run and ipdb breakpoints)
Plugin 'klen/python-mode'
" Uso python 3 por defecto
let g:python_version = 'python3'
" Chequear el código con lint en cada write
let g:pymode_lint_on_write = 0
" let g:pymode_lint_on_fly = 1
let g:pymode_lint_signs = 0

" don't fold python code on open
let g:pymode_folding = 0

" cargo rope para tener un autocompletado excelente
" lo comento porque parece no se para nada excelente
" let g:pymode_rope = 1
let g:pymode_rope = 0
let g:pymode_rope_complete_on_dot = 0  " Esto rompe todo!

" open definitions on same window, and custom mappings for definitions and
" occurrences
let g:pymode_rope_goto_definition_cmd = 'e'

" Usar también lint y pep257
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe', 'pylint', 'pep257']
" }}}
" {{{ ALE (linter tipo syntastic)
Plugin 'w0rp/ale'
let g:ale_fixers = {
\   'python': ['yapf'],
\}
" }}
" Autocompletado inteligente  {{{
" Plugin 'Shougo/neocomplete.vim'
" let g:neocomplete#enable_at_startup = 1 " Cargar al inicio
" y snippets para este
" Plugin 'Shougo/neosnippet'
" Plugin 'Shougo/neosnippet-snippets'
" }}}
" Snippets manager (ultisnips), dependencies, and snippets repo {{{
Plugin 'honza/vim-snippets'
" TODO: datos de autor, github, etc
Plugin 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" }}}
" Mostrar diffs de git y otros VCSs a la izquieda de los números de línea {{{
Plugin 'mhinz/vim-signify'
let g:signify_vcs_list = [ 'git' ]
" }}}
" Drag visual blocks arround {{{
Plugin 'fisadev/dragvisuals.vim'
" }}}
" Code checker, lo desactivo porque tengo pymode {{{
" Plugin 'scrooloose/syntastic'
" " show list of errors and warnings on the current file
" nmap <leader>e :Errors<CR>

" " check also when just opened the file
" let g:syntastic_check_on_open = 1

" " don't put icons on the sign column (it hides the vcs status icons of signify)
" let g:syntastic_enable_signs = 0
" }}}
" " Paint css colors with the real color {{{
" Desactivado porque es muy lento en archivos grandes como los de ayuda. TODO:
" activar solo para ciertos ficheros, evitar bindear en BufEnter
" Plugin 'lilydjwg/colorizer'
" " }}}
" Search results counter {{{
"Plugin 'IndexedSearch'
" }}}
" XML/HTML tags navigation {{{
Plugin 'matchit.zip'
" }}}
" Pydocstring {{{
" TODO: ver qué onda
" Plugin 'pydocstring.vim'
" }}}
" Colorschemes {{{
" Plugin 'altercation/vim-colors-solarized'
Plugin 'flazz/vim-colorschemes'
Plugin 'chriskempson/base16-vim'
let base16colorspace=256
" }}}
" Muy útil para moverse mejor {{{
" TODO: ver incsearch
Plugin 'easymotion/vim-easymotion'
" }}}
" Repetir surrounding y otras cosas con . {{{
Plugin 'tpope/vim-repeat'
" }}}
" Comentar código {{{
Plugin 'tpope/vim-commentary'
" }}}
" Soporte para ledger {{{
Plugin 'ledger/vim-ledger'
let g:ledger_maxwidth = 80
" }}}
" Soporte para Elm {{{
" Plugin 'lambdatoast/elm.vim'
Plugin 'elmcast/elm-vim'
" }}}
" Soporte para Ack {{{
Plugin 'mileszs/ack.vim'
" }}}
" " Tomar notas en RestructuredText {{{
" " Funciona medio mal y es bastante intrusivo
" " Además puede ser inseguro 
" Plugin 'Rykka/riv.vim'
" Plugin 'Rykka/InstantRst'
" let g:instant_rst_localhost_only=1
" " }}}
" }}}
Plugin 'LnL7/vim-nix'
" Finalizo definición de plugins {{{
if !g:using_nix_config
    call vundle#end()
endif
" ============================================================================
" Install plugins the first time vim runs

if !g:using_nix_config
    if iCanHazVundle == 0
        echo "Installing Bundles, please ignore key map error messages"
        echo ""
        :PluginInstall
    endif
endif
filetype plugin indent on
" }}}

" }}}
" Variables y funciones comunes {{{

if exists('g:bundles')
    let s:bundles = g:bundles
elseif exists('g:vundle#bundles')
    let s:bundles = g:vundle#bundles
elseif g:using_nix_config
    " No requerido
    let s:bundles = []
else
    echo "No se pudieron obtener los plugins instalados."
    let s:bundles = []
endif
let g:installed_plugins = map(copy(s:bundles), 'v:val.name')
function! g:PluginIsInstalled(plugin)
    return g:using_nix_config || index(g:installed_plugins, a:plugin) != -1
endfunction

" }}}
" Configuración de plugins (viejo) {{{
" set rtp+=~/dotfiles/vim
" runtime! plugin_configs/*.vim
" }}}
" Opciones del editor {{{

" allow plugins by file type (required for plugins!) {{{
filetype plugin on
" }}}
" tabs and spaces handling {{{
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
" }}}
" always show status bar {{{
set ls=2
" }}}
" Mostrar resultados de búsqueda a medida que se introduce el patrón {{{
set incsearch
" }}}
" syntax highlight on {{{
syntax on
" }}}
" show line numbers {{{
set number
" }}}
" mostrar números de línea relativos a la posición del cursor {{{
set relativenumber
" }}}
" when scrolling, keep cursor 3 lines away from screen border {{{
set scrolloff=3
" }}}
" Habilitar uso del mouse  {{{
set mouse=a
" }}}
" autocompletion of files and commands behaves like shell {{{
" (complete only the common part, list the options that match)
" TODO: chequar alternativas
set wildmode=list:longest 
" }}}
" better backup, swap and undos storage {{{
set directory=~/.vim/dirs/tmp     " directory to place swap files in
set backup                        " make backup files
set backupdir=~/.vim/dirs/backups " where to put backup files
set undofile                      " persistent undos - undo after you re-open the file
set undodir=~/.vim/dirs/undos
"set viminfo+=n~/.vim/dirs/viminfo
set viminfo='100,<50,s10,h,n~/.vim/dirs/viminfo
" }}}
" Tamaño del historial  {{{
set history=500 
" }}}
" No foldear al abrir un archivo con folds (comentado) {{{
" set foldlevelstart=99
" }}}
" create needed directories if they don't exist {{{
if !isdirectory(&backupdir)
    call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
    call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
endif
" }}}
" Timeout para mappings y otros {{{
set timeoutlen=300
" }}}
" Smart case en las búsquedas{{{
set ignorecase
" Si el patrón de búsqueda contiene mayúsculas -> set noignorecase temporal
set smartcase
" }}}

" }}}
" Defino comandos útiles {{{
" save as sudo {{{
cabbrev w!! w !sudo tee "%"
" }}}
" }}}
" Mappings {{{

" Mappings relacionados a pestañas {{{

" Mover (izquierda o derecha)
map tm :tabm 

" Abrir nueva pestaña
map tt :tabnew 

" Abrir en una nueva pestaña el buffer de la ventana actual
map ts :tab split<CR>

" Vertical split
map ,s :only<CR>:vs<CR><C-l>

" Movimiento
map <C-S-Right> :tabn<CR>
imap <C-S-Right> <ESC>:tabn<CR>
map <C-S-Left> :tabp<CR>
imap <C-S-Left> <ESC>:tabp<CR>
" }}}
" Habilitar/deshabilitar resultados de búsqueda resaltados {{{
nnoremap <F4> :set hlsearch!<CR>
" }}}
" Uso C-m para incrementar en vez de C-a (lo uso para tmux) {{{
nnoremap <C-m> <C-a>
" }}}
" Invertir ^ y 0 {{{
nnoremap ^ 0
nnoremap 0 ^
" }}}
" Expandir %% a la ruta del directorio actual {{{
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
" }}}
" Abrir/cerrar folds con <Space> {{{
nmap <space> za
" }}}
" Mejor forma de moverse entre ventanas {{{
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" }}}
" Algún plugin mapea la tecla enter en modo normal a C-a, quito esto {{{
unmap <CR>
" }}}
" Invertir "" y "+ {{{
" Uso bastante la función de usar el registro del clipboard ("+). Si a los
" mappings que los utilizan no se les pasa ningún registro utilizan el unnamed
" ("") por lo que es poco probable que lo utilice de forma explícita.
" También mapeo "' a "* (el registro del clipboard de X11)
nnoremap "" "+
nnoremap "+ ""
vnoremap "" "+
vnoremap "+ ""
" }}}

" Comment this line to enable autocompletion preview window
" (displays documentation related to the selected completion option)
" Disabled by default because preview makes the window flicker
" set completeopt-=preview

" mappings de plugins {{{

" Mover las líneas con las flechas en el modo visual {{{
" y duplicar con D
if g:PluginIsInstalled('dragvisuals.vim')
    vmap <expr> <UP> DVB_Drag('up')
    vmap <expr> <DOWN> DVB_Drag('down')
    vmap <expr> D DVB_Duplicate()
endif
" }}}
" Mapea F2 a lista de TODOs {{{
if g:PluginIsInstalled('FixedTaskList.vim')
    map <F2> :TaskList<CR>
endif
" }}}
" ,t y F3 para nerdtree {{{
if g:PluginIsInstalled('nerdtree')
    map <F3> :NERDTreeToggle<CR>
    nmap ,t :NERDTreeFind<CR>
endif
" }}}
" Mappings generales de ctrlp {{{
if g:PluginIsInstalled('ctrlp.vim')
    if g:PluginIsInstalled('vim-ctrlp-cmdpalette')
        " commands finder mapping
        nmap ,c :CtrlPCmdPalette<CR>
    endif

    " tags (symbols) in current file finder mapping
    nmap ,g :CtrlPBufTag<CR>

    " tags (symbols) in all files finder mapping
    nmap ,G :CtrlPBufTagAll<CR>

    " general code finder in all files mapping
    nmap ,f :CtrlPLine<CR>

    " recent files finder mapping
    nmap ,m :CtrlPMRUFiles<CR>

    " buffer finder 
    nmap ,b :CtrlPBuffer<CR>

    " same as previous mappings, but calling with current word as default text
    nmap ,wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
    nmap ,wG :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
    nmap ,wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
    nmap ,we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
    nmap ,pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
    nmap ,wm :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<CR>
    nmap ,wc :call CtrlPWithSearchText(expand('<cword>'), 'CmdPalette')<CR>
endif
" }}}
" Mappings de python mode {{{
if g:PluginIsInstalled('python-mode')
    let g:pymode_rope_goto_definition_bind = ',d'
    nmap ,D :tab split<CR>:PymodePython rope.goto()<CR>
    nmap ,o :RopeFindOccurrences<CR>
endif
" }}}
" Mappings de tabman {{{
if g:PluginIsInstalled('tabman.vim')
    " mappings to toggle display, and to focus on it
    let g:tabman_toggle = 'tl'
    let g:tabman_focus  = 'tf' 
endif
" }}}
" Mapeo - a choosewin (si está instalado {{{
if g:PluginIsInstalled('vim-choosewin')
    nmap - <Plug>(choosewin)
endif
" }}}
" Mapeo \gP para push en git vim (no está en los default bindings) {{{
if g:PluginIsInstalled('git-vim')
    nmap <Leader>gP :GitPush<CR>
endif
" }}}
"
" }}}

" }}}
" Autocmds {{{
" tab length exceptions on some file types {{{
"autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
"autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
"autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
" }}}
" Settings locales para el vimrc {{{
augroup VimrcSettings
    autocmd!
    autocmd BufRead $MYVIMRC,vimrc setlocal foldmethod=marker
    " " Re-sourcear al guardar (no funciona muy bien)
    " autocmd BufWritePost $MYVIMRC,vimrc source $MYVIMRC
augroup END
" }}}
" Si no existe el directorio de un fichero preguntar por su creación {{{
" TODO: creo que no funciona
function! EnsureDirExists ()
    let required_dir = expand("%:h")
    if !isdirectory(required_dir)
        call AskQuit("Parent directory '" . required_dir . "' doesn't exist.",
             \       "&Create it\nor &Quit?", 2)

        try
            call mkdir( required_dir, 'p' )
        catch
            call AskQuit("Can't create '" . required_dir . "'",
            \            "&Quit\nor &Continue anyway?", 1)
        endtry
    endif
endfunction
augroup AutoMkdir
    autocmd!
    autocmd  BufNewFile  *  :call EnsureDirExists()
augroup END
" }}}
" Mostrar páginas de ayuda en una nueva pestaña {{{

let g:help_in_tabs = 1

"Only apply to .txt files...
augroup HelpInTabs
    autocmd!
    autocmd BufEnter  *.txt   call HelpInNewTab()
augroup END

"Only apply to help files...
function! HelpInNewTab ()
    if &buftype == 'help' && g:help_in_tabs && !(exists('t:help_in_tab') && t:help_in_tab)
        "Convert the help window to a tab...
        execute "normal \<C-W>T"
    endif
endfunction
" }}}
" Uso los .hbs como html {{{
" TODO: Buscar plugins que lo manejen
augroup EmberHBS
    autocmd!
    autocmd BufRead *.hbs set ft=html
augroup end
" }}}

" }}}
" Apariencia {{{

" Setear colorscheme. usar 256 colores cuando sea posible{{{
if &term =~? 'mlterm\|xterm\|xterm-256\|screen-256'
	let &t_Co = 256
    set background=dark
    colorscheme Tomorrow-Night
else
    colorscheme delek
endif
" }}}

" Descomentar si se quiere usar un tema especial si 
" se está usando gvim
" if has('gui_running')
"     colorscheme wombat
" endif
" Custom highlight para signify {{{
if g:PluginIsInstalled('vim-signify')
    highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
    highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
    highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
    highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
    highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
    highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227
endif
" }}}

" }}}
