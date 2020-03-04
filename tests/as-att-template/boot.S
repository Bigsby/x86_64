.code16
.global _start

_start:
.include "start.S"

jmp .

.fill 510-(.-_start),1,0
.word 0xaa55
