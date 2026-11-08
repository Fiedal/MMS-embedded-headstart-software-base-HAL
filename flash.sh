#!/bin/bash

ELF_FILE="Debug/embedded_headstart.elf" # Change "embedded_headstart" to your project name
BMP_PORT="/dev/ttyACM0"

if [ ! -f "$ELF_FILE" ]; then
    echo "Error: Compiled program not found: $ELF_FILE"
    echo "Make sure that ELF_FILE is correct and compilation was succesfull"
    exit 1
fi

echo "Connecting on port $BMP_PORT..."
echo "Flashing $ELF_FILE..."

arm-none-eabi-gdb -nx --batch \
  -ex "target extended-remote $BMP_PORT" \
  -ex "monitor swdp_scan" \
  -ex "attach 1" \
  -ex "load" \
  -ex "quit" \
  "$ELF_FILE"

if [ $? -eq 0 ]; then
    echo "Sucess"
else
    echo "Error while flashing: Check connection with the board and port"
fi