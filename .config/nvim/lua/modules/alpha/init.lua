require 'alpha'.setup(require 'modules.alpha.themes.theta'.config)

vim.keymap.set("n", "<leader>a", "<Cmd>Alpha<CR>", { silent = true, noremap = true })
