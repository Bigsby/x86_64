[org 0x7c00]
mov ax, 0xb800
mov ds, ax
xor di, di
mov si, MESSAGE

move:
    xor dx, dx
    mov dl, [cs:si]
    cmp dl, 0

idle:
    jz idle

    mov [di], dl
    inc di
    mov [di], BYTE 0x1e         ; Blue background, Intensified Yellow foreground
    inc di
    inc si
    jmp move

jmp $

MESSAGE:
    db 'Hello, Bigsby!', 0

times 510-($-$$) db 0
dw 0xaa55

