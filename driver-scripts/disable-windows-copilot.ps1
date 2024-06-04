Write-Host("`nDISABLE WINDOWS COPILOT") -ForegroundColor Green
Write-Host("-----------------------")

$registry_path = "HKCU\SOFTWARE\Policies\Microsoft\Windows\Windowscopilot"
$value_name = "TurnOffWindowscopilot"
$value_data = 1
$property_type = "DWORD"

New-ItemProperty -Path $registry_path -Name $value_name -Value $value_data -PropertyType $property_type -Force

Write-Host("The key $value_name has been enabled!")