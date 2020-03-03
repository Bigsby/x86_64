.code16
.global _start

_start:
    mov $0x0e,%ah
    mov $'X',%al
    int $0x10

_idle:
    jmp _idle

.fill 510-(.-_start),1,0
.word 0xaa55
