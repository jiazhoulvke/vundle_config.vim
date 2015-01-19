function! VimPluginConfig()
    let curline = getline('.')
    let pos = match(curline,"^\"*Plugin\ '.*'")
    if pos != -1
        let plugin_name = split(matchstr(curline,"\\(Plugin\ *\\)\\@<=.*"), ',')[0]
        let plugin_name = split(strpart(plugin_name, 2, strlen(plugin_name)-3), '/')[1]
        let pluginconfig_filename = expand('%:p:h') . '/' .expand('%:t:r') . '.config.vim'
        exe ":e " . pluginconfig_filename
        let searchstr = "\"\ Name:\ ".plugin_name
        let searchpos = search(searchstr, 'e')
        if searchpos == 0
            let hr = '"=================================================='
            let plugin_head = ['',hr, "\"\ Name:\ ".plugin_name, hr]
            call append(line('$'), plugin_head)
            normal G
        endif
    endif
endfunction

function! VimPluginConfig_Keybind()
    nmap <buffer> <C-]> <ESC>:call VimPluginConfig()<CR>
endfunction

autocmd! BufReadPost plugins.vim,plugins.*.vim call VimPluginConfig_Keybind()
