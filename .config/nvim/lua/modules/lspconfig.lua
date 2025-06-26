vim.o.updatetime = 250

local cursor_diagnostics = require("lsp-attaches.cursor-diagnostics")
local highlight_symbol = require("lsp-attaches.highlight-symbol")
local formatter = require("lsp-attaches.format")

-- Set up completion using nvim_cmp with LSP source
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	cursor_diagnostics.watch(bufnr)
	highlight_symbol.watch(client, bufnr)
	formatter.formatCode(client)
end

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
	virtual_text = false,
	update_in_insert = true,
	float = {
		source = "always", -- Or "if_many"
	},
})

require("lsp-attaches.lang-servers.tsserver").start(on_attach, capabilities)
require("lsp-attaches.lang-servers.eslint").start(on_attach, capabilities)
require("lsp-attaches.lang-servers.sumneko_lua").start(on_attach, capabilities)
require("lsp-attaches.lang-servers.yamlls").start(on_attach, capabilities)
require("lsp-attaches.lang-servers.gopls").start(on_attach, capabilities)
require("lsp-attaches.lang-servers.pyright").start(on_attach, capabilities)
require("lsp-attaches.lang-servers.html-lsp").start(on_attach, capabilities)
require("lsp-attaches.lang-servers.emmet-language-server").start(on_attach, capabilities)
require("lsp-attaches.lang-servers.astro-language-server").start(on_attach, capabilities)
require("lsp-attaches.lang-servers.css-lsp").start(on_attach, capabilities)
require("lsp-attaches.lang-servers.json-ls").start(on_attach, capabilities)
require("lsp-attaches.lang-servers.tailwindcss").start(on_attach, capabilities)
