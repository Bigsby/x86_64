if ($args.Length -ne 1) {
    Write-Host "Invalid arguments"
    exit
} else {
    $inputFilePath = $args[0] + ".asm"
    if (Test-Path $inputFilePath -PathType Leaf) {
        $outputFilePath = $args[0] + ".bin"
        nasm -f bin -o $outputFilePath $inputFilePath
        qemu-system-x86_64 -drive file=$outputFilePath,format=raw
    } else {
        Write-Host "File not found!"
        exit
    }
}