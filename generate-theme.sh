#!/bin/bash

. ~/.cache/wal/colors.sh #: import colors from pywal

#: You may change this!
THEME_DIR="${1:-/home/$USER/Downloads/Pywal}"

#: Converts hex colors into rgb joined with comma
#: #fff -> 255, 255, 255
hexToRgb() {
	#: Remove '#' character from hex color #fff -> fff
	plain=${1#*#}
	printf "%d, %d, %d" 0x${plain:0:2} 0x${plain:2:2} 0x${plain:4:2}
}

background=$(hexToRgb $background)
foreground=$(hexToRgb $foreground)
accent=$(hexToRgb $color11)
secondary=$(hexToRgb $color8)

#: Prepare
rm -rf $THEME_DIR 2>/dev/null
mkdir -p "$THEME_DIR"/images
#: You might not have this,
#: please condition yourself
#: Copy the current wallpaper into .png @ Pywal theme
#: (I tried .jpg but it didn't work)
ffmpeg -loglevel 8 -i ~/.config/rofi/.current_wallpaper "$THEME_DIR"/images/theme_ntp_background.png

#: Generate
echo '{
  "manifest_version": 3,
  "version": "0.1",
  "name": "Pywal Theme",
  "theme": {
    "images": {
      "theme_ntp_background" : "images/theme_ntp_background.png"
    },
    "colors": {
      "frame": ['$background'],
      "frame_inactive": ['$background'],
      "toolbar": ['$accent'],
      "ntp_text": ['$foreground'],
      "ntp_link": ['$accent'],
      "ntp_section": ['$secondary'],
      "button_background": ['$foreground'],
      "toolbar_button_icon": ['$foreground'],
      "toolbar_text": ['$foreground'],
      "omnibox_background": ['$background'],
      "omnibox_text": ['$foreground']
    },
    "properties": {
      "ntp_background_alignment": "bottom"
    }
  }
}' >"$THEME_DIR"/manifest.json

if [[ -d "$THEME_DIR" && -f "$THEME_DIR"/manifest.json ]]; then
	echo "Pywal Chrome theme generated at $THEME_DIR"
else
	echo "Error!"
fi
