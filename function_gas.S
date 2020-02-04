.code16
.org 0x7c00

#
# Start
#
movw $0x8000, %bp
movw %bp, %sp

pushw message
call print_message

jmp .                           # return to itself eternally

#
# Functions
#
print_message:
    popw %bx                    # pop return address from stack to bx
    popw %si                    # pop message address from stack

    print_message_loop:
        lodsb                   # movb %al, (%si), inc %si
        cmpb $0, %al
        je exit_print_message   # if %al is 0 then exit

        movb $0x0e, %ah         # scrolling teletype rotine
        int $0x10               # call interrupt
        jmp print_message_loop
    
    exit_print_message:
        pushw %bx               # push return address to stack
        ter
#
# Data
#
message:
    .asciz "Hello, Bigsby!"





