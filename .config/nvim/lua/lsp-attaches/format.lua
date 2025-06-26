local M = {}

local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })

local formatWithEslint = function(client)
	return vim.api.nvim_create_autocmd("BufWritePre", {
		group = augroup_format,
		buffer = 0,
		callback = function()
			print('Test ajg')
			return vim.api.nvim_command([[EslintFixAll]])
		end,
	})
end

local formatWithoutEslint = function(client)
	return vim.api.nvim_create_autocmd("BufWritePre", {
		group = augroup_format,
		buffer = 0,
		callback = function()
			return vim.lsp.buf.format()
		end,
	})
end

M.formatCode = function(client)
	local eslint_active = vim.lsp.get_active_clients({
		name = "eslint",
		bufnr = vim.api.nvim_get_current_buf(),
	})[1]

	vim.api.nvim_clear_autocmds({ buffer = 0, group = augroup_format })

	if eslint_active then
		return formatWithEslint(client)
	end

	-- if client.server_capabilities.documentFormattingProvider then
	return formatWithoutEslint(client)
	-- end
end

return M
