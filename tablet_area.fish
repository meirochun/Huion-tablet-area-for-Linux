#! /usr/bin/fish
set STYLUS_ID (xsetwacom --list | grep stylus | cut -f 2 | cut -d " " -f 2)
set PAD_ID (xsetwacom --list | grep pad | cut -f 2 | cut -d " " -f 2)

set SCREEN_WIDTH 1366 // YOU CAN CHANGE THIS TO YOUR SCREEN WIDTH.
set SCREEN_HEIGHT 768 // AND HERE YOU CAND CHANGE TO YOUR SCREEN HEIGHT.
set TABLET_WIDTH (xsetwacom --get "$STYLUS_ID" Area | cut -d " " -f 3)
set TABLET_HEIGHT (xsetwacom --get "$STYLUS_ID" Area | cut -d " " -f 4)

set NEW_TABLET_HEIGHT (math --scale=0 $SCREEN_HEIGHT * $TABLET_WIDTH / $SCREEN_WIDTH)
set TABLET_OFFSET_Y (math $TABLET_HEIGHT - $NEW_TABLET_HEIGHT)
set TABLET_OFFSET_Y (math --scale=0 $TABLET_OFFSET_Y / 2)

set PRIMARY_SCREEN_ID (xrandr | grep primary | cut -d " " -f 1)

xsetwacom --set "$STYLUS_ID" ResetArea
xsetwacom --set "$PAD_ID" RawSample 4
xinput map-to-output $STYLUS_ID $PRIMARY_SCREEN_ID
xsetwacom set $STYLUS_ID Area 2500 1300 7500 4400 // THIS IS YOUR AREA, PROBABLY THIS IS AROUND 75x50mm
