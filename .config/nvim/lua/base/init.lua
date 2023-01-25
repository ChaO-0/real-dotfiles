vim.wo.number = true

vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.ai = true -- Auto Indent
vim.opt.si = true -- Smart Indent
vim.opt.wrap = false -- No wrap lines
vim.opt.backspace = "start,eol,indent"
vim.opt.path:append({ "**" }) -- Finding files - search down into subfolders
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.mouse = "a"
vim.opt.scrolloff = 10
vim.opt.ttyfast = true
vim.opt.wrap = false
vim.opt.splitright = true

-- highlights
vim.opt.cursorline = true
--vim.opt.termguicolors = true
-- vim.winblend = 0
-- vim.opt.wildoptions = 'pum'
-- vim.opt.pumblend = 5
-- vim.opt.background = 'dark'

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
-- doesn't work on iTerm2.

vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})

-- Add asterisks in block comments
vim.opt.formatoptions:append({ "r" })

vim.opt.clipboard:prepend({ "unnamed", "unnamedplus" })
