function cdf --description 'cd to recent dir'
    __cdf_clean_chpwd_recent_dirs

    set --local selected_repo (printf "%s\n" $__cdf_recent_dirs | env FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS $FZF_ALT_C_OPTS" fzf)
    if test -z $selected_repo
        commandline -f repaint
        return
    end

    commandline --replace " cd $selected_repo"
    commandline -f repaint
    commandline -f execute
end
