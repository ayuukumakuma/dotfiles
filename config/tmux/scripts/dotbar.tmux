#!/usr/bin/env bash

get_tmux_option() {
	local option="$1"
	local default_value="$2"
	local option_value
	option_value=$(tmux show-options -gqv "$option")
	[ -n "$option_value" ] && echo "$option_value" || echo "$default_value"
}

script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)

# Colors
bg=$(get_tmux_option "@tmux-dotbar-bg" '#0B0E14')
fg=$(get_tmux_option "@tmux-dotbar-fg" '#475266')
fg_current=$(get_tmux_option "@tmux-dotbar-fg-current" '#BFBDB6')
fg_session=$(get_tmux_option "@tmux-dotbar-fg-session" '#565B66')
fg_prefix=$(get_tmux_option "@tmux-dotbar-fg-prefix" '#95E6CB')
fg_prefix_text=$(get_tmux_option "@tmux-dotbar-fg-prefix-text" "$bg")

# Options
bold_status=$(get_tmux_option "@tmux-dotbar-bold-status" false)
bold_current_window=$(get_tmux_option "@tmux-dotbar-bold-current-window" false)
rounded=$(get_tmux_option "@tmux-dotbar-rounded" true)
status=$(get_tmux_option "@tmux-dotbar-position" "bottom")
justify=$(get_tmux_option "@tmux-dotbar-justify" "absolute-centre")
left_state=$(get_tmux_option "@tmux-dotbar-left" true)
right_state=$(get_tmux_option "@tmux-dotbar-right" false)

# Status Components
session_text=$(get_tmux_option "@tmux-dotbar-session-text" " #S ")
session_position=$(get_tmux_option "@tmux-dotbar-session-position" "left")
time_text=$(get_tmux_option "@tmux-dotbar-status-right-text" " %H:%M ")

bold_attr="bold"
[ "$bold_status" = true ] && bold_attr="nobold"
prefix_style="#[bg=$fg_prefix,fg=$fg_prefix_text,$bold_attr]"

if [ "$rounded" = "true" ]; then
	edge_left=''
	edge_right=''
	if [ "${#session_text}" -gt 2 ]; then
		session_text_inner="${session_text:1:${#session_text}-2}"
	else
		session_text_inner="$session_text"
	fi
	session_component="#[bg=$bg,fg=$fg_session]#{?client_prefix,#[fg=$fg_prefix]$edge_left,$session_text}$prefix_style#{?client_prefix,$session_text_inner,}#[bg=$bg,fg=${fg_session}]#{?client_prefix,#[fg=$fg_prefix]$edge_right,}"
else
	session_component="#[bg=$bg,fg=$fg_session]#{?client_prefix,,$session_text}$prefix_style#{?client_prefix,$session_text,}#[bg=$bg,fg=${fg_session}]"
fi
time_component="#[bg=$bg,fg=$fg_session]$time_text#[bg=$bg,fg=${fg_session}]"
git_component="#[bg=$bg,fg=$fg_session]#($script_dir/git-status.sh full '#{pane_current_path}')#[bg=$bg,fg=${fg_session}]"

# Build Default Status Strings
if [ "$session_position" = "right" ]; then
	default_left=""
	[ "$right_state" = "true" ] && default_right="$git_component$time_component$session_component" || default_right="$session_component"
else
	default_left="$session_component"
	[ "$right_state" = "true" ] && default_right="$git_component$time_component" || default_right=""
fi

status_left=$(get_tmux_option "@tmux-dotbar-status-left" "$default_left")
status_right=$(get_tmux_option "@tmux-dotbar-status-right" "$default_right")

[ "$left_state" != "true" ] && status_left=""
if [ "$right_state" != "true" ] && [ "$session_position" != "right" ]; then
	status_right=""
fi

# Window Format & SSH
window_index_prefix='#{window_index}'
base_window_format=$(get_tmux_option "@tmux-dotbar-window-status-format" "${window_index_prefix}:#W ")
base_window_format_without_prefix="${base_window_format#"$window_index_prefix"}"
ssh_enabled=$(get_tmux_option "@tmux-dotbar-ssh-enabled" true)

if [ "$ssh_enabled" = true ]; then
	ssh_icon=$(get_tmux_option "@tmux-dotbar-ssh-icon" '󰌘')
	ssh_icon_only=$(get_tmux_option "@tmux-dotbar-ssh-icon-only" false)
	if [ "$ssh_icon_only" = true ]; then
		ssh_window_format="${window_index_prefix} ${ssh_icon}${base_window_format_without_prefix}"
	else
		ssh_window_format="${window_index_prefix} ${ssh_icon} #(host=\$(echo '#{pane_title}' | sed 's/^ssh //; s/ .*//; s/.*@//; s/:.*//'); if echo \"\$host\" | grep -qE '^[0-9.]+\$|^[0-9]'; then echo '#W'; else echo \"\$host\"; fi | cut -c1-20) "
	fi
	window_status_format="#{?#{==:#{pane_current_command},ssh},${ssh_window_format},${base_window_format}}"
else
	window_status_format="${base_window_format}"
fi

window_status_separator=$(get_tmux_option "@tmux-dotbar-window-status-separator" ' • ')
maximized_pane_icon=$(get_tmux_option "@tmux-dotbar-maximized-icon" '󰊓')
show_maximized_icon_for_all_tabs=$(get_tmux_option "@tmux-dotbar-show-maximized-icon-for-all-tabs" false)

# Apply Options
tmux set-option -g status-position "$status"
tmux set-option -g status-justify "$justify"
tmux set-option -g status-left "$status_left"
tmux set-option -g status-right "$status_right"
tmux set-window-option -g window-status-separator "$window_status_separator"
tmux set-option -g window-status-style "bg=${bg},fg=${fg}"
tmux set-option -g window-status-format "$window_status_format"
[ "$show_maximized_icon_for_all_tabs" = true ] && tmux set-option -g window-status-format "${window_status_format}#{?window_zoomed_flag,${maximized_pane_icon},}"

status_style="bg=${bg},fg=${fg}"
[ "$bold_status" = true ] && status_style="$status_style,bold"
tmux set-option -g status-style "$status_style"

tmux set-option -g window-status-bell-style "bg=${fg_prefix},fg=${bg},bold"
tmux set-option -g window-status-activity-style "bg=${fg_current},fg=${bg}"

current_format="#[bg=${bg},fg=${fg_current}]${window_status_format}#[fg=#39BAE6,bg=${bg}]#{?window_zoomed_flag,${maximized_pane_icon},}#[fg=${bg},bg=default]"
[ "$bold_current_window" = true ] && current_format="#[bg=${bg},fg=${fg_current},bold]${window_status_format}#[fg=#39BAE6,bg=${bg}]#{?window_zoomed_flag,${maximized_pane_icon},}#[fg=${bg},bg=default]"
tmux set-option -g window-status-current-format "$current_format"
