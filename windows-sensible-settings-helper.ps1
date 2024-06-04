Write-Host("`n------------------------------------") -ForegroundColor Green
Write-Host("| WINDOWS SENSIBLE SETTINGS HELPER |") -ForegroundColor Green
Write-Host("------------------------------------") -ForegroundColor Green

# * Get version of Windows this is being run on
$windows_version = (Get-WmiObject Win32_OperatingSystem).Caption

Write-Host("`nYou're current Windows version is $windows_version. You'll only be presented with options that can be set on your system!")

# * Using the Windows Version from earlier, check to make sure this script is able to be used on that version
# * If not, end the script with a message letting the user know what happened
if ($windows_version.StartsWith("Microsoft Windows 10") -or $windows_version.StartsWith("Microsoft Windows 11")) {

    Write-Host("`nPlease choose (y/n) to the following sensible settings options!") -ForegroundColor Cyan

    $disable_teredo = Read-Host("Disable Teredo")

    if ($windows_version.StartsWith("Microsoft Windows 11")) {
        $disable_windows_copilot = Read-Host("Disable Windows CoPilot")
    }
}
else {
    Write-Host("This script is only compatible with Windows 10 and Windows 11. Unfortunately, you're Windows Version is $windows_version!")
    Write-Host("Script will now exit...")
    exit
}


# * These if statements should only be gotten into if the user explicitly answered "y" or "Y" to the options they were given
if ($disable_teredo.ToLower() -eq "y") {
    Invoke-WebRequest "https://raw.githubusercontent.com/melvinquick/windows-sensible-settings-helper/main/driver-scripts/disable-teredo.ps1" | Invoke-Expression
}
if ($disable_windows_copilot.ToLower() -eq "y") {
    Invoke-WebRequest "https://raw.githubusercontent.com/melvinquick/windows-sensible-settings-helper/main/driver-scripts/disable-windows-copilot.ps1" | Invoke-Expression
}


Write-Host("`nScript has finished setting your desired sensible settings!") -ForegroundColor Cyan
