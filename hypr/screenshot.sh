#!/bin/sh

grim -g "$(slurp -b 1B1F28CC -c E06B74ff -s C778DD0D -w 2)" - | \
satty --filename - --output-filename ~/Pictures/Screenshots/Screenshot_$(date '+%Y%m%d-%H:%M:%S').png --init-tool pointer --copy-command wl-copy --early-exit
