set clip to the clipboard -- save original clipboard contents

tell application "Safari"
	set n to number of tabs in front window
	set z to index of current tab of front window
end tell

repeat with i from z to n
	tell application "Safari"
		tell front window
			set current tab to tab i
		end tell
		set x to URL of current tab of front window
	end tell
	
	set the clipboard to x as string
	
	tell application "Stanza" to activate
	
	delay 2 -- pause a bit and let's catch up
	
	tell application "System Events"
		tell process "Stanza"
			keystroke "l" using command down
			keystroke "v" using command down
			keystroke return
		end tell
	end tell
	
	delay 1
end repeat

tell application "Safari" to activate -- return to Safari
set the clipboard to clip -- restore original clipboard contents