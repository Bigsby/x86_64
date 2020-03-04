mov $0x0e,%ah       # teletype output for interrupt
mov $'X',%al        # set character to print
int $0x10           # call BIOS interrupt



