function _install_autols --on-event autols_install
    if not set --query autols_cmd
        set -U autols_cmd ls
    end
end

function __autols --on-variable PWD --description 'Automatically ls when the $PWD changes.'
    if not status --is-interactive
        return
    end

    if not set --query autols_cmd
        set -U autols_cmd ls
    end

    $autols_cmd
end

function _uninstall_autols --on-event autols_uninstall
    set --erase autols_cmd

    functions --erase _install_autols
    functions --erase __autols
    functions --erase _uninstall_autols
end
