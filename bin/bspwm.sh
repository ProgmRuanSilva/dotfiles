#!/bin/bash

bspwm () {
  cp -r ../bspwm/bspwmrc ~/.config/bspwm/
}

picom () {
  cp -r ../bspwm/picom.conf ~/.config/bspwm/
}

sxhkdrc () {
  cp -r ../bspwm/sxhkdrc ~/.config/bspwm/
}

alacritty () {
  cp -r ../alacritty/* ~/.config/bspwm/alacritty/
}

theme () {
  cp -r ../bspwm/own ~/.config/bspwm/themes/ && sh ~/.config/bspwm/themes/own/apply.sh
}

bspwm
picom
sxhkdrc
alacritty
theme
