#!/bin/bash

COVER="/tmp/album_cover.png"

function add_cover {
	kitty icat --clear "$COVER"
}

add_cover

#rerender image when changed
while inotifywait -q -q -e close_write "$COVER"; do
  add_cover
done
