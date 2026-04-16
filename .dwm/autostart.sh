/usr/libexec/polkit-mate-authentication-agent-1 &
[ -f ~/.cache/brightness_level ] && brightnessctl set "$(cat ~/.cache/brightness_level)" &
xwallpaper --zoom ~/Pictures/Wallpapers/wallpaper-theme-converter.png
picom &
dunst &
redshift &
~/scripts/statusbar/audio-listen.sh &
~/scripts/statusbar/minute-listen.sh &
~/scripts/statusbar/battery-listen.sh &
