[org 0x7c00]

;
; Start
;

mov bp, 0x8000
mov sp, bp

push word 0x1234
call print_hex

jmp $ ; eternal loop to itself

;
; Functions
;
print_hex:
    exit_print_message:
        ret

print_message:
    pop bx                          ; pop return address to bx
    pop si                          ; pop message address from stack

    print_message_loop:
        lodsb                       ; mov al, [si] ; inc si
        cmp al, 0
        je exit_print_message       ; if al is 0 then exit

        mov ah, 0x0e                ; scrolling teletype interrupt
        int 0x10
        jmp print_message_loop

    exit_print_message:
        push bx                     ; push return address to stack
        ret

;
; Data
;

HEX_NUMBER:
    dw 0x1234

HEX_TEMPLATE:
    db '0x???? ',0
;
; Padding and magic number
;
times 510-($-$$) db 0
dw 0xaa55
