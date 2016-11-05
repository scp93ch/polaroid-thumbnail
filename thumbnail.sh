#!/bin/bash

# Copyright (c) Stephen C Phillips, 2006

in=$1
out=$2
label=$3

r=$((RANDOM%20-10))

#scale down to max 1000 first
convert -size 1000x1000 "$in" -resize 1000x1000 /tmp/photo.png
# make the label
width=`identify -format '%w' /tmp/photo.png`
convert -background white -fill black -gravity Center -pointsize 60 -font Helvetica -size ${width}x caption:"$label" /tmp/label.png
#add the label to photo
convert -append /tmp/photo.png /tmp/label.png /tmp/straight.png
#add border
mogrify -bordercolor white -border 20x20 /tmp/straight.png
#echo Rotating by $r
convert -background transparent -rotate $r /tmp/straight.png /tmp/rot.png
size=`identify -format '%w %h' /tmp/rot.png`
#echo Size after rotation is $size
x=`echo $size | cut -d' ' -f1`
y=`echo $size | cut -d' ' -f2`
x=$((x/5))
y=$((y/5))
#echo $x by $y
#this resize takes into account the size after the rotation
mogrify -resize ${x}x${y} -bordercolor transparent -border 10x10 /tmp/rot.png

#add shadow
convert /tmp/rot.png -channel matte -negate -separate /tmp/mask1.png
convert /tmp/mask1.png -blur 0x5 +matte /tmp/mask2.png
convert /tmp/mask1.png -fill \#444 -draw 'color 0,0 reset' /tmp/gray.png
composite /tmp/mask2.png /tmp/gray.png -compose CopyOpacity /tmp/shadow.png
composite /tmp/rot.png /tmp/shadow.png "$out"
