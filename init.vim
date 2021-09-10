
let g:vimrc_root_dir = fnamemodify(resolve(expand('<sfile>:p')),':h').'/'

call utils#source(g:vimrc_root_dir, 'rc/basic')
call utils#source(g:vimrc_root_dir, 'rc/filetype')
call utils#source(g:vimrc_root_dir, 'rc/plugins')
call utils#source(g:vimrc_root_dir, 'rc/ui')
call utils#source(g:vimrc_root_dir, 'rc/keymap')
