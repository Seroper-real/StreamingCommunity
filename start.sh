#!/bin/bash

# FOR DOCKER USAGE

set -e

if [ "$1" = "script" ]; then
    echo "Starting test_run.py..."
    exec python3 test_run.py
elif [ "$1" = "bot" ]; then
    echo "Starting telegram_bot.py..."
    cd StreamingCommunity/TelegramHelp
    exec python3 telegram_bot.py
else
    echo "Usage: ./start.sh [script|bot]"
    exit 1
fi
