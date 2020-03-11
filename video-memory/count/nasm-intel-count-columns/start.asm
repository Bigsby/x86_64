mov ax, 0xb800              ; start of video text memory
mov ds, ax

xor di, di
mov si, MASK
mov cx, 0x80

next_character:
    xor dx, dx
    mov dl, [cs:si]
    cmp dl, 0
    jz reset_mask

    mov [di], dl
    inc di
    mov [di], BYTE 0x1e
    inc di            ; 80 columns
    inc si
    dec cx
    jz end
    jmp next_character

reset_mask:
    mov si, MASK
    jmp next_character

end:
    jmp $




MASK:
    db "1234567890", 0


