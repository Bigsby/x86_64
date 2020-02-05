MISMATCH: "[org 0x7c00]"

#
# Start
#

movw $0x8000,%bp
movw %bp,%sp

MISMATCH: "push message"
call print_message

jmp $                               # return to itself eternally


#
# Functions
#
print_message: 
    popw %bx                        # pop return address to bx
    popw %si                        # pop message address from stack

    print_message_loop: 
        lodsb                       # mov al, [si] ; inc si
        cmpb $0,%al
        je exit_print_message       # if al is 0 then exit

        movb $0x0e,%ah              # scrolling teletype interrupt
        int $0x10
        jmp print_message_loop

    exit_print_message: 
        pushw %bx                   # push return address to stack
        ret

#
# Data
#  
message: 
    .asciz "Hello, Bigsby!"

#
# Padding and magic number
#
MISMATCH: "times 510-($-$$) db 0"
.word 0xaa55

