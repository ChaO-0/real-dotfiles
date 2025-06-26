local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not ok then return end

treesitter.setup {
	ensure_installed = { "typescript", "lua" },
	indent = {
		enable =	true,
		disable = {}
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false
	},
	autotag = {
		enable = true
	}
}
