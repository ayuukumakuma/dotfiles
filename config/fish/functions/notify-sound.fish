function notify-sound --description 'Toggle notification sound for Claude Code / Codex'
    set -l state_file ~/.config/notify-sound-disabled
    if test -f $state_file
        rm -f $state_file
        echo 'Notification sound: ON'
    else
        touch $state_file
        echo 'Notification sound: OFF'
    end
end
