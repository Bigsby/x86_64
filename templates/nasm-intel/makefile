# entry file name
BOOT = boot
# assembly entry file
ASM = $(BOOT).asm
# output binary file
BIN = $(BOOT).bin

# assembler
$(BIN): *.asm 
	nasm -f bin -o $@ $(ASM)

# run boot.bin in qemu
run: $(BIN)
	qemu-system-x86_64 -curses -drive file=$?,format=raw	
run-graphic: $(BIN)
	qemu-system-x86_64 -drive file=$?,format=raw
# -s is shorthand for '-gdb tcp::1234'
# -S is Do not start CPU at startup
debug: $(BIN)
	qemu-system-x86_64 -S -s -curses -drive file=$?,format=raw	
debug-graphic: $(BIN)
	qemu-system-x86_64 -S -s -drive file=$?,format=raw


# remove compiled file
clean:
	rm $(BIN)
