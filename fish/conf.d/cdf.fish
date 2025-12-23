function _cdf_install --on-event cdf_install
    set -q cdf_recent_dirs_max
    or set -U cdf_recent_dirs_max 500
end

function __cdf_chpwd_recent_dirs --on-variable PWD --description 'Recording recent_dirs'
    if not status --is-interactive
        return
    end

    set -U __cdf_recent_dirs (string match -v (pwd) $__cdf_recent_dirs)
    set -U --prepend __cdf_recent_dirs (pwd)

    set -q cdf_recent_dirs_max
    or set -U cdf_recent_dirs_max 500

    if test (count $__cdf_recent_dirs) -gt $cdf_recent_dirs_max
        set -U __cdf_recent_dirs $__cdf_recent_dirs[..$cdf_recent_dirs_max]
    end
end

function _cdf_uninstall --on-event cdf_uninstall
    set -U --erase cdf_recent_dirs_max
    set -U --erase __cdf_recent_dirs

    functions --erase _cdf_install
    functions --erase __cdf_chpwd_recent_dirs
    functions --erase _cdf_uninstall
end
