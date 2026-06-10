on run {input, parameters}
	tell application "Spotify"
		next track
		delay 0.3 -- brief pause for Spotify to fetch the new metadata
		set currentArtist to artist of current track
		set currentTrackName to name of current track
		display notification "by " & currentArtist with title currentTrackName
	end tell
	return input
end run
