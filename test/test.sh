#!/bin/bash

echo "Boot wine."
WINEDEBUG=-all wineboot || exit

# Change to script directory.
cd "$(dirname "$0")" || exit

# Build a simple test application.
make clean build || exit

echo "Test application."
wine test.exe
