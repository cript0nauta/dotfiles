syntax match jrnlTag /@\w*/
syntax match jrnlDate /\d\d\d\d-\d\d-\d\d \d\d:\d\d/
syntax region jrnlString start=/^\s*"/ end=/"/

highlight link jrnlTag Constant
highlight link jrnlDate Error
highlight link jrnlString Comment
