if exists('b:current_syntax')
  finish
endif

syn iskeyword 48-57,64-90,97-122,+,-,*,/,?,',$,_

syn match   phxShebang '\%^#!.*$'
syn match   phxComment '#.*'

syn region  phxString start='"' end='"'
syn keyword phxString s/bytes s/chars s/split s/join s/slice s/up s/dn

syn match   phxBoolean 'true\|false\|[<>=]'

syn keyword phxRepeat while while* until times each each/i forever
syn keyword phxConditional if unless when when* cond
syn match   phxOperator '[-+*/%,.]\|<<\|>>\|\.\.'

syn match   phxBuiltin '\[\]\|{}'
syn match   phxBuiltin '\\'
syn keyword phxBuiltin dup 2dup over drop swap 2swap rot -rot dip
syn keyword phxBuiltin p _ len sort map select reject uniq zip max maxby
syn keyword phxBuiltin call

syn keyword phxState f/read f/write sleep gets get put invert merge
syn match   phxState '<-'

syn keyword phxPrelude 2drop keep bi tri 2curry with cleave
syn keyword phxPrelude 2dip 2keep 2bi +- first last part rotd roll

syn match   phxNumber '\<-\=\d\+\%(\.\d\+\)\=\>'

syn match   phxQuote '\'\k\+'
syn match   phxDefine '\k\+:'
syn match   phxDefine ';'

hi link phxComment Comment
hi link phxBoolean Boolean
hi link phxPrelude Identifier
hi link phxConditional Conditional
hi link phxOperator Operator
hi link phxDefine Function
hi link phxQuote Define
hi link phxNumber Number
hi link phxRepeat Repeat
hi link phxShebang PreProc
hi link phxState Type
hi link phxString String

function! CribHighlighting(new, group, attrs)
  let l:id = synIDtrans(hlID(a:group))
  exec 'hi ' . a:new . ' cterm=' . a:attrs . ' gui=' . a:attrs .
        \ ' ctermfg=' . synIDattr(l:id, 'fg', 'cterm') .
        \ ' guifg='   . synIDattr(l:id, 'fg', 'gui')
endfunction

call CribHighlighting('phxBuiltin', 'Identifier', 'bold')

let b:current_syntax = 'phelix'
