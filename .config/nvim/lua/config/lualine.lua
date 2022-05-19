local M = {}

function M.setup()
	local gps = require("nvim-gps")

	require("lualine").setup({
		options = {
			icons_enabled = true,
			theme = "ayu",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = { "packer", "nvim-tree" },
			always_divide_middle = true,
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = {
				{ "filename", file_status = true },
				{
					gps.get_location,
					cond = gps.is_available,
					color = { fg = "#f3ca28" },
				},
			},
			lualine_x = { "encoding", "fileformat", "filetype" },
			lualine_y = {},
			lualine_z = { "location" },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_x = { "location" },
			lualine_y = { "progress" },
			lualine_z = {},
		},
		tabline = {},
		extensions = { "nvim-tree", "toggleterm", "fugitive" },
	})
end

return M
