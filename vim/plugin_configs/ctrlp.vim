if PluginIsInstalled('ctrlp.vim')
    let g:ctrlp_map = ',e'

    function! CtrlPWithSearchText(search_text, ctrlp_command_end)
        execute ':CtrlP' . a:ctrlp_command_end
        call feedkeys(a:search_text)
    endfunction

    " don't change working directory
    let g:ctrlp_working_path_mode = 0
    " ignore these files and folders on file finder
    let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/](\.git|\.hg|\.svn)$',
      \ 'file': '\.pyc$\|\.pyo$',
      \ }
endfunction

