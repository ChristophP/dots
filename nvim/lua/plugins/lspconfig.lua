-- every spec file under config.plugins will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    ---@type lspconfig.options
    servers = {
      -- elmls will be automatically installed with mason and loaded with lspconfig
      elmls = {},
      terraformls = {},
      phpactor = {},
      tailwindcss = {},
    },
  },
  setup = {
    terraformls = function(_, opts)
      opts.capabilities.documentFormattingProvider = false
    end,
  },
}
