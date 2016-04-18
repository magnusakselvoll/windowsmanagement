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
restart -machine <HOST> -time <TIME>
```
Where &lt;HOST&gt; is an IP or resolveable name and &lt;TIME&gt; is a point in
time within the next 24 hours. The script will, based on current time, detect if
that time is within the current day or next day, calculate the number of seconds
from now to that time and issue the corresponding shutdown command
(shutdown /r /m \\\\$machine /t $secondsToWait).

The script may also be used interactively by running it with no parameters:
```
restart
```
