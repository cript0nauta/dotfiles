" Uso <Leader>h para mostrar la página de ayuda de la función
nmap <buffer> <localleader>h :execute "help " . expand('<cword>') . '()'<cr>
