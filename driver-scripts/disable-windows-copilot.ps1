Write-Host("`nDISABLE WINDOWS COPILOT") -ForegroundColor Green
Write-Host("-----------------------")

$registry_path = "HKCU\SOFTWARE\Policies\Microsoft\Windows\Windowscopilot"
$value_name = "TurnOffWindowscopilot"
$value_data = 1
$property_type = "DWORD"
$key_paths = $registry_path.Split('\')

foreach ($key_path in $key_paths){
    $full_path = Join-Path -Path ($key_paths[0..($key_paths.IndexOf($key_path) - 1)]) -ChildPath $key_path

    if (!(Test-Path -Path $full_path -PathType Container)){
        New-Item -Path $full_path -Force | Out-Null
    }

    $key_paths = $full_path
}

New-ItemProperty -Path $registry_path -Name $value_name -Value $value_data -PropertyType $property_type -Force

Write-Host("The key $value_name has been enabled!")