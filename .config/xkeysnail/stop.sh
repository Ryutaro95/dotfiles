#!/usr/bin/env bash
PID=`ps --no-heading -C xkeysnail -o pid | tr -d ' '`
if [ -n "$PID" ]; then
    sudo kill $PID
    echo "Stopped xkeysnail (PID: $PID)"
else
    echo "xkeysnail is not running"
fi
