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

--- @alias setup_opts {python_program_path: string}

---@param opts setup_opts
M.setup = function(opts)
	vim.api.nvim_create_user_command("Spotify", command, {
		nargs = "?",
		complete = command_complete,
		desc = "Command entrypoint for spotify",
		force = true,
	})

	local rpc_socket = vim.fn.serverlist()[1]

	local r = os.execute(string.format("cd %s && NVIM_SOCKET=%s ./start.sh &", opts.python_program_path, rpc_socket))
	print(r)
end

return M
