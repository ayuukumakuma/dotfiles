function __cdf_clean_chpwd_recent_dirs --description 'Filter non-existent directories from __cdf_recent_dirs'
    set -l filterd

    for item in $__cdf_recent_dirs
        if test -d $item
            set -a filterd $item
        end
    end

    set __cdf_recent_dirs $filterd
end
