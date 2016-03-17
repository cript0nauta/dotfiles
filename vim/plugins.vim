" ============================================================================
" Vundle initialization
" Avoid modify this section, unless you are very sure of what you are doing

" no vi-compatible
set nocompatible

" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()



" ============================================================================
" Definir los plugins acá
"
" let Vundle manage Vundle
Plugin 'gmarik/vundle'

" Better file browser
Plugin 'scrooloose/nerdtree'

" Code and files fuzzy finder
Plugin 'kien/ctrlp.vim'

" Zen coding
Plugin 'mattn/emmet-vim'

" Git integration
Plugin 'motemen/git-vim'

" Class/module browser
Plugin 'majutsushi/tagbar'

" Airline
Plugin 'bling/vim-airline'

" Pending tasks list
Plugin 'fisadev/FixedTaskList.vim'

" Surround
Plugin 'tpope/vim-surround'

" Autoclose
Plugin 'Townk/vim-autoclose'

" Indent text object
" TODO: Probarlo
Plugin 'michaeljsmith/vim-indent-object'

" Python mode (indentation, doc, refactor, lints, code checking, motion and
" operators, highlighting, run and ipdb breakpoints)
" TODO: ver ventajas y desventajas
Plugin 'klen/python-mode'

" Better autocompletion
" TODO: ver los de fisa
Plugin 'Shougo/neocomplcache.vim'

" Snippets manager (ultisnips), dependencies, and snippets repo
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'
" TODO: datos de autor, github, etc
Plugin 'SirVer/ultisnips'

" Git/mercurial/others diff icons on the side of the file lines
Plugin 'mhinz/vim-signify'

" Drag visual blocks arround
Plugin 'fisadev/dragvisuals.vim'

Plugin 'scrooloose/syntastic'
" Paint css colors with the real color

" Paint css colors with the real color
Plugin 'lilydjwg/colorizer'

" Search results counter
"Plugin 'IndexedSearch'

" XML/HTML tags navigation
Plugin 'matchit.zip'

" TODO: ver qué onda
" Plugin 'pydocstring.vim'

" Colorscheme 
" Plugin 'altercation/vim-colors-solarized'
Plugin 'flazz/vim-colorschemes'

" Muy útil
" TODO: ver incsearch
Plugin 'easymotion/vim-easymotion'

" Repetir surrounding y otras cosas con .
Plugin 'tpope/vim-repeat'

" Comentar código
Plugin 'tpope/vim-commentary'

" Tomar notas en RestructuredText
" Funciona medio mal y es bastante intrusivo
" Además puede ser inseguro 
Plugin 'Rykka/riv.vim'
Plugin 'Rykka/InstantRst'
let g:instant_rst_localhost_only=1

" ============================================================================



call vundle#end()
" ============================================================================
" Install plugins the first time vim runs

if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :PluginInstall
endif

" ============================================================================

filetype plugin indent on

