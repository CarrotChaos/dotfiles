/usr/bin/pipewire &
/usr/bin/pipewire-pulse &
/usr/bin/wireplumber &
/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
[ -f ~/.cache/brightness_level ] && brightnessctl set "$(cat ~/.cache/brightness_level)" &
xwallpaper --zoom ~/Pictures/Wallpapers/abstract-swirls.jpg
picom &
dunst &
redshift &
dwmblocks &
~/scripts/statusbar/audio-listen.sh &
~/scripts/statusbar/minute-listen.sh &
~/scripts/statusbar/battery-listen.sh &
