mov ax, 0xb800
mov ds, ax
mov [0x0], BYTE 'B'
mov [0x2], BYTE 'i'
mov [0x4], BYTE 'g'
mov [0x6], BYTE 's'
mov [0x8], BYTE 'b'
mov [0xa], BYTE 'y'

jmp $

times 510-($-$$) db 0
dw 0xaa55

