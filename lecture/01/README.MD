# List of commands

Create the file, because `hexedit` needs an existing file, and open it in `hexedit´
```bash
touch binary_jump{,_short}.bin
hexedit binary_jump{,short}.bin
```

View the file in `hexyl`
```bash
hexyl binary_jump.bin
```

Open `Qemu`
```bash
qemu-system-x86_64 -nographic -drive file=binary_jump.bin,format=raw
```

Make it big enough for an ISO:
```bash
truncate binary_jump.bin -s 1200k
```

Create ISO file
```bash
genisoimage -v -J -r -b binary_jump.bin -o firstBoot.iso .
```

ISO file is usable in a virtualization software, e.g., VirtualBox, Hyper-V, etc.

## Opcodes used
In `binary_jump_short.bin`:

|OpCode|Instruction|Description|Example|
|------|-----------|-----------|---|
|EB cb|JMP rel8| Relative short jump with 8 bit two's compliment offset|EB FF|
|E9 cw|JMP rel16| Relative near jump with 16 bit two's compliment offset|E9 FF FD|

