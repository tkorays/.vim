let g:ale_cpp_ccls_init_options = {
    \   'cache': {
    \       'directory': '/tmp/ccls/cache'
    \   }
    \ }
let g:ale_set_quick_fix = 1
let g:ale_open_list = 1
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_change = 0
let g:ale_lint_on_save = 0
let g:ale_cpp_cpplint_executable = "cpplint"
let g:ale_cpp_cpplint_options = '--linelength=120 --filter="-legal/copyright"'
" lint: clangd, clang-tidy
let g:ale_linters = {
    \   'cpp': ['cpplint'],
    \   'c': ['cpplint'],
    \   'python': ['pylint'],
    \}
let g:ale_fixers = {
    \ 'cpp': ['clang-format'],
    \}
let g:ale_completion_enabled = 0
let g:ale_sign_error = '✗'
" let g:ale_sign_warning = '⚡'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_enter = 0
let g:ale_cpp_clangd_executable = '/usr/local/Cellar/llvm/11.1.0/bin/clangd'

