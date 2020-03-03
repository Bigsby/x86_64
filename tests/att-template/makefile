BOOT = boot
BIN = $(BOOT).bin
ASM = $(BOOT).asm

$(BIN): $(ASM)
	nasm -f bin -o $@ $? 

run: $(BIN)
	qemu-system-x86_64 -drive file=$?,format=raw	

runno: $(BIN)
	qemu-system-x86_64 -nographic -drive file=$?,format=raw	

runcur: $(BIN)
	qemu-system-x86_64 -curses -drive file=$?,format=raw	


