[org 0x7c00]

;
; Start
;

;mov bp, 0x8000
;mov sp, bp

push message
call print_message
jmp $


;
; Functions
;
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
        popa
        ret

;
; Data
;  
message:
    db 'Hello, Stack!', 0

;
; Padding and magic number
;
times 510-($-$$) db 0
dw 0xaa55
