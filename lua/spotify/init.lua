M = {}

local controller = require("spotify.controller")

local commands = {
	["play"] = controller.play,
	["pause"] = controller.pause,
	["previous"] = controller.previous_track,
	["next"] = controller.next_track,
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
