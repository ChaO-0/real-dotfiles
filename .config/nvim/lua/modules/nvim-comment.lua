local ok, nvim_comment = pcall(require, 'nvim_comment')
if not ok then return end

nvim_comment.setup({
	hook = function()
		if vim.api.nvim_buf_get_option(0, "filetype") == "astro" then
			require("ts_context_commentstring.internal").update_commentstring()
		end
	end
})
