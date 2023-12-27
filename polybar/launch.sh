#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config.ini
#polybar MAIN 2>&1 | tee -a /tmp/polybar.log & disown
#polybar secondary 2>&1 | tee -a /tmp/polybar.log & disown
#polybar laptop 2>&1 | tee -a /tmp/polybar.log & disown
#
#polybar MAIN2 2>&1 | tee -a /tmp/polybar.log & disown
#polybar secondary2 2>&1 | tee -a /tmp/polybar.log & disown
#polybar laptop2 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload main &
  done
else
  polybar --reload main &
fi

#if type "xrandr"; then
#  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#    if [ $m == 'DP-1-1' ]
#    then
#        MONITOR=$m polybar --reload MAIN &
#    elif [ $m == 'HDMI-1-0' ]
#    then
#        MONITOR=$m polybar --reload secondary &
#    elif [$m == 'eDP-2' ]
#    then
#       MONITOR=$m polybar --reload laptop &
#    fi
#
#  done
#else
#  polybar --reload laptop &
#fi

#for m in $(polybar --list-monitors | cut -d":" -f1); do
#   MONITOR=$m polybar --reload MAIN &
#   MONITOR=$m polybar --reload secondary &
#   MONITOR=$m polybar --reload laptop &
#done

#for m in $(polybar --list-monitors | cut -d":" -f1); do
#    if [ $m == 'DP-1' ]
#    then MONITOR=$m polybar --reload MAIN2 &
#    elif [ $m == 'HDMI-0' ]
#    then
#        MONITOR=$m polybar --reload secondary2 &
#    elif [$m == 'eDP-1-2' ]
#    then
#       MONITOR=$m polybar --reload laptop2 &
#    elif [$m == 'eDP-2' ]
#    then
#       MONITOR=$m polybar --reload laptop &
#    elif [$m == 'DP-1-1' ]
#    then
#       MONITOR=$m polybar --reload MAIN &
#    elif [$m == 'HDMI-1-0' ]
#    then
#       MONITOR=$m polybar --reload secondary &
#    fi
#done
