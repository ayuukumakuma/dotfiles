#!/bin/bash
event_type="$1"
state_file="$HOME/.claude/claude_state.json"
echo "{\"status\":\"$event_type\",\"time\":\"$(date -Iseconds)\"}" > "$state_file"
exit 0
