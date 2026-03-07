if ($PSVersionTable.PSVersion.Major -lt 7) {
    # Enable virtual console mode
    Add-Type @"
using System;
using System.Runtime.InteropServices;
public class VT {
    [DllImport("kernel32.dll")] public static extern IntPtr GetStdHandle(int nStdHandle);
    [DllImport("kernel32.dll")] public static extern bool GetConsoleMode(IntPtr hConsoleHandle, out int lpMode);
    [DllImport("kernel32.dll")] public static extern bool SetConsoleMode(IntPtr hConsoleHandle, int dwMode);
}
"@
    $handle = [VT]::GetStdHandle(-11)
    $mode = 0
    [VT]::GetConsoleMode($handle, [ref]$mode) > $null
    [VT]::SetConsoleMode($handle, $mode -bor 0x4) > $null
}

$esc = [char]27  # `e was added in PowerShell 6

foreach ($b in 40..47) {
    Write-Host -NoNewline "$esc[${b}m  "
}
Write-Host "$esc[0m"

foreach ($b in 100..107) {
    Write-Host -NoNewline "$esc[${b}m  "
}
Write-Host "$esc[0m"

foreach ($b in @(49) + (40..47) + (100..107)) {
    foreach ($f in @(39) + (30..37) + (90..97)) {
        Write-Host -NoNewline "$esc[$b;${f}m text "
    }
    Write-Host "$esc[0m"
}
