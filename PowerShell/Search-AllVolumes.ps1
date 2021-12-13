#Requires -RunAsAdministrator

param (
   [Parameter(Mandatory=$true)]
   [string]$Filter
)

$volumes = Get-Volume | Where-Object {
    $_.DriveType -eq 'Fixed' -and
    $_.DriveLetter
} | Select-Object -Expand DriveLetter | Sort-Object

foreach ($volume in $volumes)
{
    Write-Host "Searching drive $volume"

    Get-ChildItem  -Path "$($volume):\" -Filter $Filter -Recurse -ErrorAction SilentlyContinue -Force
}