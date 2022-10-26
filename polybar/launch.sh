#!/bin/bash

killall -q polybar

while pgrep -u $UID -x polybar > /devnull; do sleep 1; done

polybar mybar

