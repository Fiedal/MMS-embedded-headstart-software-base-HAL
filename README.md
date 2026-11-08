# MMS3 Embedded headstart board software base (For HAL)

This repo contains an already set up CubeMX project for the embedded headstart board. Chainbus pins are already configured. If you are going to use altmode pins, just configure them as you need.

### Before genertion of code

Check these two things:

![Project Manager->Code Generator->Generated files - only first three options are checked](imgs/project_config.png)

1. Make sure the options in Project Manager->Code Generator are set up just like above

2. In Project Manager->Project make sure that toolchain/IDE of your choice is correct (for now I recommand STM32CubeIDE)

### Flashing
To flash your code onto your MMS3 board make sure that ELF file name and port is correct.
1. ELF file name - if you changed the name of the project in .ioc file edit the script with editor of your choice and rename ELF_FILE variable. Replace embedded_headstart to your project name.
2. Port - In most cases after you connect your MMS3 to the PC via USB two serial ports will appear: /dev/ttyACM0 and /dev/ttyACM1 - ACM0 is GDB Server (server that lets you debug your board) and ACM1 is UART. With disconnected MMS3 enter to your terminal:
```
ls /dev
```
Write down or take a picture of the result. Plug the MMS3 and enter command ```ls /dev``` again and check what files apperead. That's serial ports of your board. Try replacing ```BMP_PORT="/dev/ttyACM0"``` with one of them (probably the one with lesser number).
