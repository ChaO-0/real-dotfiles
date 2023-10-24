local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
	return
end

local M = {}

M.start = function(on_attach, capabilities)
	lspconfig.pyright.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

return M
