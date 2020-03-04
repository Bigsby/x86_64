BOOT = boot
SFILE = $(BOOT).S
OBJFILE = $(BOOT).o
BINFILE = $(BOOT).bin

$(BINFILE): $(OBJFILE)
	ld -o $@ --oformat binary -e _start $?

$(OBJFILE): *.S
	as -mmnemonic=intel -msyntax=intel -mnaked-reg -o $@ $(SFILE)

run: $(BINFILE)
	qemu-system-x86_64 -curses -drive file=$?,format=raw

clean:
	rm $(OBJFILE) $(BINFILE) 
