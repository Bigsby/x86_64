.code16                         # 16bits Real Mode
.global _start                  # Set entry point

_start:
.include "start.S"              # include custom file

jmp .                           # loop "eternally"

.fill 510-(.-_start),1,0        # add zeros until 510
.word 0xaa55                    # magit boot number
