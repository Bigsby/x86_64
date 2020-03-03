BOOT = boot
SFILE = $(BOOT).S
INTFILE = $(BOOT).o
BINFILE = $(BOOT).bin

$(BINFILE): $(INTFILE)
	$(info calling ld ...)
	ld -o $@ --oformat binary -e _start $?

$(INTFILE): $(SFILE)
	$(info calling as ...)
	as -o $@ $?

run: $(BINFILE)
	qemu-system-x86_64 -curses -drive file=$?,format=raw
clean:
	rm $(INTFILE) $(BINFILE) 
