# name of the entry file
BOOT = boot
# entry file with extension
SFILE = $(BOOT).S
# object file
OBJFILE = $(BOOT).o
# output binary file
BINFILE = $(BOOT).bin

$(BINFILE): boot.ld
	objcopy -O binary -j .text $? $@

# linker
boot.ld: $(OBJFILE)
	ld -r -o $@ -Ttext 0x7C00 -s -e _start $?

# assembler
$(OBJFILE): *.S
	$(info sfile: $(SFILE))
	as -o $@ $(SFILE)

# open boot.bin in qemu
run: $(BINFILE)
	qemu-system-x86_64 -curses -drive file=$?,format=raw
run-graphic: $(BINFILE)
	qemu-system-x86_64 -drive file=$?,format=raw


# remove result files
clean:
	rm $(OBJFILE) $(BINFILE) 
