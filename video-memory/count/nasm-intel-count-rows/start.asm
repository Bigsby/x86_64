mov ax, 0xb800              ; start of video text memory at 0xb8000
mov ds, ax                  ; and move it into ds (data destination segment)

xor di, di                  ; set di (destination index) to zero
mov cx, 0x40                ; set countery for how many chareters to display

reset_mask:
    mov si, MASK            ; set si (source index) to where the text begins

next_character:
    xor dx, dx              ; zero dx (data register)
    mov dl, [cs:si]         ; move the content of (segnemented by cs) into dx low byte
    cmp dl, 0               ; check if character is 0 (end of string)
    jz reset_mask           ; if so, go to returning to the begining of the string

    mov [di], dl            ; set character in dl in destination location
    inc di                  ; move di up to next byte to set color and background
    mov [di], BYTE 0x1e     ; set color and background (blue) and foreground (yellow)
    add di, 0xa0-1          ; 0xa0 = 80 * 2 columns, minus 1 of the already incremented di
    inc si                  ; point to the next character on the string
    dec cx                  ; decrement the counter
    jnz next_character      ; if counter is not zero go to process next character

jmp $                       ; jump "eternally" to itself

MASK:
    db "1234567890", 0      ; the text to be displayed


