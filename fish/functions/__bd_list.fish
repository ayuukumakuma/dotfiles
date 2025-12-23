function __bd_list
    set -l dir (pwd)
    for i in (seq 1 20)
        set dir (dirname $dir)
        echo $dir
        if test $dir = /
            break
        end
    end
end
