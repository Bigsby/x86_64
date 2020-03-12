# name of the entry file
BOOT = boot
# entry file with extension
ENTRYFILE = $(BOOT).S
# object file
OBJFILE = $(BOOT).o
# linked file
LINKEDFILE = $(BOOT).ld
# output binary file
BINFILE = $(BOOT).bin

# transform to binary
$(BINFILE): $(LINKEDFILE)
	objcopy -O binary -j .text $< $@
    
# linker
$(LINKEDFILE): $(OBJFILE)
	ld -r -o $@ -Ttext 0x7C00 -s -e _start $<

# assembler
$(OBJFILE): $(ENTRYFILE) *.S
	as -o $@ $<

# open boot.bin in qemu
run: $(BINFILE)
	qemu-system-x86_64 -curses -drive file=$?,format=raw
run-graphic: $(BINFILE)
	qemu-system-x86_64 -drive file=$?,format=raw
# -s is shorthand for '-gdb tcp::1234'
# -S is Do not start CPU at startup
debug: $(BINFILE)
	qemu-system-x86_64 -S -s -curses -drive file=$?,format=raw	
debug-graphic: $(BINFILE)
	qemu-system-x86_64 -S -s -drive file=$?,format=raw


# remove result files
clean:
	rm $(LINKEDFILE) $(OBJFILE) $(BINFILE) 
