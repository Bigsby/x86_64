BOOT = boot
BIN = $(BOOT).bin
ASM = $(BOOT).asm

$(BIN): $(ASM)
	nasm -f bin -o $@ $? 

run: $(BIN)
	qemu-system-x86_64 -curses -drive file=$?,format=raw	

clean:
	rm $(BIN)
