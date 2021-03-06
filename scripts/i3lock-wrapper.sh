#!/usr/bin/env bash

# Exit if i3lock is already running.
[[ $(pidof i3lock) ]] && exit

# Kill apps that prevent i3lock from grabbing the keyboard.
# See https://github.com/DaveDavenport/rofi/issues/728
pkill rofi

RIGHT_COLOR="65b8e0ff"
WRONG_COLOR="ff4210ff"

/usr/bin/i3lock -i ~/media/arch_lock_screen.png \
	--insidecolor=00000000 \
	--insidewrongcolor=00000000 \
	--insidevercolor=00000000 \
	--ringcolor=00000000 \
	--separatorcolor=00000000 \
	--line-uses-inside \
	--ringvercolor=$RIGHT_COLOR \
	--ringwrongcolor=$WRONG_COLOR \
	--keyhlcolor=$RIGHT_COLOR \
	--bshlcolor=$WRONG_COLOR \
	--veriftext="" \
	--wrongtext="" \
	--noinputtext=""
