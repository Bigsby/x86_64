[bits 16]                   ; set 16bits Real Mode
[org 0x7c00]                ; set origin for memory offset where 
                            ; the bootloader is loaded into memory

%include "start.asm"        ; include custom code file

jmp $                       ; loop "eternally"

times 510-($-$$) db 0       ; fill up with zeros until 510
dw 0xaa55                   ; bootloader magic number
