let g:installed_plugins = map(copy(g:bundles), 'v:val.name')
function! g:PluginIsInstalled(plugin)
    return index(g:installed_plugins, a:plugin) != -1
endfunction

