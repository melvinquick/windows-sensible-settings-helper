Write-Host("`n------------------------------------") -ForegroundColor Green
Write-Host("| WINDOWS SENSIBLE SETTINGS HELPER |") -ForegroundColor Green
Write-Host("------------------------------------") -ForegroundColor Green

Write-Host("`nPlease choose (y/n) to the following sensible settings options!") -ForegroundColor Cyan
$disable_windows_copilot = Read-Host("Disable Windows CoPilot")


if ($disable_windows_copilot.ToLower() -eq "y") {
    Invoke-WebRequest "https://raw.githubusercontent.com/melvinquick/windows-sensible-settings-helper/main/driver-scripts/disable-windows-copilot.ps1" | Invoke-Expression
}


Write-Host("`nScript has finished setting your desired sensible settings!") -ForegroundColor Cyan
