# Summary
This is a Powershell module meant to replicate the functionality of the very old Microsoft executable, uptime.exe.

# Usage
1. Download Get-UptimeHistory.psm1
2. Import it: `Import-Module "c:\path\to\script\Get-UptimeHistory.psm1"`
3. Use it, e.g.: `Get-UptimeHistory -ComputerName "computer-name-01"`

# Example output
```
C:\Users\mseng3>Get-UptimeHistory localhost

Date                  Event                              Comment
----                  -----                              -------
10/18/2019 6:36:22 PM Boot                               Downtime was: unknown
10/18/2019 6:39:40 PM Shutdown                             Uptime was: 0d 00h 03m 17s 857ms
10/18/2019 6:40:16 PM Boot                               Downtime was: 0d 00h 00m 36s 253ms
10/20/2019 1:31:26 AM Shutdown                             Uptime was: 1d 06h 51m 09s 375ms
10/20/2019 1:31:55 AM Boot                               Downtime was: 0d 00h 00m 29s 401ms
10/26/2019 3:58:34 PM Shutdown                             Uptime was: 6d 14h 26m 38s 455ms
10/26/2019 3:59:06 PM Boot                               Downtime was: 0d 00h 00m 32s 105ms
11/3/2019 2:38:33 PM  Recovered from unexpected shutdown   Uptime was: unknown
11/3/2019 2:38:33 PM  Boot                               Downtime was: unknown
11/17/2019 3:41:43 AM Shutdown                             Uptime was: 13d 13h 03m 10s 529ms
11/17/2019 3:42:12 AM Boot                               Downtime was: 0d 00h 00m 28s 899ms
12/4/2019 5:56:25 PM  Shutdown                             Uptime was: 17d 14h 14m 13s 091ms
12/4/2019 5:56:56 PM  Boot                               Downtime was: 0d 00h 00m 30s 342ms
12/13/2019 3:33:27 AM Shutdown                             Uptime was: 8d 09h 36m 31s 513ms
12/13/2019 3:33:59 AM Boot                               Downtime was: 0d 00h 00m 31s 295ms
12/29/2019 3:47:55 PM Recovered from unexpected shutdown   Uptime was: unknown
12/29/2019 3:47:55 PM Boot                               Downtime was: unknown
12/29/2019 4:20:54 PM Shutdown                             Uptime was: 0d 00h 32m 58s 704ms
12/29/2019 4:21:23 PM Boot                               Downtime was: 0d 00h 00m 29s 237ms
12/30/2019 7:24:15 PM Shutdown                             Uptime was: 1d 03h 02m 51s 886ms
12/30/2019 7:25:13 PM Boot                               Downtime was: 0d 00h 00m 58s 142ms
1/2/2020 12:55:04 AM  Shutdown                             Uptime was: 2d 05h 29m 50s 584ms
1/2/2020 12:55:30 AM  Boot                               Downtime was: 0d 00h 00m 26s 727ms
1/4/2020 12:24:42 PM  Recovered from unexpected shutdown   Uptime was: unknown
1/4/2020 12:24:42 PM  Boot                               Downtime was: unknown
1/5/2020 2:11:11 PM   Recovered from unexpected shutdown   Uptime was: unknown
1/5/2020 2:11:11 PM   Boot                               Downtime was: unknown
1/16/2020 10:30:16 PM Shutdown                             Uptime was: 11d 08h 19m 05s 623ms
1/16/2020 10:30:45 PM Boot                               Downtime was: 0d 00h 00m 28s 935ms
2/13/2020 11:03:51 PM Shutdown                             Uptime was: 28d 00h 33m 06s 200ms
2/13/2020 11:04:45 PM Boot                               Downtime was: 0d 00h 00m 53s 725ms
3/13/2020 3:32:00 AM  Shutdown                             Uptime was: 28d 04h 27m 14s 819ms
3/13/2020 3:32:32 AM  Boot                               Downtime was: 0d 00h 00m 31s 947ms
3/15/2020 9:12:26 AM  Shutdown                             Uptime was: 2d 05h 39m 53s 939ms
3/15/2020 9:13:20 AM  Boot                               Downtime was: 0d 00h 00m 53s 990ms
3/15/2020 9:15:20 AM  Shutdown                             Uptime was: 0d 00h 02m 00s 048ms
3/15/2020 9:15:48 AM  Boot                               Downtime was: 0d 00h 00m 28s 205ms
3/15/2020 9:34:14 AM  Shutdown                             Uptime was: 0d 00h 18m 26s 104ms
3/15/2020 9:34:43 AM  Boot                               Downtime was: 0d 00h 00m 29s 042ms
3/15/2020 9:34:47 AM  Shutdown                             Uptime was: 0d 00h 00m 03s 877ms
3/15/2020 9:35:16 AM  Boot                               Downtime was: 0d 00h 00m 29s 061ms
3/22/2020 6:00:51 PM  Shutdown                             Uptime was: 7d 08h 25m 34s 406ms
3/22/2020 6:01:44 PM  Boot                               Downtime was: 0d 00h 00m 53s 204ms
4/18/2020 3:40:38 AM  Shutdown                             Uptime was: 26d 09h 38m 54s 406ms
4/18/2020 3:41:12 AM  Boot                               Downtime was: 0d 00h 00m 34s 171ms
4/23/2020 6:56:05 PM  Shutdown                             Uptime was: 5d 15h 14m 52s 371ms
4/23/2020 6:56:32 PM  Boot                               Downtime was: 0d 00h 00m 27s 577ms

C:\Users\mseng3>
```

# Notes
- It uses events 6005, 6006, and 6008 as authoritative proof of boots and shutdowns. See the script comments for documentation on the various relevant event IDs.
- Currently it doesn't account for timezones, or do any of the fancy stats math that uptime.exe does. However, it returns a proper array of PowerShell objects, so that stuff could be done after the fact.
- It does account for unexpected shutdowns.
- Use "localhost" to get history for the local computer.
- By mseng3