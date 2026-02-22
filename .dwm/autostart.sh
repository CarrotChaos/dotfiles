/usr/libexec/polkit-mate-authentication-agent-1 &
[ -f ~/.cache/brightness_level ] && brightnessctl set "$(cat ~/.cache/brightness_level)" &
xwallpaper --zoom ~/Pictures/Wallpapers/wallhaven-49ko8d.png
picom &
dunst &
~/scripts/statusbar/audio-listen.sh &
~/scripts/statusbar/minute-listen.sh &
