#!/usr/bin/env bash

trap "exit 0" TERM INT
trap "brightnessctl -q -r > /dev/null; kill %%" EXIT
brightnessctl -q -s > /dev/null; brightnessctl -q s 1%;
sleep 2147483647 &
wait
