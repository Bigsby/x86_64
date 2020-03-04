BOOT = boot
SFILE = $(BOOT).S
INTFILE = $(BOOT).o
BINFILE = $(BOOT).bin

$(BINFILE): $(INTFILE)
	ld -o $@ --oformat binary -e _start $?

$(INTFILE): $(SFILE)
	as -o $@ $?

run: $(BINFILE)
	qemu-system-x86_64 -curses -drive file=$?,format=raw

clean:
	rm $(INTFILE) $(BINFILE) 
