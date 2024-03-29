# Windows management
Tools to assist in Windows IT Management

## PowerShell scripts
All of the following scripts must be run from a Windows PowerShell console.

### restart.ps1
A script to let you restart a Windows computer at a given time within the next
24 hours.

This script basically uses the native Windows "shutdown" command, but calculates
the number of seconds to wait from the given time.

Usage:
```
./restart.ps1 -machine <HOST> -time <TIME>
```
Where &lt;HOST&gt; is an IP or resolveable name and &lt;TIME&gt; is a point in
time within the next 24 hours. The script will, based on current time, detect if
that time is within the current day or next day, calculate the number of seconds
from now to that time and issue the corresponding shutdown command
(shutdown /r /m \\\\$machine /t $secondsToWait).

The script may also be used interactively by running it with no parameters:
```
./restart.ps1
```

### Search-AllVolumes.ps1 ###
A script written to search for a file across all fixed volumes on a computer.

Usage:
```
./Search-AllVolumes.ps1 -Filter *log4j-core*
```

Since the script only has one parameter, a shorter way to do the same:
```
./Search-AllVolumes.ps1 *log4j-core*
```

### Get-InstalledApps.ps1 ###
A script written to list all installed apps on a computer.

Usage:
```
./Get-InstalledApps.ps1
```

### Get-InstalledAppsForAllADComputers.ps1 ###
A script written to list all installed apps on all computers in an AD.

Usage:
```
./Get-InstalledAppsForAllADComputers.ps1 -OutputFilePath <FILENAME> [-Force]
```

Where &lt;FILENAME&gt; is the path you want to write the CSV data to.

Use -Force to overwrite the file.
