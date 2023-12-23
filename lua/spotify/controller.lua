local M = {}

local spotify_events = {
		["play"] = "org.mpris.MediaPlayer2.Player.Play",
		["pause"] = "org.mpris.MediaPlayer2.Player.Pause",
		["previous"] = "org.mpris.MediaPlayer2.Player.Previous",
		["next"] = "org.mpris.MediaPlayer2.Player.Next",
}
---
---@param event string
local function send_event_spotify(event)
		local event_name = spotify_events[event]

		local shell_command =
		"dbus-send --session --type=method_call --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 " ..
		event_name

		os.execute(shell_command)
end

M.play = function()
	send_event_spotify("play")
end

M.pause = function()
	send_event_spotify("pause")
end

M.previous_track = function()
	send_event_spotify("previous")
end

M.next_track = function()
	send_event_spotify("next")
end


return M
