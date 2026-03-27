#!/bin/bash
if [[ -f "$HOME/.config/notify-sound-disabled" ]]; then
  echo "Zunda Notify: 🔇 OFF"
else
  echo "Zunda Notify: 🔔 ON"
fi
