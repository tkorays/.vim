let g:zeus_server_job = 0 
let g:zeus_server_channel = 0


function! StartZeusServerCallback(channel, msg)
    call popup_dialog('this is a dialog', #{time: 3000})
endfunction

function! StartZeusServer()
    if !executable('python3')
        call popup_dialog('python3 is not in the PATH!', #{time: 3000})
        return 0
    endif

    let script_path = fnamemodify(resolve(expand('<sfile>:p')),':h') . '/plugin/zeus.py'
    " call popup_dialog(script_path, #{time: 4000})
    " return -1
    let job = job_start('python3 ' . script_path, #{callback: 'StartZeusServerCallback'})

    let g:zeus_server_job = job
    return 1 
endfunction

function! s:prepare_server()
    let channel_url = 'localhost:9876'
    let channel = ch_open(channel_url, {})

    let channel_status = ch_status(channel)
    if channel_status != 'open'
        let result = StartZeusServer()
        if result <= 0
            call popup_dialog('server start failed!', #{time: 3000})
            return 0
        endif

        let channel = ch_open(channel_url, #{waittime: 1000})
        if ch_status(channel) != 'open'
            call popup_dialog('channel ' . channel_url . ' is not ready!', #{time: 3000})
            return 0
        endif
    endif

    let g:zeus_server_channel = channel
    return 1 
endfunction

function ChannelMsgCallback(channel, msg)
    call popup_dialog('this is a dialog: ok', #{time: 2000})
endfunction

function! jump#alternate()
    let result = s:prepare_server()
    if result <= 0
        return
    endif
    let current_file = expand('%:p')
    call ch_sendexpr(g:zeus_server_channel, ['zeus', 'jump', current_file], #{callback: 'ChannelMsgCallback'})
endfunction

map <leader>xx :call jump#alternate()<CR>

