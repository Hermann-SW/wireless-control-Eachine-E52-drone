#!/bin/sh
./pull_video | gst-launch-1.0 -v fdsrc fd=0 ! h264parse ! avdec_h264 ! fpsdisplaysink text-overlay=false video-sink="fakesink sync=true"

