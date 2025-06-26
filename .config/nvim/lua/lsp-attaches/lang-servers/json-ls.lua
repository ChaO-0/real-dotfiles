local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
	return
end

local M = {}
M.start = function(on_attach, capabilities)
	lspconfig.jsonls.setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}
end

return M
