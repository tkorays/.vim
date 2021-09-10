let g:mdip_imgdir = 'images'
let g:mdip_imgname = 'IMG'
autocmd FileType markdown nnoremap <silent> <leader>img :call mdip#MarkdownClipboardImage()<CR>F%i

