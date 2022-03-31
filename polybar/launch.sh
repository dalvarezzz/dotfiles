#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

echo "---" | tee -a /tmp/polybar-main.log 
# polybar top-2 2>&1 | tee -a /tmp/polybar2.log & disown
polybar main 2>&1 | tee -a /tmp/polybar-main.log & disown

echo "Bars launched..."
