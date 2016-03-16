if exists('g:bundles')
    let s:bundles = g:bundles
elseif exists('g:vundle#bundles')
    let s:bundles = g:vundle#bundles
else
    echo "No se pudieron obtener los plugins instalados."
endif
let g:installed_plugins = map(copy(s:bundles), 'v:val.name')
function! g:PluginIsInstalled(plugin)
    return index(g:installed_plugins, a:plugin) != -1
endfunction

