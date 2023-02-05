-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.api.nvim_set_keymap
local opts = { noremap = true }

-- Easier write file
map("n", "<Leader>w", ":w!<CR>", opts)

-- text navigation
map("n", "<C-j>", ":+10<CR>", opts)
map("n", "<C-k>", ":-10<CR>", opts)

-- Easier window navigation
-- map('n', '<C-h>', '<C-w>h', opts)
-- map('n', '<C-l>', '<C-w>l', opts)
-- map('n', '<C-j>', '<C-w>j', opts)
-- map('n', '<C-k>', '<C-w>k', opts)

-- Exit insert mode with 'jj'
map("i", "jj", "<ESC>", opts)

-- Resize with arrows
-- map("n", "<C-Up>", ":resize -2<CR>", opts)
-- map("n", "<C-Down>", ":resize +2<CR>", opts)
-- map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
-- map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Copy/pase to/from system clipboard
map("", "<Leader>y", '"+y', opts)
map("", "<Leader>p", '"+p', opts)

-- Navigate buffers
-- map('n', '<leader>bn', ':bnext<CR>', opts)
-- map('n', '<leader>bp', ':bprevious<CR>', opts)

-- When pasting to replace something, retain what's in the current register
-- map("v", "p", '"_dP', opts)
