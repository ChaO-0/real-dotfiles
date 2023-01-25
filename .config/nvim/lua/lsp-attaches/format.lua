local M = {}

local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })

local doFormatTS = function()
	vim.api.nvim_create_autocmd("BufWritePre", {
		group = augroup_format,
		buffer = 0,
		callback = function()
			vim.api.nvim_command([[EslintFixAll]])
		end,
	})
end

local doFormatNonTS = function()
	vim.api.nvim_create_autocmd("BufWritePre", {
		group = augroup_format,
		buffer = 0,
		callback = function()
			vim.lsp.buf.format()
		end,
	})
end

M.formatCode = function(client)
	if client.name == "tsserver" then
		vim.api.nvim_clear_autocmds({ buffer = 0, group = augroup_format })
		return doFormatTS()
	end

	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_clear_autocmds({ buffer = 0, group = augroup_format })
		doFormatNonTS()
	end
end

return M
