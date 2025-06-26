local ok, cmp = pcall(require, "cmp")
if not ok then
	return
end

local lspkind = require("lspkind")
local luasnip = require("luasnip")

cmp.setup({
	view = {
		entries = 'custom'
	},
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	}, {
		{ name = "buffer" },
		{ name = "path" }
	}),
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol_text",
			menu = {
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				luasnip = "[LuaSnip]",
				nvim_lua = "[Lua]",
				latext_symbols = "[Latex]",
			},
			-- before = function(entry, vim_item) -- for tailwind css autocomplete
			-- 	if vim_item.kind == 'Color' and entry.completion_item.documentation then
			-- 		local _, _, r, g, b = string.find(entry.completion_item.documentation, '^rgb%((%d+), (%d+), (%d+)')
			-- 		if r then
			-- 			local color = string.format('%02x', r) .. string.format('%02x', g) .. string.format('%02x', b)
			-- 			local group = 'Tw_' .. color
			-- 			if vim.fn.hlID(group) < 1 then
			-- 				vim.api.nvim_set_hl(0, group, { fg = '#' .. color })
			-- 			end
			-- 			vim_item.kind = "■" -- or "⬤" or anything
			-- 			vim_item.kind_hl_group = group
			-- 			return vim_item
			-- 		end
			-- 	end
			-- 	-- vim_item.kind = icons[vim_item.kind] and (icons[vim_item.kind] .. vim_item.kind) or vim_item.kind
			-- 	-- or just show the icon
			-- 	vim_item.kind = lspkind.symbolic(vim_item.kind) and lspkind.symbolic(vim_item.kind) or vim_item.kind
			-- 	return vim_item
			-- end
		}),
	},
})
