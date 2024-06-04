Write-Host("`nDISABLE TEREDO") -ForegroundColor Green
Write-Host("--------------")

$registry_path = "HKLM:\Software\Policies\Microsoft\Windows\TCPIP\v6Transition"
$value_name = "Teredo_State"
$value_data = "Disabled"
$property_type = "STRING"

if (!(Test-Path -Path $registry_path -PathType Container)){
    New-Item -Path $registry_path -Force | Out-Null
}

New-ItemProperty -Path $registry_path -Name $value_name -Value $value_data -PropertyType $property_type -Force | Out-Null

Write-Host("The key $value_name has been enabled!")