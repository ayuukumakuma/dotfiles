function cd-gitroot
  argparse -n cd-gitroot 'h/help' -- $argv
    or return 1

  if set -lq _flag_h
    _cd-gitroot_print_help
    return
  end

  if not git rev-parse --is-inside-work-tree > /dev/null 2>&1
    _cd-gitroot_print_error 'Not in a git repository'
    return 2
  end

  set -l root_path (git rev-parse --show-toplevel)
  set -l relative_path $argv[1]

  if test -z "$relative_path"
    cd -- $root_path
  else
    cd -- $root_path/$relative_path
  end
end

function _cd-gitroot_print_help
  echo 'Usage: cd-gitroot [OPTION] [PATH]
Change directory to current git repository root directory.
If PATH is specified, change directory to PATH instead of it.
PATH is treated relative path in git root directory.

-h, --help    display this help and exit'

end

function _cd-gitroot_print_error
  echo "cd-gitroot: $argv
Try '-h' or '--help' option for more information." 1>&2

end
