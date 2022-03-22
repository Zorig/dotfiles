local M = {}

local nls = require "null-ls"
local nls_utils = require "null-ls.utils"
local b = nls.builtins

local with_root_file = function(builtin, file)
  return builtin.with {
    condition = function(utils)
      return utils.root_has_file(file)
    end,
  }
end

local sources = {
  -- formatting
  b.formatting.prettier,
  b.formatting.fixjson,
  with_root_file(b.formatting.black.with { extra_args = { "--fast", "--config pyproject.toml" } }, "pyproject.toml"),
  b.formatting.isort,
	b.formatting.stylua,

  -- diagnostics
  b.diagnostics.flake8,
  b.diagnostics.tsc,
  b.diagnostics.eslint,
}

function M.setup(opts)
  nls.setup {
    -- debug = true,
    debounce = 150,
    save_after_format = false,
    sources = sources,
    on_attach = opts.on_attach,
    root_dir = nls_utils.root_pattern ".git",
  }
end

return M
