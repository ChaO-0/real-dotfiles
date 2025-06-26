local ok, bufferline = pcall(require, "bufferline")
if not ok then
	return
end

bufferline.setup({
	options = {
		mode = "buffers",
		-- always_show_bufferline = false,
		show_buffer_close_icons = false,
		show_close_icon = false,
		color_icons = true,
		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			if context.buffer:current() then
				return ""
			end

			return ""
		end,
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				highlight = "Directory",
				separator = true,
			},
		},
	},
})

vim.api.nvim_set_keymap("n", "¬", "<cmd>BufferLineCycleNext<cr>", {})
vim.api.nvim_set_keymap("n", "˙", "<cmd>BufferLineCyclePrev<cr>", {})
vim.api.nvim_set_keymap("n", "œ", "<CMD>bp<bar>sp<bar>bn<bar>bd<CR>", {})
