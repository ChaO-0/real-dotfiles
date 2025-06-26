return {
    -- Mason: Package manager for LSPs, DAPs, Linters, and Formatters
    {
      "williamboman/mason.nvim",
      build = ":MasonUpdate", -- Updates registry contents
      config = function()
        require("mason").setup()
      end,
    },
  
    -- Mason-LSPConfig: Bridges Mason with nvim-lspconfig
    {
      "williamboman/mason-lspconfig.nvim",
      dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
      config = function()
        require("mason-lspconfig").setup({
          ensure_installed = { "lua_ls", "pyright" }, -- Automatically install lua_ls
        })
      end,
    },
  
    -- LSPConfig: Configures built-in Neovim LSP client
    {
      "neovim/nvim-lspconfig",
      config = function()
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        local lspconfig = require'lspconfig'
        lspconfig.lua_ls.setup {
          on_init = function(client)
            if client.workspace_folders then
              local path = client.workspace_folders[1].name
              if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
                return
              end
            end
            
            client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
              runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT'
              },
              -- Make the server aware of Neovim runtime files
              workspace = {
                checkThirdParty = false,
                library = {
                  vim.env.VIMRUNTIME
                  -- Depending on the usage, you might want to add additional paths here.
                  -- "${3rd}/luv/library"
                  -- "${3rd}/busted/library",
                }
                -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
                -- library = vim.api.nvim_get_runtime_file("", true)
              }
            })
          end,
          capabilities = capabilities,
          settings = {
            Lua = {}
          }
        }

        lspconfig.pyright.setup{
          capabilities = capabilities
        }
      end,
    },
  }
