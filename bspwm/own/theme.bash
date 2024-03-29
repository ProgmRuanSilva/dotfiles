# ------------------------------------------------------------------------------
# Copyright (C) 2020-2024 Ruan Silva <progmruansilva@gmail.com>
#
# Own Theme
# ------------------------------------------------------------------------------

# Colors
background='#1E2128'
foreground='#ABB2BF'
color0='#32363D'
color1='#E06B74'
color2='#98C379'
color3='#E5C07A'
color4='#62AEEF'
color5='#C778DD'
color6='#55B6C2'
color7='#ABB2BF'
color8='#50545B'
color9='#EA757E'
color10='#A2CD83'
color11='#EFCA84'
color12='#6CB8F9'
color13='#D282E7'
color14='#5FC0CC'
color15='#B5BCC9'

accent='#C778DD'
light_value='0.05'
dark_value='0.30'

# Wallpaper
wdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
wallpaper="$wdir/wallpaper.jpg"

# Polybar
polybar_font='JetBrains Mono:size=10;3'

# Rofi
rofi_font='Iosevka 10'
rofi_icon='Zafiro'

# Terminal
terminal_font_name='JetBrainsMono Nerd Font'
terminal_font_size='9'

# Geany
geany_colors='arc.conf'
geany_font='JetBrains Mono 10'

# Appearance
gtk_font='Noto Sans 9'
gtk_theme='Arc-Dark'
icon_theme='Zafiro'
cursor_theme='Qogirr'

# Dunst
dunst_width='300'
dunst_height='80'
dunst_offset='10x48'
dunst_origin='top-right'
dunst_font='JetBrains Mono 10'
dunst_border='2'
dunst_separator='2'

# Picom
picom_backend='glx'
picom_corner='15'
picom_shadow_r='14'
picom_shadow_o='0.30'
picom_shadow_x='-12'
picom_shadow_y='-12'
picom_blur_method='dual_kawase'
picom_blur_strength='55'

# Bspwm
bspwm_fbc="$accent"
bspwm_nbc="$background"
bspwm_abc="$color7"
bspwm_pfc="$color2"
bspwm_border='1'
bspwm_gap='5'
bspwm_sratio='0.50'
