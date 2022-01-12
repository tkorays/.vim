
function! <SID>EasyJumpAlternateFile()
    let current_file = expand('%:p')
py3 << EOF
from vim import *
import os.path
a1 = ['.h', '.hpp', '.hxx', '.hh']
a2 = ['.c', '.cpp', '.cxx', '.cc']
f = vim.eval('current_file')
prefix, ext = os.path.splitext(f)

vim.command('let result = ""')
if str.lower(ext) in a1 or str.lower(ext) in a2:
    if str.lower(ext) in a2:
        a1, a2 = a2, a1
    for a in a2:
        if os.path.exists(prefix + a):
            vim.command('let result = "{}{}"'.format(prefix, a))
        elif os.path.exists(prefix + str.upper(a)):
            vim.command('let result = "{}{}"'.format(prefix, str.upper(a)))
EOF
    if result != ''
        let idx = bufnr(result)
        if idx != -1
            silent! execute ':b ' . idx
        else
            silent! execute ':e ' . result
        endif
    endif
endfunction


nnoremap <silent> <Plug>(vim-easyjump-alternatate-file) :call <SID>EasyJumpAlternateFile()<CR>

" autocmd FileType cpp map <silent><leader>xx <Plug>(vim-easyjump-alternatate-file)

