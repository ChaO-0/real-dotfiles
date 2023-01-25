local ok, saga = pcall(require, "lspsaga")
if not ok then
	return
end

saga.setup({})

local opts = { noremap = true, silent = true }

-- vim.keymap.set("n", "<C-j>", "<Cmd>Lspsaga diagnostic_jump_next<cr>", opts)
vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<cr>", opts)
vim.keymap.set("n", "gd", "<Cmd>Lspsaga lsp_finder<cr>", opts)
vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)
vim.keymap.set("n", "gp", "<Cmd>Lspsaga peek_definition<cr>", opts)
vim.keymap.set("n", "gr", "<Cmd>Lspsaga rename<cr>", opts)
vim.keymap.set("n", "∂", "<cmd>Lspsaga term_toggle<cr>", opts)
vim.keymap.set("t", "∂", [[<C-\><C-n><cmd>Lspsaga term_toggle<CR>]], opts)
vim.keymap.set("n", "<space>ca", "<cmd> Lspsaga code_action<cr>", opts)
