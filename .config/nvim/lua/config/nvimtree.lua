local M = {}

function M.setup()
  require("nvim-tree").setup {
    disable_netrw = true,
    hijack_netrw = true,
    view = {
			side = 'right',
    },
    filters = {
      custom = { ".git" },
    },
  }
end

return M
