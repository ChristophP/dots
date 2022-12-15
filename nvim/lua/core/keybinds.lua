vim.g.mapleader = ' '
local map = vim.api.nvim_set_keymap
local opts = { noremap = true }

-- #########################
-- General keybinds
-- #########################

-- Easier write file
map('n', '<Leader>w', ':w!<CR>', opts)

-- text navigation
map('n', '<C-j>', ':+10<CR>', opts)
map('n', '<C-k>', ':-10<CR>', opts)

-- Easier window navigation
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-l>', '<C-w>l', opts)
-- map('n', '<C-j>', '<C-w>j', opts)
-- map('n', '<C-k>', '<C-w>k', opts)

-- Exit insert mode with 'jj'
map('i', 'jj', '<ESC>', opts)

-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Copy/pase to/from system clipboard
map('', '<Leader>y', '"+y', opts)
map('', '<Leader>p', '"+p', opts)

-- Navigate buffers
map('n', '<leader>bn', ':bnext<CR>', opts)
map('n', '<leader>bp', ':bprevious<CR>', opts)

-- Stay in visual mode when indenting lines
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- When pasting to replace something, retain what's in the current register
map("v", "p", '"_dP', opts)

-- Close current buffer
map ("n", "<C-w>", ":bp|bd #<CR>", opts)

-- #########################
-- Plugin specific keybinds
-- #########################

-- Telescope
map('n', '<Leader>f', ':Telescope find_files<CR>', opts)
map('n', '<Leader>F', ':Telescope live_grep<CR>', opts)
map('n', '<Leader>fb', ':Telescope buffers<CR>', opts)
map('n', '<Leader>fp', ':Telescope projects<CR>', opts)
map('n', '<Leader>fc', ':Telescope git_branches<CR>', opts)
map('n', '<Leader>fr', ':Telescope oldfiles<CR>', opts)

-- nvim-tree
map('n', '<C-b>', ':NvimTreeToggle<CR>', opts)

-- nvim-comment (slash)
map('n', '<C-_>', ':CommentToggle<CR>', opts)
map('v', '<C-_>', ':CommentToggle<CR>gv', opts)
