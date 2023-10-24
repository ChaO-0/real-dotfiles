local ok, null_ls = pcall(require, 'null-ls')
if not ok then return end

local prettierd = null_ls.builtins.formatting.prettierd.with({
  filetypes = { 'astro' }, -- Add 'astro' as a supported filetype
})


null_ls.setup {
  sources = {
		prettierd
  },
}

