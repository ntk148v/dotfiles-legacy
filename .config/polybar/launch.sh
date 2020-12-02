#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
# polybar main -c ~/.config/polybar/config.ini &
#MONITOR=DP-1 polybar top -c ~/.config/polybar/configtop-left &
#MONITOR=DP-1 polybar top -c ~/.config/polybar/configtop-center &
#MONITOR=DP-1 polybar top -c ~/.config/polybar/configtop-right &
MONITOR=DP-1 polybar top -c ~/.config/polybar/configtop &
