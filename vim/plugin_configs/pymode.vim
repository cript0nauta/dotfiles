if g:PluginIsInstalled('python-mode')
    " Chequear el código con lint en cada write
    let g:pymode_lint_on_write = 1
    " let g:pymode_lint_on_fly = 1
    let g:pymode_lint_signs = 0

    " don't fold python code on open
    let g:pymode_folding = 1

    " don't load rope by default. Change to 1 to use rope
    let g:pymode_rope = 0

    " open definitions on same window, and custom mappings for definitions and
    " occurrences
    let g:pymode_rope_goto_definition_cmd = 'e'

    " Usar también lint
    let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe', 'pylint']
endif
