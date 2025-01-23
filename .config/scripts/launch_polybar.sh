#!/bin/bash

if !(pgrep -x "polybar" > /dev/null)
then
     polybar
fi
