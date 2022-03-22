local M = {}

function M.setup()
  local luasnip = require "luasnip"
  require("luasnip.loaders.from_vscode").load()
	require("luasnip.loaders.from_snipmate").lazy_load()

	luasnip.filetype_extend("all", {"_"})

  luasnip.config.set_config {
    history = false,
    updateevents = "TextChanged,TextChangedI",
  }

end

return M
