complete -c cd-gitroot -x
complete -c cd-gitroot -n '__fish_is_first_token' -s h -l help -d 'Display this help and exit'
complete -c cd-gitroot -n '__fish_is_first_token' -xa '(_cd-gitroot_complete_path)'

function _cd-gitroot_complete_path
  if not git rev-parse --is-inside-work-tree > /dev/null 2>&1
    # not in git working tree
    return 2
  end

  set -l root_path (git rev-parse --show-toplevel)
  _cd-gitroot_fish_complete_directories $root_path (commandline -tc)
end

function _cd-gitroot_fish_complete_directories
  set -l base_directory $argv[1]
  set -l current $argv[2]

  # remove / to end if exists
  set base_directory (echo $base_directory | string trim -r -c /)
  # add/ to end
  set base_directory {$base_directory}/

  set desc (_ "Directory")
  set -l dirs (
    complete -C"_cd-gitroot_not_exist_command_for_completion_directory_xxx $base_directory$current" \
      | string match -r '.*/$' \
      | string replace $base_directory ''
  )

  if set -q dirs[1]
    printf "%s\t$desc\n" $dirs
  end
end

