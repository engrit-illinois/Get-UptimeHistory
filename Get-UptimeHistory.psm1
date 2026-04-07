# Documentation home: https://github.com/engrit-illinois/Get-UptimeHistory
# By mseng3

# https://serverfault.com/questions/702828/windows-server-restart-shutdown-history
# https://www.whatsupgold.com/blog/how-to-find-restart-info-for-machines-on-your-network-using-powershell-and-windows-event-logs

function Get-UptimeHistory {

	param(
		[Parameter(Mandatory=$true,Position=0)]
		[string]$ComputerName,
		[switch]$PassThru
	)

	$EVENT_IDS = @(
		# Actually corresponds to "The event log service was started."
		[PSCustomObject]@{id = 6005; name = "Boot"},
		
		# Actually corresponds to "The event log service was stopped."
		[PSCustomObject]@{id = 6006; name = "Shutdown"},
		
		# Corresponds to "The previous system shutdown was unexpected."
		[PSCustomObject]@{id = 6008; name = "Recovered from unexpected shutdown"}
		
		# Indicates the Windows product name, version, build number, service pack number, and operating system type detected at boot time.
		# Effectively redundant with event 6005
		#[PSCustomObject]@{id = 6009; name = "Boot"},
		
		# Displays the uptime of the computer.
		# Triggers at 12pm every day.
		# e.g. "The system uptime is 249700 seconds."
		#[PSCustomObject]@{id = 6013; name = "Noon uptime report"},
		
		# Actually corresponds to "The process X has initiated the restart / shutdown of computer on behalf of user Y for the following reason: Z."
		[PSCustomObject]@{id = 1074; name = "Shutdown initiation"}
		
		# Actually corresponds to "The reason supplied by user X for the last unexpected shutdown of this computer is: Y."
		#[PSCustomObject]@{id = 1076; name = "Shutdown reason"}
	)

	$filter = @{
		LogName = "System"
		#ProviderName = "EventLog" # For events 6005, 6006, 6008, 6009, and 6013
		#ProviderName = "User32" # For events 1074 and 1076
		Id = $EVENT_IDS.id
		#StartTime = $After
		#EndTime = $Before
	}
	
	$events = Get-WinEvent -ComputerName $ComputerName -FilterHashTable $filter
	
	# First sort by oldest first
	# Then sort by highest Event ID. This will ensure that unexpected shutdown messages (which happen upon boot)
	# come before the boot message, so it makes chronological sense
	$events = $events | Sort @{Expression="TimeCreated";Ascending=$true},@{Expression="Id";Descending=$true}
	
	$lastBoot = $null
	$lastShutdown = $null
	foreach($event in $events) {
		$eventString = ($EVENT_IDS | Where { $_.id -eq $event.Id }).name
		$event | Add-Member -NotePropertyName "Event" -NotePropertyValue $eventString
		
		$comment = ""
		if($event.Id -eq 6005) {
			$lastBoot = $event.TimeCreated
			if($lastShutdown) {
				$ts = New-Timespan -Start $lastShutdown -End $event.TimeCreated
				$elapsed = "{0}d {1:d2}h {2:d2}m {3:d2}s {4:d3}ms" -f $ts.Days, $ts.Hours, $ts.Minutes, $ts.Seconds, $ts.Milliseconds
				$interval = "Downtime was: $elapsed"
			}
			else {
				$interval = "Downtime was: unknown"
			}
		}

		if($event.Id -eq 6008) {
			$lastShutdown = $null
			$interval = "Uptime was:   unknown"
		}
		
		if($event.Id -eq 6006) {
			$lastShutdown = $event.TimeCreated
			if($lastBoot) {
				$ts = New-Timespan -Start $lastBoot -End $event.TimeCreated
				$elapsed = "{0}d {1:d2}h {2:d2}m {3:d2}s {4:d3}ms" -f $ts.Days, $ts.Hours, $ts.Minutes, $ts.Seconds, $ts.Milliseconds
				$interval = "Uptime was:   $elapsed"
			}
			else {
				$interval = "Uptime was:   unknown"
			}
		}
				
		if($event.Id -eq 1074) {
			# Example of event message:
			# The process C:\Windows\system32\winlogon.exe (CBTF-TESTVM-01) has initiated the restart of computer CBTF-TESTVM-01 on behalf of user NT AUTHORITY\SYSTEM for the following reason: Operating System: Upgrade (Planned)\n Reason Code: 0x80020003\n Shutdown Type: restart\n Comment: 
			$message = $event.Message
			
			# Combine into single line to avoid having to deal with line breaks:
			$message = $message.Replace("`n","")
			
			# Deconstruct message
			$regex = 'The process (.*) (\(.*\)) has initiated the (.*) of computer (.*) on behalf of user (.*) for the following reason: (.*) Reason Code: (.*) Shutdown Type: (.*) Comment: (.*)'
			$match = $message -match $regex
			
			if($match) {
				$process = $Matches[1]
				$shutdownType1 = $Matches[2]
				$comp1 = $Matches[3]
				$comp2 = $Matches[4]
				$user = $Matches[5]
				$reason = $Matches[6]
				$reasonCode = $Matches[7]
				$shutdownType2 = $Matches[8]
				$messageComment = $Matches[9] # This seems to basically always be blank
			}
			else {
				# Could not parse event message
			}
			
			$interval = ""
		}
		
		$event | Add-Member -NotePropertyName "Interval" -NotePropertyValue $interval
		$event | Add-Member -NotePropertyName "Type" -NotePropertyValue $shutdownType2
		$event | Add-Member -NotePropertyName "Process" -NotePropertyValue $process
		$event | Add-Member -NotePropertyName "User" -NotePropertyValue $user
		$event | Add-Member -NotePropertyName "Reason" -NotePropertyValue $reason
		$event | Add-Member -NotePropertyName "Comment" -NotePropertyValue $comment
		$event | Add-Member -NotePropertyName "Computer" -NotePropertyValue $ComputerName
	}
	
	if($PassThru) {
		$events
	}
	else {
		$events | Select Computer,TimeCreated,Id,Event,Interval,Type,Process,User,Reason,Comment
	}
}