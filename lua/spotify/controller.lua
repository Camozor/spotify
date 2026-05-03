local Dbus = require("dbus-lua").dbus

local M = {}

local spotify_events = {
	["play"] = "Play",
	["pause"] = "Pause",
	["previous"] = "Previous",
	["next"] = "Next",
	["raise"] = "Raise",
	["quit"] = "Quit",
}

local dbus = Dbus:new()
assert(dbus:connect())

---@param event string
local function send_player_event(event)
	local event_name = spotify_events[event]

	dbus:call_method({
		path = "/org/mpris/MediaPlayer2",
		interface = "org.mpris.MediaPlayer2.Player",
		member = event_name,
		destination = "org.mpris.MediaPlayer2.spotify",
	})
end

---@param event string
local function send_root_event(event)
	local event_name = spotify_events[event]

	dbus:call_method({
		path = "/org/mpris/MediaPlayer2",
		interface = "org.mpris.MediaPlayer2",
		member = event_name,
		destination = "org.mpris.MediaPlayer2.spotify",
	})
end

M.play = function()
	send_player_event("play")
end

M.pause = function()
	send_player_event("pause")
end

M.previous_track = function()
	send_player_event("previous")
end

M.next_track = function()
	send_player_event("next")
end

M.raise = function()
	send_root_event("raise")
end

M.quit = function()
	send_root_event("quit")
end

return M
