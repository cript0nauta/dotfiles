" Acá configuro los plugins que no necesitan configuraciones extensas

" autofocus on tagbar open
"
function! s:config_tagbar()
    let g:tagbar_autofocus = 1
endfunction

function! s:config_nerdtree()
    let NERDTreeIgnore = ['\.pyc$', '\.pyo$']
endfunction

function! s:config_vim_autoclose()
    " Fix to let ESC work as espected with Autoclose plugin
    let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}
endfunction

function! s:config_vim_signify()
    let g:signify_vcs_list = [ 'git' ]
endfunction

function! s:config_vim_choosewin()
    " show big letters
    let g:choosewin_overlay_enable = 1
endfunction


for plugin in g:installed_plugins 
    let funcname = 's:config_' . tolower(substitute(plugin, '[-\.]', '_', 'g'))
    if exists('*' . funcname)  " El asterisco indica que chequee si es una función
        execute "call " . funcname . "()"
    endif
endfor





