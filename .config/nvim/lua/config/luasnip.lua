local M = {}

function M.setup()
  local luasnip = require "luasnip"
  require("luasnip.loaders.from_vscode").load()

  luasnip.config.set_config {
    history = false,
    updateevents = "TextChanged,TextChangedI",
  }

end

return M
