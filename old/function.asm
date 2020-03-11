[org 0x7c00]

;
; Start
;

mov bp, 0x8000
mov sp, bp

push message
call print_message

jmp $                               ; return to itself eternally


;
; Functions
;
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
message:
    db 'Hello, Bigsby!', 0

;
; Padding and magic number
;
times 510-($-$$) db 0
dw 0xaa55
