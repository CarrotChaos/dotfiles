/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
[ -f ~/.cache/brightness_level ] && brightnessctl set "$(cat ~/.cache/brightness_level)" &
xwallpaper --zoom ~/Pictures/Wallpapers/snow.jpg
picom &
dunst &
dwmblocks &
~/scripts/statusbar/audio-listen.sh &
~/scripts/statusbar/minute-listen.sh &
