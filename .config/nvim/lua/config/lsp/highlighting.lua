local M = {}

function M.highlight(client)
  if M.highlight then
    if client.resolved_capabilities.document_highlight then
			vim.api.nvim_exec(
				[[
					augroup lsp_document_highlight
						autocmd! * <buffer>
						autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
						autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
					augroup END
				]],
				false
			)
    end
  end
end

function M.setup(client)
  M.highlight(client)
end

return M
