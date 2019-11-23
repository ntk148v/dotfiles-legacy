#!/bin/bash

rofi_command="rofi -theme ~/.config/rofi/themes/powermenu.rasi"

### Options ###
power_off=""
reboot=""
lock=""
suspend="鈴"
log_out=""
# Variable passed to rofi
options="$power_off\n$reboot\n$lock\n$suspend\n$log_out"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 2)"
case $chosen in
    $power_off)
        sudo systemctl poweroff
        ;;
    $reboot)
        sudo systemctl reboot
        ;;
    $lock)
        sudo gnome-screensaver-command --lock
        ;;
    $suspend)
        sudo systemctl suspend
        ;;
    $log_out)
        sudo i3-nagbar -t warning -m 'Really, exit?' -b 'Yes' 'i3-msg exit'
        ;;
esac

