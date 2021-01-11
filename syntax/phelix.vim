if exists('b:current_syntax')
  finish
endif

setlocal isi+=/,',- isk+=/,',-

syn match   phxShebang '\%^#!.*$'
syn match   phxNumber '\<-\=\d\+\%(\.\d\+\)\=\>'
syn match   phxNumber '\.\.'
syn region  phxString start='"' end='"'

syn match   phxComment '#.*'

syn keyword phxBoolean true false
syn match phxBoolean '[<>=]'
syn keyword phxRepeat while until times each forever
syn keyword phxConditional if until cond
syn match phxOperator '[-+*/%]\|<<\|>>'

syn match   phxBuiltin '\.'
syn match   phxBuiltin '\[\]'
syn match   phxBuiltin '\\'

syn keyword phxBuiltin dup over nover pop swap rot
syn keyword phxBuiltin p _ len sort map select reject uniq zip max maxby juxt
syn keyword phxBuiltin call juxt
syn keyword phxBuiltin f/read f/write sleep
syn keyword phxBuiltin s/bytes s/split s/join s/slice s/up s/dn

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
hi link phxString String

let b:current_syntax = 'phelix'
