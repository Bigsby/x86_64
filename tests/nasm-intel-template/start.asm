mov ax, 0xb800                  ; load into ax to be able to load into ds
mov ds, ax                      ; set ds (destination address segment) as the begining of video memory
xor di, di                      ; zero destination index
mov si, MESSAGE                 ; set source index to MESSAGE address

move:                           ; get next character
    xor dx, dx                  ; zero dx
    mov dl, [cs:si]             ; load value in current si into dl
    cmp dl, 0                   ; check if it's 0 byte terminating string

idle:
    jz idle                     ; if it's end of string loop "eternally"

    mov [di], dl                ; load value in dl (current character)
    inc di                      ; increment destination address index
    mov [di], BYTE 0x1e         ; load Blue background, Intensified Yellow foreground
    inc di                      ; increment destination address index
    inc si                      ; increment source address index
    jmp move                    ; return to getting next character

MESSAGE:
    db 'Hello, Bigsby!', 0      ; zero terminated string message

