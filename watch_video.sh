#!/bin/sh
if [ -n "$1" ];
then
  src="raspivid -n -t 0 -md 6 -w 640 -h 480 -o -"
else
  src="./pull_video"
fi

launch="gst-launch-1.0"

# v="-v"

fdsrc="fdsrc fd=0 ! "

h264="h264parse ! omxh264dec ! "

# gray8="videoconvert ! video/x-raw,format=GRAY8 ! "

$src | $launch $v $fdsrc $h264 $gray8 videoconvert ! fbdevsink device=/dev/fb0
