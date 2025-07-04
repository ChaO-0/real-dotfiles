local keymap = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

vim.g.floaterm_width = 0.7
vim.g.floaterm_height = 0.8

keymap('n', '∂', '<CMD>FloatermToggle<CR>', opt)
keymap("t", "∂", '<CMD>:FloatermToggle<CR>', opt)

keymap('n', '<Leader>t', '<CMD>:FloatermNew<CR>', opt)

keymap('n', '<C-.>', '<CMD>:FloatermNext<CR>', opt)
keymap('t', '<C-.>', '<CMD>:FloatermNext<CR>', opt)
--
keymap('n', '<C-,>', '<CMD>:FloatermPrev<CR>', opt)
keymap('t', '<C-,>', '<CMD>:FloatermPrev<CR>', opt)
