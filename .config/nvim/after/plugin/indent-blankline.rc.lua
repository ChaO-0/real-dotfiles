local ok, indent_blankline = pcall(require, 'ibl')
if not ok then return end

indent_blankline.setup()

-- indent_blankline.setup {
-- 	show_current_context = true,
-- 	show_current_context_start = true,
-- 	use_treesitter = true,
-- 	use_treesitter_scope = true
-- }
