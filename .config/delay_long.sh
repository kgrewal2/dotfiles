while true; do
    capacity=$(cat /sys/class/power_supply/BAT0/capacity)
    bat_status=$(cat /sys/class/power_supply/BAT0/status)
    if [[ $capacity -lt 10 ]]; then
        dunstify --urgency=critical "Battery Low"
    fi
    if [[ $capacity -gt 90 ]]; then
        dunstify --urgency=critical "Battery Full"
    fi
    echo "$capacity% ($bat_status)" > ~/.config/dwmbar_data
    sleep 1m
done
