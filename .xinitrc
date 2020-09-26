export _JAVA_AWT_WM_NONREPARENTING=1; export AWT_TOOLKIT=MToolkit &
exec ~/.config/delay_long.sh &
exec ~/.config/delay_short.sh &
exec dunst &
xrandr --output eDP-1 --gamma 0.7:0.7:0.7 --brightness 0.8 &
exec dwm
