/usr/libexec/polkit-mate-authentication-agent-1 &
[ -f ~/.cache/brightness_level ] && brightnessctl set "$(cat ~/.cache/brightness_level)" &
xwallpaper --zoom ~/Pictures/Wallpapers/horizon.jpg
picom &
dunst &
redshift &
gentoo-pipewire-launcher &
dwmblocks &
~/scripts/statusbar/audio-listen.sh &
~/scripts/statusbar/minute-listen.sh &
~/scripts/statusbar/battery-listen.sh &
python3 ~/scripts/pass-daemon.py &
