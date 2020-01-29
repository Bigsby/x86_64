```
ghex first.bin 
```

```
hexdump first.bin 
```

```
qemu-system-x86_64 first.bin
```

```
qemu-system-x86_64 -drive file=first.bin,format=raw
```

```
qemu-system-x86_64 -nographic -drive file=first.bin,format=raw
```

In Qemu, go to monitor:
- `Ctrl`+`Alt`+2

[Qemu Monitor docs](https://en.wikibooks.org/wiki/QEMU/Monitor)

