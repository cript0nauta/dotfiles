" use 256 colors when possible
if &term =~? 'mlterm\|xterm\|xterm-256\|screen-256'
	let &t_Co = 256
    " set background=dark
    " colorscheme solarized
    colorscheme delek
else
    colorscheme delek
endif

" Descomentar si se quiere usar un tema especial si 
" se está usando gvim
" if has('gui_running')
"     colorscheme wombat
" endif

if PluginIsInstalled('vim-signify')
    highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
    highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
    highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
    highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
    highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
    highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227
endif

