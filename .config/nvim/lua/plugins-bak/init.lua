-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
	spec = {

	},
	-- Configure any other settings here. See the documentation for more details.
  	-- colorscheme that will be used when installing plugins.
  	install = { colorscheme = { "tokyonight" } },
  	-- automatically check for plugin updates
  	checker = { enabled = true },
})

-- require('lazy').setup({
-- 	{ "folke/tokyonight.nvim" },
-- 	{ "andweeb/presence.nvim" },
-- 	{ "kyazdani42/nvim-web-devicons" },
-- 	{ "folke/which-key.nvim" },
-- 	{ "nvim-lua/plenary.nvim" },

-- 	-- UI
-- 	{ "nvim-lualine/lualine.nvim" },

-- 	-- lsp
-- 	{ "onsails/lspkind-nvim" },               -- vscode like pictograms
-- 	{ "neovim/nvim-lspconfig" },              -- LSP
-- 	{ "hrsh7th/cmp-nvim-lsp" },               -- nvim-cmp source for buffer words
-- 	{ "hrsh7th/cmp-buffer" },                 -- nvim-cmp source for neovim's built in lsp
-- 	{ "hrsh7th/nvim-cmp" },                   -- completion
-- 	{ "hrsh7th/cmp-path" },                   -- path completion
-- 	{ "hrsh7th/cmp-nvim-lsp-signature-help" }, -- function signature helper
-- 	{ "L3MON4D3/LuaSnip" },                   --lua snip
-- 	{ 'saadparwaiz1/cmp_luasnip' },

-- 	{ "nvimdev/lspsaga.nvim" },
-- 	{ "williamboman/mason.nvim" },
-- 	{ "williamboman/mason-lspconfig.nvim" },

-- 	-- syntax highlighting
-- 	{
-- 		"nvim-treesitter/nvim-treesitter",
-- 		dependencies = {
-- 			'JoosepAlviste/nvim-ts-context-commentstring',
-- 		}
-- 	},
-- 	{ "nvim-treesitter/nvim-treesitter-context" },

-- 	-- autopair
-- 	{ "windwp/nvim-autopairs" },
-- 	{ "tpope/vim-surround" },

-- 	-- autotag
-- 	{ "windwp/nvim-ts-autotag" },

-- 	-- telescope / file browser
-- 	{ "nvim-telescope/telescope.nvim" },
-- 	{ "nvim-telescope/telescope-file-browser.nvim" },

-- 	-- Bufferline
-- 	{ "akinsho/bufferline.nvim" },

-- 	-- File Explorer

-- 	{ "nvim-tree/nvim-tree.lua" },

-- 	-- for easier code reading
-- 	{ "lukas-reineke/indent-blankline.nvim" },

-- 	-- commentor
-- 	{ "terrortylor/nvim-comment" },

-- 	-- gitn
-- 	{ "lewis6991/gitsigns.nvim" },

-- 	{ "voldikss/vim-floaterm" },

-- 	{ "goolord/alpha-nvim" },

-- 	{ "ziontee113/color-picker.nvim" },

-- 	-- { "norcalli/nvim-colorizer.lua" },

-- 	{ "ChaO-0/nvim-colorizer.lua" }
-- })
