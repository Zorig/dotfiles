local M = {}

local nls_utils = require("config.lsp.null-ls.util")
local nls_sources = require("null-ls.sources")

local method = require("null-ls").methods.FORMATTING

M.autoformat = true

function M.format()
	if M.autoformat then
		vim.lsp.buf.formatting_sync(nil, 2000)
	end
end

function M.setup(client, buf)
	local filetype = vim.api.nvim_buf_get_option(buf, "filetype")

	local enable = false
	if M.has_formatter(filetype) then
		enable = client.name == "null-ls"
	else
		enable = not (client.name == "null-ls")
	end

	client.resolved_capabilities.document_formatting = enable
	client.resolved_capabilities.document_range_formatting = enable
	if client.resolved_capabilities.document_formatting then
		vim.cmd([[
      augroup LspFormat
        autocmd! * <buffer>
        autocmd BufWritePre <buffer> lua require("config.lsp.null-ls.formatters").format()
      augroup END
    ]])
	end
end

function M.has_formatter(filetype)
	local available = nls_sources.get_available(filetype, method)
	return #available > 0
end

function M.list_registered(filetype)
	local registered_providers = nls_utils.list_registered_providers_names(filetype)
	return registered_providers[method] or {}
end

function M.list_supported(filetype)
	local supported_formatters = nls_sources.get_supported(filetype, "formatting")
	table.sort(supported_formatters)
	return supported_formatters
end

return M
