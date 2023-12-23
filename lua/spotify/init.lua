M = {}


local function play()
	os.execute(
		"dbus-send --session --type=method_call --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Play"
	)
end

local function pause()
	os.execute(
		"dbus-send --session --type=method_call --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Pause"
	)
end

local commands = {
	["play"] = play,
	["pause"] = pause
}

local function command(opts)
	local subcommand = opts.fargs[1]

	if not subcommand then
		subcommand = "play"
	end

	commands[subcommand]()
end

local function command_complete()
	return vim.tbl_keys(commands)
end


M.setup = function()
	vim.api.nvim_create_user_command("Spotify", command, {
		nargs = "?",
		complete = command_complete,
		desc = "Command entrypoint for spotify",
		force = true,
	})
end

return M
