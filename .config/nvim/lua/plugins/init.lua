local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("folke/tokyonight.nvim")
	use("andweeb/presence.nvim")
	use("kyazdani42/nvim-web-devicons")
	use("folke/which-key.nvim")
	use("nvim-lua/plenary.nvim")

	-- UI
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- lsp
	use("onsails/lspkind-nvim") -- vscode like pictograms
	use("neovim/nvim-lspconfig") -- LSP
	use("hrsh7th/cmp-nvim-lsp") -- nvim-cmp source for buffer words
	use("hrsh7th/cmp-buffer") -- nvim-cmp source for neovim's built in lsp
	use("hrsh7th/nvim-cmp") -- completion
	use("L3MON4D3/LuaSnip") --lua snip
	use("glepnir/lspsaga.nvim")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	-- syntax highlighting
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("nvim-treesitter/nvim-treesitter-context")

	-- autopair
	use("windwp/nvim-autopairs")
	use("tpope/vim-surround")

	-- telescope / file browser
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		requires = { {
			"nvim-lua/plenary.nvim",
		} },
	})
	use("nvim-telescope/telescope-file-browser.nvim")

	-- Bufferline
	use({
		"akinsho/bufferline.nvim",
		tag = "v3.*",
		requires = "kyazdani42/nvim-web-devicons",
	})

	-- File Explorer
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani142/nvim-web-devicons",
		},
		tag = "nightly",
	})

	-- for easier code reading
	use("lukas-reineke/indent-blankline.nvim")

	-- commentor
	use("terrortylor/nvim-comment")

	-- git
	use("lewis6991/gitsigns.nvim")



	if packer_bootstrap then
		require("packer").sync()
	end
end)
