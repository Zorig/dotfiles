return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- Keep treesitter as the single fold provider. LSP folds replace the
      -- treesitter foldexpr on attach, which unfolds everything until the
      -- server answers (~1s) and causes a fold/unfold/fold flicker on open.
      folds = { enabled = false },
    },
  },
}
