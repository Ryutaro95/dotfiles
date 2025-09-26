#!/usr/bin/env bash
xhost +SI:localuser:root
sudo ~/.local/bin/xkeysnail -q ~/.xkeysnail/config.py &
