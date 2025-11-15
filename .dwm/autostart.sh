[ -f ~/.cache/brightness_level ] && brightnessctl set "$(cat ~/.cache/brightness_level)" &
feh --bg-fill /home/user/Pictures/Wallpapers/vadim-sadovski-n7.jpg &
picom &
dunst &
dwmblocks &
/home/user/suckless/dwmblocks-async/audio-listen.sh &
