SEP=" | "

printBattery(){
    capacity=$(cat /sys/class/power_supply/BAT0/capacity)
    if [[ $capacity -le 10 ]]; then
        dunstify --urgency=critical "Low Battery"
    fi
    if [[ $capacity -eq 90 ]]; then
        dunstify --urgency=critical "Battery Full"
    fi
    echo "$capacity%"
}

printDate(){
    printf "$(date "+%A %d %h $SEP %I:%M %p")"
}

while :; do
    xsetroot -name "$(printBattery) $SEP $(printDate)";
    sleep 1m
done
