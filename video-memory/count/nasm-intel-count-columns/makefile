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


# remove compiled file
clean:
	rm $(BIN)
