SEP=" | "

printBattery(){
    capacity=$(cat /sys/class/power_supply/BAT0/capacity)
    if [[ $capacity -eq 90 ]]; then
        dunstify --urgency=critical "Battery Full"
    fi
    echo "$capacity%"
}

printUptime(){
    printf "$(uptime -p)"
}

printDate(){
    printf "$(date "+%A %d %h $SEP %I:%M %p")"
}

while true; do
    xsetroot -name "$(printUptime) $SEP $(printBattery) $SEP $(printDate)"
	sleep 60s
done
