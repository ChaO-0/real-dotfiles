vim.wo.number = true
vim.g.mapleader = ','
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.ai = true             -- Auto Indent
vim.opt.si = true             -- Smart Indent
vim.opt.wrap = false          -- No wrap lines
vim.opt.backspace = "start,eol,indent"
vim.opt.path:append({ "**" }) -- Finding files - search down into subfolders
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.mouse = "i"
vim.opt.scrolloff = 10
vim.opt.ttyfast = true
vim.opt.wrap = false
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.shell = '/bin/zsh'
-- highlights
vim.opt.cursorline = true

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
