function bd --description 'Quickly go back to a parent directory up in $PWD'
    set --local selected_repo (__bd_list | env FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS $FZF_ALT_C_OPTS" fzf)
    if test -z $selected_repo
        commandline -f repaint
        return
    end

    commandline --replace " cd $selected_repo"
    commandline -f repaint
    commandline -f execute
end
