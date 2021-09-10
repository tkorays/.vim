let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_ShowDevIcons = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
let g:Lf_WindowPosition = 'popup'
let g:Lf_PopupWidth=0.95
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "Fira_Code" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }
let g:Lf_WildIgnore = {
    \ 'dir': ['.clangd', '.git', '.codebase', '.idea', '.vscode', '.cache', 'tools', 'build', 'build_*', 'test'],
    \ 'file': ['*.so', '*.lib', '*.o', '*.exe']
    \}
" let g:Lf_CommandMap = {'<C-K>': ['<C-p>'], '<C-J>': ['<c-n>']}

