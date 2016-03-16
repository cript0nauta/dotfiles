if g:PluginIsInstalled('vim-airline')
    let g:airline_powerline_fonts = 0
    let g:airline_theme = 'bubblegum'
    let g:airline#extensions#whitespace#enabled = 0

    " to use fancy symbols for airline, uncomment the following lines and use a
    " patched font (more info on the README.rst)
    "if !exists('g:airline_symbols')
    "   let g:airline_symbols = {}
    "endif
    "let g:airline_left_sep = '⮀'
    "let g:airline_left_alt_sep = '⮁'
    "let g:airline_right_sep = '⮂'
    "let g:airline_right_alt_sep = '⮃'
    "let g:airline_symbols.branch = '⭠'
    "let g:airline_symbols.readonly = '⭤'
    "let g:airline_symbols.linenr = '⭡'
endif

