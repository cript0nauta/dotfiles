if g:PluginIsInstalled('syntastic')
    " show list of errors and warnings on the current file
    nmap <leader>e :Errors<CR>

    " check also when just opened the file
    let g:syntastic_check_on_open = 1

    " don't put icons on the sign column (it hides the vcs status icons of signify)
    let g:syntastic_enable_signs = 0

    " custom icons (enable them if you use a patched font, and enable the previous 
    " setting)
    "let g:syntastic_error_symbol = '✗'
    "let g:syntastic_warning_symbol = '⚠'
    "let g:syntastic_style_error_symbol = '✗'
    "let g:syntastic_style_warning_symbol = '⚠'
endif
