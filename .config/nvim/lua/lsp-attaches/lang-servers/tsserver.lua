local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
	return
end

local M = {}

M.start = function(on_attach, capabilities)
	lspconfig.tsserver.setup({
		on_attach = on_attach,
		filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
		init_options = {
			hostInfo = "neovim"
		},
		cmd = { "typescript-language-server", "--stdio" },
		capabilities = capabilities,
	})
end

return M
