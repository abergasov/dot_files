#!/bin/sh
text=`xclip -selection primary -o` 
trans=`/usr/bin/trans :ru -brief "$text"` 
echo $text
echo $trans
notify-send "$trans"
