local Dbus = require("dbus-lua").dbus

local M = {}

local spotify_events = {
	["play"] = "Play",
	["pause"] = "Pause",
	["previous"] = "Previous",
	["next"] = "Next",
}
---
---@param event string
local function send_event_spotify(event)
	local event_name = spotify_events[event]

	local dbus = Dbus:new()
	assert(dbus:connect())

	dbus:call_method({
		path = "/org/mpris/MediaPlayer2",
		interface = "org.mpris.MediaPlayer2.Player",
		member = event_name,
		destination = "org.mpris.MediaPlayer2.spotify",
	})
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
