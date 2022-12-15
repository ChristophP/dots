local alpha = require("alpha")

local dashboard = require("alpha.themes.dashboard")
math.randomseed(os.time())

-- dashboard.section.header.val = {
-- 	[[ _______             ____   ____.__         ]],
--   [[ \      \   ____  ___\   \ /   /|__| _____  ]],
--   [[ /   |   \_/ __ \/  _ \   Y   / |  |/     \ ]],
--   [[/    |    \  ___(  <_> )     /  |  |  Y Y  \]],
--   [[\____|__  /\___  >____/ \___/   |__|__|_|  /]],
--   [[        \/     \/                        \/ ]],
-- }
--
dashboard.section.header.val = {
  [[  ____  ____  ____  ____   __   ]],
  [[ (    \(  __)(  __)(    \ /  \  ]],
  [[  ) D ( ) _)  ) _)  ) D ((  O ) ]],
  [[ (____/(____)(____)(____/ \__/  ]],
}

dashboard.section.buttons.val = {
	dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
	dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

local function footer()
  local datetime = os.date("%d-%m-%Y  %H:%M:%S")
  return datetime
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true

alpha.setup(dashboard.opts)
