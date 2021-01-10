if did_filetype() | finish | endif
fun! s:detectPhelix()
    if getline(1) =~# '^#!.*phelix\>' | setlocal filetype=phelix | endif
endfun

autocmd BufNewFile,BufRead *.phx setlocal filetype=phelix
autocmd BufNewFile,BufRead * call s:detectPhelix()
autocmd FileType phelix set commentstring=#%s
