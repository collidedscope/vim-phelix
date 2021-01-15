if exists('b:current_syntax')
  finish
endif

setlocal isi+=/,',+,-,? isk+=/,',+,-,?

syn match   phxShebang '\%^#!.*$'
syn match   phxComment '#.*'

syn match   phxNumber '\<-\=\d\+\%(\.\d\+\)\=\>'
syn match   phxNumber '\.\.'

syn region  phxString start='"' end='"'
syn keyword phxString s/bytes s/chars s/split s/join s/slice s/up s/dn

syn match   phxBoolean 'true\|false\|[<>=]'

syn keyword phxRepeat while until times each forever
syn keyword phxConditional if cond
syn match   phxOperator '[-+*/%,.]\|<<\|>>'

syn match   phxBuiltin '\[\]\|{}'
syn match   phxBuiltin '\\'
syn keyword phxBuiltin dup 2dup over nover drop 2drop swap 2swap rot
syn keyword phxBuiltin p _ len sort map select reject uniq zip max maxby
syn keyword phxBuiltin call

syn keyword phxState f/read f/write sleep gets get put
syn match   phxState '<-'

syn match   phxQuote '\'\i\+'
syn match   phxDefine '\i\+:'
syn match   phxDefine ';'

hi link phxComment Comment
hi link phxBoolean Boolean
hi link phxBuiltin Identifier
hi link phxConditional Conditional
hi link phxOperator Operator
hi link phxDefine Function
hi link phxQuote Define
hi link phxNumber Number
hi link phxRepeat Repeat
hi link phxShebang PreProc
hi link phxState Type
hi link phxString String

let b:current_syntax = 'phelix'
