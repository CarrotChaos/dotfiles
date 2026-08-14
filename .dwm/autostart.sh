/usr/libexec/polkit-mate-authentication-agent-1 &
[ -f ~/.cache/brightness_level ] && brightnessctl set "$(cat ~/.cache/brightness_level)" &
if [ -f ~/.cache/theme/wallpaper ]; then
	xwallpaper --zoom "$(cat ~/.cache/theme/wallpaper)"
fi
picom &
dunst &
redshift &
dwmblocks &
xcompmgr &
~/scripts/statusbar/audio-listen.sh &
~/scripts/statusbar/minute-listen.sh &
~/scripts/statusbar/battery-listen.sh &
python3 ~/scripts/pass-daemon.py &
