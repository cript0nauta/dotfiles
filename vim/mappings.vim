" Mappings relacionados a tabs
" TODO: invertir ^ y 0

" Mover (izquierda o derecha)
map tm :tabm 

" Abrir nueva pestaña
map tt :tabnew 

" Abrir en una nueva pestaña el buffer de la ventana actual
map ts :tab split<CR>

" Movimiento
map <C-S-Right> :tabn<CR>
imap <C-S-Right> <ESC>:tabn<CR>
map <C-S-Left> :tabp<CR>
imap <C-S-Left> <ESC>:tabp<CR>

" Habilitar/deshabilitar resultados de búsqueda resaltados
nnoremap <F4> :set hlsearch!

" Uso C-m para incrementar en vez de C-a (lo uso para tmux)
nnoremap <C-m> <C-a>

" Expandir %% a la ruta del directorio actual
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Buscar con Space y Ctril-Space para búsqueda hacia arriba
map <space> /
map <c-space> ?

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" TODO: Moverse entre ventanas/paneles

" Comment this line to enable autocompletion preview window
" (displays documentation related to the selected completion option)
" Disabled by default because preview makes the window flicker
" set completeopt-=preview

" Invertir : (para entrada de comandos) y ; (siguente coincidencia de la 
" búsqueda con f)
" Lo comento porque trae problemas con los mapping sin noremap
"nnoremap ; :
"nnoremap : ;


" =============================================================================
" mappings de plugins


" Mover las líneas con las flechas en el modo visual
" y duplicar con D
if PluginIsInstalled('dragvisuals.vim')
    vmap <expr> <UP> DVB_Drag('up')
    vmap <expr> <DOWN> DVB_Drag('down')
    vmap <expr> D DVB_Duplicate()
endif

if PluginIsInstalled('FixedTaskList.vim')
    map <F2> :TaskList<CR>
endif

if PluginIsInstalled('nerdtree')
    map <F3> :NERDTreeToggle<CR>
    nmap ,t :NERDTreeFind<CR>
endif

if PluginIsInstalled('ctrlp.vim')
    if PluginIsInstalled('vim-ctrlp-cmdpalette')
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

if PluginIsInstalled('python-mode')
    let g:pymode_rope_goto_definition_bind = ',d'
    nmap ,D :tab split<CR>:PymodePython rope.goto()<CR>
    nmap ,o :RopeFindOccurrences<CR>
endif

if PluginIsInstalled('tabman.vim')
    " mappings to toggle display, and to focus on it
    let g:tabman_toggle = 'tl'
    let g:tabman_focus  = 'tf' 
endif

if PluginIsInstalled('vim-choosewin')
    nmap - <Plug>(choosewin)
endif

if PluginIsInstalled('git-vim')
    nmap <Leader>gP :GitPush<CR>
endif

