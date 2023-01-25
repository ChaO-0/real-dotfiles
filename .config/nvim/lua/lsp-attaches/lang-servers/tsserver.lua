local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
	return
end

local M = {}

M.start = function(on_attach, capabilities)
	lspconfig.tsserver.setup({
		on_attach = on_attach,
		filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
		cmd = { "typescript-language-server", "--stdio" },
		capabilities = capabilities,
	})
end

return M
