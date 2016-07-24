#!/bin/sh

STATUS=`/usr/share/awesome/bashets/mpd.awk`
TITLE=`mpc | head -n 1`
MTIME=`mpc | head -n 2 | tail -n 1 | awk '{print $3}'`

echo -n "$STATUS|$TITLE|$MTIME"
