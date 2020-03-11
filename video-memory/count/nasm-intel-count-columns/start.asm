mov ax, 0xb800              ; start of video text memory at 0xb8000
mov ds, ax                  ; and move it into ds (data destination segment)

xor di, di                  ; set di (destination index) to zero)
mov cx, 0x80                ; set counter for how many charaters to write

reset_mask:
    mov si, MASK            ; set si (source index) to where the text is

next_character:
    xor dx, dx              ; zero dx (data register)
    mov dl, [cs:si]         ; move the set the content of si to dx low byte 
    cmp dl, 0               ; check if characher is 0 (end of string)
    jz reset_mask           ; if so, go to returning to the begining of string

    mov [di], dl            ; set the character in dl into destination location index
    inc di                  ; move di up to next byte to set color and background
    mov [di], BYTE 0x1e     ; set color and background (blue) and foreground (yellow)
    inc di                  ; point to next memory location
    inc si                  ; point to the next charater on the string
    dec cx                  ; decrement the counter
    jnz next_character      ; if counter is not zero go to process next character

jmp $                       ; jump "eternally" to itself

MASK:
    db "1234567890", 0      ; the text to be displayed


