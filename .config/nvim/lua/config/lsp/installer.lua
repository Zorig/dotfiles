--local lsp_installer_servers = require("nvim-lsp-installer.servers")

local M = {}

function M.setup(servers, options)
--for server_name, _ in pairs(servers) do
--local server_available, server = lsp_installer_servers.get_server(server_name)

--if server_available then
--server:on_ready(function()
--local opts = vim.tbl_deep_extend("force", options, servers[server.name] or {})
--server:setup(opts)
--end)

--if not server:is_installed() then
--vim.notify("Installing " .. server.name, vim.log.levels.INFO, { title = "LSP install" })
--server:install()
--end
--else
--vim.notify("Error", vim.log.levels.ERROR, { title = "lsp install" })
--end
--end
	require("mason").setup({
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗"
			}
		}
	})

	require('mason-tool-installer').setup({
		ensure_installed = {
			"stylua",
			"black",
			"isort",
			"prettier"
		},
		auto_update = false,
		run_on_start = true
	})

	require("mason-lspconfig").setup({
		ensure_installed = vim.tbl_keys(servers),
		automatic_installation = false
	})

	require("mason-lspconfig").setup_handlers {
		--function(server_name)
      --local opts = vim.tbl_deep_extend("force", options, servers[server_name] or {})
      --lspconfig[server_name].setup { opts }
    --end,
		--["tsserver"] = function()
      --local opts = vim.tbl_deep_extend("force", options, servers["tsserver"] or {})
      --require("typescript").setup {
        --disable_commands = false,
        --debug = false,
        --server = opts,
      --}
    --end
	}

end

return M
