# name of entry file
BOOT = boot
# entry file with extension
SFILE = $(BOOT).S
# object file
OBJFILE = $(BOOT).o
# linked file
LINKEDFILE = $(BOOT).ld
# output binary file
BINFILE = $(BOOT).bin

# tramsfor to binary
$(BINFILE): $(LINKEDFILE)
	objcopy -O binary -j .text $< $@

# linker
$(LINKEDFILE): $(OBJFILE)
	ld -r -o $@ -Ttext 0x7C00 -s -e _start $?

# assembler with inter syntax options
$(OBJFILE): *.S
	as -mmnemonic=intel -msyntax=intel -mnaked-reg -o $@ $(SFILE)

# run boot.bin in qemu
run: $(BINFILE)
	qemu-system-x86_64 -curses -drive file=$?,format=raw
run-graphic: $(BINFILE)
	qemu-system-x86_64 -drive file=$?,format=raw


# remove compiled files
clean:
	rm $(LINKEDFILE) $(OBJFILE) $(BINFILE) 
