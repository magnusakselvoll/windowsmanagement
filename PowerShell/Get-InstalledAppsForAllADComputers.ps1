param (
   [Parameter(Mandatory=$true)]
   [string]$OutputFilePath,
   [Parameter(Mandatory=$false)]
   [switch]$Force
)


$computers = Get-ADComputer -Filter *

if (Test-Path($OutputFilePath))
{
    if ($Force)
    {
        Write-Verbose "Deleting file $OutputFilePath"
        Remove-Item $OutputFilePath -Force
    }
    else
    {
        Write-Error "$OutputFilePath already exists. Use a different file name or overwrite using -Force"
        return 1
    }
}

foreach ($computer in $computers)
{
    Invoke-command -ComputerName $($computer.Name) {
        Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Where-Object {$_.DisplayName} | Select-Object DisplayName, DisplayVersion, Publisher, InstallDate | Sort-Object DisplayName
    } | Export-Csv $OutputFilePath -Append
}
