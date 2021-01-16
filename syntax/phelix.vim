if exists('b:current_syntax')
  finish
endif

" everything but: "():;
syn iskeyword 33,35-39,42-57,60-126

syn match   phxShebang '\%^#!.*$'
syn match   phxComment '#.*'

syn region  phxString start='"' end='"'
syn keyword phxString s/bytes s/chars s/split s/join s/slice s/up s/dn

syn match   phxBoolean 'true\|false\|[<>=]'

syn keyword phxRepeat while while* until times each each/i forever
syn keyword phxConditional if unless when when* cond
syn match   phxOperator '[-+*/%,.]\|<<\|>>\|\.\.'

syn match   phxBuiltin '\<\[]\>' " [] has significance in syn-keyword
syn keyword phxBuiltin ++ -rot 2dup 2swap \\ argv call clear clone compose curry dip drop dup e eval even? exit in len map maxby nip nth odd? over pick pop puts reject rot select sort source swap swapd tuck uniq v* zip {}

syn keyword phxState f/read f/write sleep gets get put invert merge
syn match   phxState '<-'

syn keyword phxPrelude +- 2bi 2bi* 2bi@ 2curry 2dip 2drop 2keep accumulate and bi bi* bi@ cleave eq first keep last not or part prepose produce reduce replicate roll rotd tri with xor

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
