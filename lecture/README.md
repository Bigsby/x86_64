# The YouTube playlist

[OS Dev playlist](https://youtube.com/playlist?list=PLrJApd3VJDK0gVMU3lZBVHBCgC1EeK)

# Topics

## 01
- The computer
- The Boot process
- Why is hexadecimal important?
- Writing a boot sector (in hex)
- Running out boot sector
    - In a real or virtual machine
    - In an emulator: qemu
- Looking at real-life boot sectors

## 02
- Assembly intro
    - Compiling to machine code
    - Looking at the machine code
- Registers
- Interrupts
- Example: "Hello, World" bootsector
- What is 16-bit mode?

## 03
- Memory
- Accessing memory
    - Where did BIOS load our code?
- 16-bit Address Limitations
    - How can 'segments' let us access more memory.
- Smashing the interrupt table ;)

## 04
- Understanding 'the stack'
    - What is it?
    - Why is it?
    - It grows downards?
- Control Flow (if, while, etc.)

# 05
- What actually is a function?
- Trying to make a function
    - Passing arguments
    - call and ret
    - Pitfalls: unwanted side-effects
- Example: function to print a string.
- Assembly include files
- Exercise: print some hex.

## 06
- Printing a memory value as hex
    - Can we ses the BIOS magic number?
- Fishing for strings in BIOS
    - First search within first 64KB of memory
    - Then flex segments to search more memory
    - Try in QEmu and VirtualBox

## 07
- Loading data from the disk
    - How a hard disk works
    - How BIOS can help us
    - Confirming our data got loaded
    - Checking for disk/read errors

## 08
- Switching to (32-bit) protected mode
    - Why bother?

## 09
- Playing with a c compiler
    - It is import to know how it generates the code we will load
- Generating a kernel image, ready for loading.
- Loading our kernel code from disk
- Executing our kernel code

