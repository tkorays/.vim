function! utils#source(root, name, ...)
    execute 'source' fnameescape(resolve(a:root . '/' . a:name . '.vim'))
endfunction

