Write-Host("`nDISABLE WINDOWS COPILOT") -ForegroundColor Green
Write-Host("-----------------------")

$registry_path = "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Windowscopilot"
$value_name = "TurnOffWindowscopilot"
$value_data = 1
$property_type = "DWORD"

if (!(Test-Path -Path $registry_path -PathType Container)){
    New-Item -Path $registry_path -Force | Out-Null
}

New-ItemProperty -Path $registry_path -Name $value_name -Value $value_data -PropertyType $property_type -Force | Out-Null

Write-Host("The key $value_name has been enabled!")