while :; do
    today=$(date '+%A, %B %d, %l:%M %p')

    brightness=$(cat /sys/class/backlight/intel_backlight/brightness)
    max_brightness=$(cat /sys/class/backlight/intel_backlight/max_brightness)
    brightness_percent=$(((brightness*100)/max_brightness))

    capacity=$(cat /sys/class/power_supply/BAT0/capacity)
    bat_status=$(cat /sys/class/power_supply/BAT0/status)

    bluetooth=$(bluetoothctl info | grep Name: | sed 's/^.*: //')

    wifi=$(nmcli | grep 'connected to' | sed 's/^.*to //')

    xsetroot -name "$wifi  ◉  $bluetooth  ◉  $capacity% ($bat_status)  ◉  $today"
    sleep 60
done
