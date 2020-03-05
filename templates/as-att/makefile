# name of the entry file
BOOT = boot
# entry file with extension
ENTRYFILE = $(BOOT).S
# object file
OBJFILE = $(BOOT).o
# output binary file
BINFILE = $(BOOT).bin

# linker
$(BINFILE): $(OBJFILE)
	ld -o $@ --oformat binary --Ttext 0x7C00 -e _start $?

# assembler
$(OBJFILE): $(ENTRYFILE) *.S
	as -o $@ $<

# open boot.bin in qemu
run: $(BINFILE)
	qemu-system-x86_64 -curses -drive file=$?,format=raw
run-graphic: $(BINFILE)
	qemu-system-x86_64 -drive file=$?,format=raw


# remove result files
clean:
	rm $(OBJFILE) $(BINFILE) 
