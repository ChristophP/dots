-- every spec file under config.plugins will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins

local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics

local sources = {
  formatting.prettierd,
  formatting.terraform_fmt,
  formatting.eslint_d,
  diagnostics.eslint_d,
  formatting.stylua, -- not sure if this is needed, should be a default but not sure if opts function overrides or merges
  diagnostics.flake8, -- not sure if this is needed
}

return {
  "jose-elias-alvarez/null-ls.nvim",
  event = "BufReadPre",
  dependencies = { "mason.nvim" },
  opts = function()
    return {
      sources = sources,
    }
  end,
}
