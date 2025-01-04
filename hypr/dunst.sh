#!/bin/sh

pgrep dunst || killall dunst
dunst &
