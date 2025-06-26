local ok, nvim_lsp = pcall(require, "mason-lspconfig")
if not ok then
	return
end

local ok2, mason = pcall(require, "mason")
if not ok2 then
	return
end

mason.setup({})

nvim_lsp.setup({
	ensure_installed = { "lua_ls", "tsserver", "eslint" },
})
