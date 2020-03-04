.code16
.global _start

_start:
.include "start.S"

_idle:
    jmp _idle

.fill 510-(.-_start),1,0
.word 0xaa55
