let mapleader="\<space>"

" easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

nmap <leader>nn :NERDTreeToggle<CR>
nmap <leader>nc :NERDTreeFind %<CR>
nmap <Leader>t :TagbarToggle<CR>
nmap <Leader>s :A<CR>
nmap <Leader>q :q<CR>
nmap <Leader>Q :qa<CR>
nmap <Leader>w :w<CR>
nmap <Leader>z <C-w><C-w>
nmap <Leader>p :read !pbpaste<CR>

let g:Lf_ShortcutF = '<leader>f'
let g:Lf_FollowLinks = 1
nmap <Leader>b :LeaderfBuffer<CR>
nmap <Leader>lm :LeaderfFunction<CR>
nmap <Leader>lt :LeaderfBufTag<CR>
nmap <Leader>lu :LeaderfMru<CR>
nmap <Leader>ll :LeaderfLine<CR>
nmap <leader>ls :Leaderf! rg -F -e ""
nn <Leader>lb :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
nn <Leader>lg :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
xnoremap fg :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>

nn <Leader>cq :cclose<CR>
nn <Leader>al :ALELint<CR>

" easymotion jump
nmap <Leader><Leader>s <Plug>(easymotion-s2)

nn <silent> <leader>gd :ALEDetail<cr>
nn <silent> <leader>gmm [m
nn <silent> <leader>gme ]M
nn <silent> <leader>gj :ALENext<CR>
nn <silent> <leader>gk :ALEPrevious<CR>

nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gs :G<CR>

" gtest
autocmd FileType cpp nnoremap <silent> <leader>rt :GTestRun<CR>
autocmd FileType cpp nnoremap <silent> <leader>ru :GTestRunUnderCursor<CR>

nmap <silent><nowait><space>dn <Plug>VimspectorStepOver
nmap <A-n> <Plug>VimspectorStepOver
nmap <silent><nowait><space>db <Plug>VimspectorToggleBreakpoint
nmap <A-b> <Plug>VimspectorToggleBreakpoint
nmap <silent><nowait><space>ds <Plug>VimspectorContinue
nmap <silent><nowait><space>dr <Plug>VimspectorRestart
nmap <silent><nowait><space>dp <Plug>VimspectorPause
nmap <silent><nowait><space>dt <Plug>VimspectorStop
nmap <silent><nowait><space>df <Plug>VimspectorAddFunctionBreakpoint
nmap <silent><nowait><space>dc <Plug>VimspectorToggleConditionalBreakpoint
nmap <silent><nowait><space>do <Plug>VimspectorStepOut
nmap <A-o> <Plug>VimspectorStepOut
nmap <silent><nowait><space>di <Plug>VimspectorStepInto
nmap <A-i> <Plug>VimspectorStepInto
nmap <silent><nowait><space>dq <Plug>VimspectorReset<CR>
nmap <silent><nowait><space>dlc <Plug>VimspectorShowOutput Console<CR>
nmap <silent><nowait><space>dld <Plug>VimspectorShowOutput stderr<CR>
nmap <silent><nowait><space>dlo <Plug>VimspectorShowOutput Vimspector-out<CR>
nmap <silent><nowait><space>dle <Plug>VimspectorShowOutput Vimspector-err<CR>
nmap <silent><nowait><space>dls <Plug>VimspectorShowOutput server<CR>
nmap <silent><nowait><space>dlt <Plug>VimspectorShowOutput Telemetry<CR>
nmap <silent><nowait><space>de :<C-u>VimspectorEval<space>
nmap <silent><nowait><space>dw :<C-u>VimspectorWatch<space>

" coc
nmap <silent> ga <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gh :call CocActionAsync('doHover')<cr>
nmap <silent> gc :call CocLocations('ccls','$ccls/call')<cr>
nmap <silent> gC :call CocLocations('ccls','$ccls/call',{'callee':v:true})<cr>
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>x :CocFix<CR>

nmap <silent>gb :Git blame<CR>


