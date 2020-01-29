[org 0x7c00]

;
; Start
;

mov bp, 0x8000
mov sp, bp

mov dx, 0x1234
call print_hex

jmp $ ; eternal loop to itself

;
; Functions
;
print_hex:
    exit_print_message:
        ret

print_message:
    pop bx
    pop si
    lodsb
    cmp al, 0
    je exit_print_message    
    mov ah, 0x0e
    int 0x10
    jmp print_message
    exit_print_message:
        push bx
        ret

;
; Data
;

HEX_TEMPLATE:
    db '0x???? ',0
;
; Padding and magic number
;
times 510-($-$$) db 0
dw 0xaa55
