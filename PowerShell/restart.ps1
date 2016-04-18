param (
   [string]$machine = $( Read-Host "Input machine to restart" ),
   [string]$time = $( Read-Host "Input time to restart, as hh:mm" )
)

$timeAsDate = [datetime]$time

$timeSpan = New-TimeSpan -End $timeAsDate

if ($timeSpan.Ticks -lt 0)
{
  $oneDay = New-TimeSpan -Days 1
  $timeSpan = $timeSpan.Add($oneDay)
}

$secondsToWait = [int]($timeSpan.TotalSeconds)

shutdown /r /m \\$machine /t $secondsToWait

Write-Host "$machine will restart in $secondsToWait seconds ($timeAsDate)"
