video-memory.bin: video-memory.asm
	nasm -f bin -o video-memory.bin video-memory.asm

run: video-memory.bin
	qemu-system-x86_64 -drive file=video-memory.bin,format=raw	

runno: video-memory.bin
	qemu-system-x86_64 -nographic -drive file=video-memory.bin,format=raw	

runcur: video-memory.bin
	qemu-system-x86_64 -curses -drive file=video-memory.bin,format=raw	

runmontel: video-memory.bin
	qemu-system-x86_64 -drive file=video-memory.bin,format=raw -monitor telnet:127.0.01:55555,server,nowait;

runmontcp: video-memory.bin
	qemu-system-x86_64 -drive file=video-memory.bin,format=raw -monitor tcp:127.0.01:55555,server,nowait;

runmonunix: video-memory.bin
	qemu-system-x86_64 -drive file=video-memory.bin,format=raw -monitor unix:qemu-monitor-socket,server,nowait;
# connect
# socat -,echo=0,icanon=0 unix-connect:qemu-monitor-socket

