local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
	return
end

local M = {}
M.start = function(on_attach, capabilities)
	lspconfig.yamlls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		settings = {
			redhat = {
				telemetry = {
					enabled = false,
				},
			},
			yaml = {
				format = {
					enable = true,
				},
				schemas = {
					["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
				},
			},
		},
	})
end

return M
