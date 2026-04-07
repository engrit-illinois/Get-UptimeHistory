# Summary
This is a Powershell module meant to roughly replicate the functionality of the very old Microsoft executable, uptime.exe, while outputting proper PowerShell object data.  

# Usage
1. Download `Get-UptimeHistory.psm1` to the appropriate subdirectory of your PowerShell [modules directory](https://github.com/engrit-illinois/how-to-install-a-custom-powershell-module).
2. Use it, e.g.: `Get-UptimeHistory -ComputerName "computer-name-01"`

# Parameters

### -ComputerName [string]
Required string.  
The name of the target computers.  

### -PassThru
Optional switch.  
Returns the entire gathered and calculated set of data, rather than just a summary of select attributes.  

# Examples

### Basic example and output
```powershell
Get-UptimeHistory localhost | Format-Table -Wrap
```

```
> Get-UptimeHistory localhost | Format-Table -Wrap

Computer  TimeCreated           Id Event               Interval                            Type       Process                                                   User                Reason                                    Comment
--------  -----------           -- -----               --------                            ----       -------                                                   ----                ------                                    -------
localhost 12/18/2025 18:21:44 6005 Boot                Downtime was: unknown
localhost 12/18/2025 18:23:04 1074 Shutdown initiation                                     restart    C:\WINDOWS\system32\winlogon.exe                          NT AUTHORITY\SYSTEM Operating System: Upgrade (Planned)
localhost 12/18/2025 18:23:04 6006 Shutdown            Uptime was:   0d 00h 01m 20s 028ms  restart    C:\WINDOWS\system32\winlogon.exe                          NT AUTHORITY\SYSTEM Operating System: Upgrade (Planned)
localhost 12/18/2025 18:23:47 6005 Boot                Downtime was: 0d 00h 00m 43s 581ms  restart    C:\WINDOWS\system32\winlogon.exe                          NT AUTHORITY\SYSTEM Operating System: Upgrade (Planned)
localhost 12/19/2025 09:30:25 1074 Shutdown initiation                                     restart    C:\WINDOWS\uus\AMD64\MoNotificationUx.exe                 UOFI\mseng3         Operating System: Service pack (Planned)
localhost 12/19/2025 09:33:06 6006 Shutdown            Uptime was:   0d 15h 09m 18s 651ms  restart    C:\WINDOWS\uus\AMD64\MoNotificationUx.exe                 UOFI\mseng3         Operating System: Service pack (Planned)
localhost 12/19/2025 09:41:41 6005 Boot                Downtime was: 0d 00h 08m 34s 814ms  restart    C:\WINDOWS\uus\AMD64\MoNotificationUx.exe                 UOFI\mseng3         Operating System: Service pack (Planned)
localhost 12/19/2025 09:42:43 1074 Shutdown initiation                                     restart    C:\WINDOWS\servicing\TrustedInstaller.exe                 NT AUTHORITY\SYSTEM Operating System: Upgrade (Planned)
localhost 12/19/2025 09:42:44 6006 Shutdown            Uptime was:   0d 00h 01m 02s 736ms  restart    C:\WINDOWS\servicing\TrustedInstaller.exe                 NT AUTHORITY\SYSTEM Operating System: Upgrade (Planned)
localhost 12/19/2025 09:43:25 6005 Boot                Downtime was: 0d 00h 00m 40s 998ms  restart    C:\WINDOWS\servicing\TrustedInstaller.exe                 NT AUTHORITY\SYSTEM Operating System: Upgrade (Planned)
localhost 01/14/2026 11:14:25 1074 Shutdown initiation                                     restart    C:\WINDOWS\uus\AMD64\MoNotificationUx.exe                 UOFI\mseng3         Operating System: Service pack (Planned)
localhost 01/14/2026 11:15:29 6006 Shutdown            Uptime was:   26d 01h 32m 04s 713ms restart    C:\WINDOWS\uus\AMD64\MoNotificationUx.exe                 UOFI\mseng3         Operating System: Service pack (Planned)
localhost 01/14/2026 11:16:16 6005 Boot                Downtime was: 0d 00h 00m 46s 463ms  restart    C:\WINDOWS\uus\AMD64\MoNotificationUx.exe                 UOFI\mseng3         Operating System: Service pack (Planned)
localhost 01/14/2026 11:16:46 1074 Shutdown initiation                                     restart    C:\WINDOWS\servicing\TrustedInstaller.exe                 NT AUTHORITY\SYSTEM Operating System: Upgrade (Planned)
localhost 01/14/2026 11:16:47 6006 Shutdown            Uptime was:   0d 00h 00m 31s 049ms  restart    C:\WINDOWS\servicing\TrustedInstaller.exe                 NT AUTHORITY\SYSTEM Operating System: Upgrade (Planned)
localhost 01/14/2026 11:17:29 6005 Boot                Downtime was: 0d 00h 00m 42s 255ms  restart    C:\WINDOWS\servicing\TrustedInstaller.exe                 NT AUTHORITY\SYSTEM Operating System: Upgrade (Planned)
localhost 02/05/2026 16:45:29 1074 Shutdown initiation                                     power off  C:\WINDOWS\Explorer.EXE                                   UOFI\mseng3         Other (Planned)
localhost 02/05/2026 17:03:15 6006 Shutdown            Uptime was:   22d 05h 45m 45s 434ms power off  C:\WINDOWS\Explorer.EXE                                   UOFI\mseng3         Other (Planned)
localhost 02/05/2026 17:04:07 6005 Boot                Downtime was: 0d 00h 00m 52s 615ms  power off  C:\WINDOWS\Explorer.EXE                                   UOFI\mseng3         Other (Planned)
localhost 02/07/2026 17:49:51 1074 Shutdown initiation                                     restart    C:\WINDOWS\system32\winlogon.exe                          NT AUTHORITY\SYSTEM No title for this reason could be found
localhost 02/07/2026 17:50:07 6006 Shutdown            Uptime was:   2d 00h 46m 00s 102ms  restart    C:\WINDOWS\system32\winlogon.exe                          NT AUTHORITY\SYSTEM No title for this reason could be found
localhost 02/07/2026 17:50:57 6005 Boot                Downtime was: 0d 00h 00m 49s 326ms  restart    C:\WINDOWS\system32\winlogon.exe                          NT AUTHORITY\SYSTEM No title for this reason could be found
localhost 02/11/2026 21:15:09 1074 Shutdown initiation                                     restart    C:\WINDOWS\uus\AMD64\MoUsoCoreWorker.exe                  NT AUTHORITY\SYSTEM Operating System: Service pack (Planned)
localhost 02/11/2026 21:16:45 6006 Shutdown            Uptime was:   4d 03h 25m 48s 083ms  restart    C:\WINDOWS\uus\AMD64\MoUsoCoreWorker.exe                  NT AUTHORITY\SYSTEM Operating System: Service pack (Planned)
localhost 02/11/2026 21:17:37 6005 Boot                Downtime was: 0d 00h 00m 52s 210ms  restart    C:\WINDOWS\uus\AMD64\MoUsoCoreWorker.exe                  NT AUTHORITY\SYSTEM Operating System: Service pack (Planned)
localhost 02/11/2026 21:18:24 1074 Shutdown initiation                                     restart    C:\WINDOWS\servicing\TrustedInstaller.exe                 NT AUTHORITY\SYSTEM Operating System: Upgrade (Planned)
localhost 02/11/2026 21:18:25 6006 Shutdown            Uptime was:   0d 00h 00m 47s 973ms  restart    C:\WINDOWS\servicing\TrustedInstaller.exe                 NT AUTHORITY\SYSTEM Operating System: Upgrade (Planned)
localhost 02/11/2026 21:19:16 6005 Boot                Downtime was: 0d 00h 00m 50s 611ms  restart    C:\WINDOWS\servicing\TrustedInstaller.exe                 NT AUTHORITY\SYSTEM Operating System: Upgrade (Planned)
localhost 03/12/2026 03:29:16 1074 Shutdown initiation                                     restart    C:\WINDOWS\uus\packages\preview\AMD64\MoUsoCoreWorker.exe NT AUTHORITY\SYSTEM Operating System: Service pack (Planned)
localhost 03/12/2026 03:30:49 6006 Shutdown            Uptime was:   28d 06h 11m 33s 852ms restart    C:\WINDOWS\uus\packages\preview\AMD64\MoUsoCoreWorker.exe NT AUTHORITY\SYSTEM Operating System: Service pack (Planned)
localhost 03/12/2026 03:31:41 6005 Boot                Downtime was: 0d 00h 00m 51s 546ms  restart    C:\WINDOWS\uus\packages\preview\AMD64\MoUsoCoreWorker.exe NT AUTHORITY\SYSTEM Operating System: Service pack (Planned)
localhost 03/12/2026 03:32:24 1074 Shutdown initiation                                     restart    C:\WINDOWS\servicing\TrustedInstaller.exe                 NT AUTHORITY\SYSTEM Operating System: Upgrade (Planned)
localhost 03/12/2026 03:32:24 6006 Shutdown            Uptime was:   0d 00h 00m 43s 540ms  restart    C:\WINDOWS\servicing\TrustedInstaller.exe                 NT AUTHORITY\SYSTEM Operating System: Upgrade (Planned)
localhost 03/12/2026 03:33:15 6005 Boot                Downtime was: 0d 00h 00m 50s 281ms  restart    C:\WINDOWS\servicing\TrustedInstaller.exe                 NT AUTHORITY\SYSTEM Operating System: Upgrade (Planned)
localhost 03/13/2026 04:08:35 1074 Shutdown initiation                                     restart    C:\WINDOWS\Explorer.EXE                                   UOFI\mseng3         Other (Planned)
localhost 03/13/2026 04:08:57 6006 Shutdown            Uptime was:   1d 00h 35m 42s 693ms  restart    C:\WINDOWS\Explorer.EXE                                   UOFI\mseng3         Other (Planned)
localhost 03/13/2026 04:09:49 6005 Boot                Downtime was: 0d 00h 00m 51s 458ms  restart    C:\WINDOWS\Explorer.EXE                                   UOFI\mseng3         Other (Planned)
localhost 03/31/2026 06:00:29 1074 Shutdown initiation                                     restart    C:\WINDOWS\uus\packages\preview\AMD64\MoUsoCoreWorker.exe NT AUTHORITY\SYSTEM Operating System: Service pack (Planned)
localhost 03/31/2026 06:00:55 6006 Shutdown            Uptime was:   18d 01h 51m 05s 833ms restart    C:\WINDOWS\uus\packages\preview\AMD64\MoUsoCoreWorker.exe NT AUTHORITY\SYSTEM Operating System: Service pack (Planned)
localhost 03/31/2026 06:01:47 6005 Boot                Downtime was: 0d 00h 00m 52s 419ms  restart    C:\WINDOWS\uus\packages\preview\AMD64\MoUsoCoreWorker.exe NT AUTHORITY\SYSTEM Operating System: Service pack (Planned)
```

### Advanced example 1
Pull the uptime histories of multiple machines and return just their latest X boot times:  
```powershell
$query = "comp-name-*"
$searchBase = "OU=Instructional,OU=Desktops,OU=Engineering,OU=Urbana,DC=ad,DC=uillinois,DC=edu"
$returnLast = 1

$comps = Get-ADComputer -Filter "name -like '$query'" -SearchBase $searchBase
$data = $comps | ForEach-Object -TimeoutSeconds 300 -ThrottleLimit 50 -Parallel {
    $_ | Add-Member -PassThru -Force -NotePropertyName "_UptimeHistory" -NotePropertyValue (Get-UptimeHistory -ComputerName $_.Name -ErrorAction Ignore | Sort TimeCreated)
}
$summary = $data | Sort Name | Select Name,@{Name="LatestBoot";Expression={$_._UptimeHistory | Select -ExpandProperty TimeCreated | Select -Last $returnLast}}
$summary
```

Export results to a CSV:
```powershell
#$ts = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
#$summary | Export-Csv -NoTypeInformation -Encoding "Ascii" -Path "c:\engrit\logs\UptimeHistory_$($ts).csv"
```

### Advanced example 2
Pull the latest X full events from multiple machines. Accompished slightly differently and supports multiple queries.  
```powershell
$queries = "comp-name-*","comp-name2-*","comp-name3-01"
$searchBase = "OU=Instructional,OU=Desktops,OU=Engineering,OU=Urbana,DC=ad,DC=uillinois,DC=edu"
$returnLast = 1

$comps = $queries | ForEach-Object { Get-ADComputer -SearchBase $searchBase -Filter "name -like `"$_`"" -Properties "*" }
$result = $comps | ForEach-Object -ThrottleLimit 50 -Parallel {
    $comp = $_.Name
    $events = [PSCustomObject]@{"Computer"=$comp;"TimeCreated"=$null;"Event"=$null;"Comment"=$null}
    try { $events = Get-UptimeHistory $comp }
    catch { $events.Comment = $_.Exception.Message }
    $events | Sort "TimeCreated" | Select -Last $using:returnLast
}
$result | Sort "Computer","TimeCreated" | Format-Table -AutoSize
```

### Advanced example 3
Pull all "unexpected shutdown" events from multiple machines. Useful for finding machines with hardware issues.  
```powershell
$queries = "comp-name-*","comp-name2-*","comp-name3-01"
$searchBase = "OU=Instructional,OU=Desktops,OU=Engineering,OU=Urbana,DC=ad,DC=uillinois,DC=edu"

$comps = $queries | ForEach-Object { Get-ADComputer -SearchBase $searchBase -Filter "name -like `"$_`"" -Properties "*" }
$result = $comps | ForEach-Object -ThrottleLimit 50 -Parallel {
    $returnLast = $using:returnLast
    $comp = $_.Name
    $events = [PSCustomObject]@{"Computer"=$comp;"TimeCreated"=$null;"Event"=$null;"Comment"=$null}
    try { $events = Get-UptimeHistory $comp }
    catch { $events.Comment = $_.Exception.Message }
    $events | Sort "TimeCreated"
}
$result | Sort "Computer","TimeCreated" | Where { $_.Event -eq "Recovered from unexpected shutdown" } | Format-Table -AutoSize
```

# Interpretation
Here are some common shutdown initiation events and what they actually mean:

### Reboot triggered by custom recurring MECM deployment to perform nightly reboots
Currently this is only used on test machines in the CBTF.  

- Process: C:\windows\system32\wbem\wmiprvse.exe
- User: NT AUTHORITY\SYSTEM
- Reason: No title for this reason could be found

### Reboot triggered by MECM to complete software or OS updates
Should only happen during configured maintenance window.  

- Process: C:\Windows\CCM\CcmExec.exe
- User: NT AUTHORITY\SYSTEM
- Reason: No title for this reason could be found

### Reboot triggered by Windows to complete pending OS updates
This is what it should look like any time Windows reboots itself during (or after) the actual update process. I believe the initial reboot will look different.  

For machines using MECM ADRs for OS updates the initial reboot would be triggered by MECM during a maintenance window (or by a user outside of the maintenance window). Once rebooted, Windows will start the pending update process and this event should only be seen when Windows has to initiate a second (or third, etc.) reboot after completing the update process.  

- Process: C:\windows\servicing\TrustedInstaller.exe
- User: NT AUTHORITY\SYSTEM
- Reason: Operating System: Upgrade (Planned)

### Reboot triggered by a user from the Start menu
- Process: C:\Windows\System32\RuntimeBroker.exe
- User: \<actual user\>
- Reason: Other (Unplanned)

### Reboot triggered by a user from the Start menu
- Process: C:\Windows\SystemApps\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\StartMenuExperienceHost.exe
- User: \<actual user\>
- Reason: Other (Unplanned)

### Reboot triggered by a user from the login screen when there's no active login session
- Process: C:\windows\system32\winlogon.exe
- User: NT AUTHORITY\SYSTEM
- Reason: No title for this reason could be found

### Reboot triggered by a user from the lock screen when there's an active, locked login session
- Process: C:\windows\system32\winlogon.exe
- User: \<actual user\>
- Reason: No title for this reason could be found

### Reboot triggered by the Windows notification system
I'm guessing this is when the notification system prompts the user to restart (after installing updates) and the user clicks to agree.  

- Process: C:\WINDOWS\uus\AMD64\MoNotificationUx.exe
- User: \<actual user\>
- Reason: Operating System: Service pack (Planned)

### Reboot triggered by the Windows Update Orchestrator system
This event likely occurs when Windows automatically reboots itself to initially start updates. This shouldn't happen for machines configured to use MECM ADRs for OS updates.  

- Process: C:\WINDOWS\uus\AMD64\MoUsoCoreWorker.exe (or C:\WINDOWS\uus\packages\preview\AMD64\MoUsoCoreWorker.exe)
- User: NT AUTHORITY\SYSTEM
- Reason: Operating System: Service pack (Planned)

### Not sure, possibly triggered by pressing the power button?
- Process: C:\Windows\system32\shutdown.exe
- User: NT AUTHORITY\SYSTEM
- Reason: No title for this reason could be found
- Interpretation: Not sure where this one comes from, but it might be from physically pressing the power button.

# Notes
- It uses events 6005, 6006, and 6008 as authoritative proof of boots and shutdowns. See the script comments for documentation on the various relevant event IDs.
- Currently it doesn't account for timezones, or do any of the fancy stats math that uptime.exe does. However, it returns a proper array of PowerShell objects, so that stuff could be done after the fact.
- It does account for unexpected shutdowns.
- Use "localhost" to get history for the local computer.
- By mseng3. See my other projects here: https://github.com/mmseng/code-compendium.
