#!/bin/bash
if [ -r $1.asm ]
then
    nasm $1.asm -o $1.bin
    qemu-system-x86_64 -nographic -drive file=$1.bin,format=raw
else
    echo "File not found!"
fi

