-- every spec file under config.plugins will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins

return {
  "goolord/alpha-nvim",
  opts = function(_, opts)
    local logo = [[
          ____  ____  ____  ____   __   
         (    \(  __)(  __)(    \ /  \  
          ) D ( ) _)  ) _)  ) D ((  O ) 
         (____/(____)(____)(____/ \__/  
       ]]
    opts.section.header.val = vim.split(logo, "\n", { trimempty = true })
  end,
}
