local lsp_installer_servers = require("nvim-lsp-installer.servers")

local M = {}

function M.setup(servers, options)
	for server_name, _ in pairs(servers) do
		local server_available, server = lsp_installer_servers.get_server(server_name)

		if server_available then
			server:on_ready(function()
				local opts = vim.tbl_deep_extend("force", options, servers[server.name] or {})
				server:setup(opts)
			end)

			if not server:is_installed() then
				vim.notify("Installing " .. server.name, vim.log.levels.INFO, { title = "LSP install" })
				server:install()
			end
		else
			vim.notify("Error", vim.log.levels.ERROR, { title = "lsp install" })
		end
	end
end

return M
