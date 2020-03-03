[org 0x7c00]

%include "start.asm"

jmp $

times 510-($-$$) db 0
dw 0xaa55
