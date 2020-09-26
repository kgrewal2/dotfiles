while true; do
    xsetroot -name "$(cat ~/.config/dwmbar_data) | $(date "+%A %d %h | %I:%M:%S %p")"
	sleep 1s
done
