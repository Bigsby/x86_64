video-memory.bin: video-memory.asm
	nasm -f bin -o video-memory.bin video-memory.asm

run: video-memory.bin
	qemu-system-x86_64 -drive file=video-memory.bin,format=raw	
