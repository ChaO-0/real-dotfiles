vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

require("base")
require("plugins")
require("maps")
require("tokyonight").colorscheme({
	style = "night",
})

-- vim.keymap.set('n', '<C-j>', '<cmd>Lspsaga diagnostic_jump_next<cr>', { silent = true })
-- vim.cmd [[ colorscheme tokyonight-night ]]
