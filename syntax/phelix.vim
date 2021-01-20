if exists('b:current_syntax')
  finish
endif

" everything but: "():;[]{}
syn iskeyword 33,35-39,42-57,60-90,92,94-122,124,126

syn match   phxShebang '\%^#!.*$'
syn match   phxComment '#.*' contains=phxTodo

syn region  phxString start='"' end='"'
syn keyword phxString s/bytes s/chars s/split s/join s/slice s/up s/dn

syn match   phxBoolean 'true\|false\|[<>=]'

syn keyword phxRepeat while while* until times each each/i forever
syn keyword phxConditional if unless when when* cond
syn match   phxOperator '[-+*/%,.]\|<<\|>>\|\.\.'

syn keyword phxBuiltin ++ ->map ->vec -rot 2dup 2nip 2swap \\ argv bench call chr clear clone compose curry dip drop dup dupd e eval even? exit fun? getb getc in len map map? maxby nip nth num? odd? over pick pop print puts rand reject rev rot select sort source str? swap swapd tuck uniq v* vec? zip

syn keyword phxState f/read f/write sleep gets get put invert merge
syn match   phxState '<-'

syn keyword phxPrelude +- +1 -1 /% 0? 2bi 2bi* 2bi@ 2curry 2dip 2drop 2keep abs accumulate and bi bi* bi@ cart* cleave digits digits/b eq first flat1 keep last max min neg not or part prepose produce put* reduce replicate roll rotd sign tri update with xor zipwith

syn match   phxNumber '\<-\=\d\+\%(\.\d\+\)\=\>'

syn match   phxQuote '\'\k\+'
syn match   phxDefine '\k\+:'
syn match   phxDefine ';'

syn keyword phxTodo TODO XXX

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
hi link phxTodo Todo

function! CribHighlighting(new, group, attrs)
  let l:id = synIDtrans(hlID(a:group))
  exec 'hi ' . a:new . ' cterm=' . a:attrs . ' gui=' . a:attrs .
        \ ' ctermfg=' . synIDattr(l:id, 'fg', 'cterm') .
        \ ' guifg='   . synIDattr(l:id, 'fg', 'gui')
endfunction

call CribHighlighting('phxBuiltin', 'Identifier', 'bold')

let b:current_syntax = 'phelix'
