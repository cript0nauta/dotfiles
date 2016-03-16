if PluginIsInstalled('neocomplcache.vim')
    " most of them not documented because I'm not sure how they work
    " (docs aren't good, had to do a lot of trial and error to make 
    " it play nice)
    let g:neocomplcache_enable_at_startup = 1
    let g:neocomplcache_enable_ignore_case = 1
    let g:neocomplcache_enable_smart_case = 1
    let g:neocomplcache_enable_auto_select = 1
    let g:neocomplcache_enable_fuzzy_completion = 1
    let g:neocomplcache_enable_camel_case_completion = 1
    let g:neocomplcache_enable_underbar_completion = 1
    let g:neocomplcache_fuzzy_completion_start_length = 1
    let g:neocomplcache_auto_completion_start_length = 1
    let g:neocomplcache_auto_completion_start_length = 1
    let g:neocomplcache_manual_completion_start_length = 1
    let g:neocomplcache_min_keyword_length = 1
    let g:neocomplcache_min_syntax_length = 1
    " complete with workds from any opened file
    let g:neocomplcache_same_filetype_lists = {}
    let g:neocomplcache_same_filetype_lists._ = '_'
endif
