let g:zeus_server_job = v:null
let g:zeus_server_channel = v:null
let g:zeus_log_file = get(g:, 'zeus_log_file', '')

let s:zeus_channel_ready = v:false
let g:zeus_log_file = expand('~/zeus.log')

let s:channel_url = 'localhost:9876'

function! ZeusLog(...)
    if !empty(g:zeus_log_file)
        call writefile([strftime('%c') . ':' . json_encode(a:000)], g:zeus_log_file, 'a')
    endif
endfunction

function! StartZeusServerCallback(channel, msg)
    call ZeusLog('start zeus server success, connect to server...')

    let channel = ch_open(s:channel_url, {})
    if ch_status(channel) != 'open'
        call ZeusLog('server is not ready!')
        call popup_dialog('channel ' . s:channel_url . ' is not ready!', #{time: 3000})
        return 
    endif

    let g:zeus_server_channel = channel
    let s:zeus_channel_ready = v:true
    call ZeusLog('prepare server success')
endfunction

function! StartZeusServer()
    if !executable('python3')
        call ZeusLog('failed to start server:', 'python3 is not in the PATh')
        call popup_dialog('python3 is not in the PATH!', #{time: 3000})
        return 0
    endif

    " let script_path = fnamemodify(resolve(expand('<sfile>:p')),':h') . '/plugin/zeus.py'
    let script_path = '/Users/xujian/.vim/plugin/zeus.py'
    let job = job_start('python3 ' . script_path, #{callback: 'StartZeusServerCallback'})
    call ZeusLog('start job:', script_path)

    let g:zeus_server_job = job
    return 1 
endfunction

function! s:prepare_channel()
    let channel = ch_open(s:channel_url, {})

    let channel_status = ch_status(channel)
    if channel_status != 'open'
        let result = StartZeusServer()
        if result <= 0
            call popup_dialog('server start failed!', #{time: 3000})
            return 0
        endif
        return 1
    endif
    let s:zeus_channel_ready = v:true
    let g:zeus_server_channel = channel
    return 1 
endfunction

function ChannelMsgCallback(channel, msg)
    call ZeusLog('get a message ok!')
    call popup_dialog('warning:' . a:msg[1], #{time: 2000})
endfunction

function! jump#alternate()
    let result = s:prepare_channel()
    if result <= 0
        return
    endif

    if !s:zeus_channel_ready
        call popup_dialog('zeus channel is not ready, please try again!', #{time: 3000})
        return 
    endi

    if ch_status(g:zeus_server_channel) != 'open'
        g:zeus_server_channel = v:null
        call popup_dialog('zeus channel is not ready, please try again!', #{time: 3000})
        return
    endif

    let current_file = expand('%:p')
    call ch_sendexpr(g:zeus_server_channel, ['zeus', 'jump', current_file], #{callback: 'ChannelMsgCallback'})
endfunction

" map <silent><leader>xx :call jump#alternate()<CR>

