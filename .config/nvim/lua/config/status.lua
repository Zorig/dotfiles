local M = {}

-- Color table for highlights
local colors = {
	bg = "#202328",
	fg = "#bbc2cf",
	yellow = "#ECBE7B",
	cyan = "#008080",
	darkblue = "#081633",
	green = "#98be65",
	orange = "#FF8800",
	violet = "#a9a1e1",
	magenta = "#c678dd",
	blue = "#51afef",
	red = "#ec5f67",
}

local function separator()
	return "%="
end

local function lsp_client()
	local buf_clients = vim.lsp.buf_get_clients()
	if next(buf_clients) == nil then
		return ""
	end
	local buf_client_names = {}
	for _, client in pairs(buf_clients) do
		if client.name ~= "null-ls" then
			table.insert(buf_client_names, client.name)
		end
	end
	return "[" .. table.concat(buf_client_names, ", ") .. "]"
end

local function lsp_progress(_, is_active)
	if not is_active then
		return
	end
	local messages = vim.lsp.util.get_progress_messages()
	if #messages == 0 then
		return ""
	end
	local status = {}
	for _, msg in pairs(messages) do
		local title = ""
		if msg.title then
			title = msg.title
		end
		table.insert(status, (msg.percentage or 0) .. "%% " .. title)
	end
	local spinners = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
	local ms = vim.loop.hrtime() / 1000000
	local frame = math.floor(ms / 120) % #spinners
	return table.concat(status, "  ") .. " " .. spinners[frame + 1]
end

function M.setup()
	local gps = require("nvim-gps")
	require("lualine").setup({
		extensions = { "fugitive", "nvim-tree", "toggleterm" },
		options = {
			icons_enabled = true,
			theme = "tokyonight",
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = {
				{ "filename", file_status = true, path = 1 },
				{ gps.get_location, cond = gps.is_available, color = { fg = "#f3ca28" } },
				{ separator },
				{ lsp_client, icon = " ", color = { fg = colors.violet, gui = "bold" } },
				{ lsp_progress },
			},

			lualine_x = { "fileformat", "filetype" },
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
	})
end

return M
