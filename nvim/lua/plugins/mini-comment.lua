-- every spec file under config.plugins will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins

return {
  "echasnovski/mini.comment",
  opts = {
    -- Module mappings. Use `''` (empty string) to disable one.
    mappings = {
      -- Toggle comment on current line
      comment_line = "<C-_>",
    },
  },
}
