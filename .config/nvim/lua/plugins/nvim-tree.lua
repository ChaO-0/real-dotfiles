return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}

      local function open_nvim_tree(data)

        -- buffer is a real file on the disk
        local real_file = vim.fn.filereadable(data.file) == 1
      
        -- buffer is a [No Name]
        local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
      
        if not real_file and not no_name then
          return
        end
      
        -- open the tree, find the file but don't focus it
        require("nvim-tree.api").tree.toggle({ focus = false, find_file = true, })
      end
      
      vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

      local function tab_win_closed(winnr)
        local api = require"nvim-tree.api"
        local tabnr = vim.api.nvim_win_get_tabpage(winnr)
        local bufnr = vim.api.nvim_win_get_buf(winnr)
        local buf_info = vim.fn.getbufinfo(bufnr)[1]
        local tab_wins = vim.tbl_filter(function(w) return w~=winnr end, vim.api.nvim_tabpage_list_wins(tabnr))
        local tab_bufs = vim.tbl_map(vim.api.nvim_win_get_buf, tab_wins)
        if buf_info.name:match(".*NvimTree_%d*$") then            -- close buffer was nvim tree
          -- Close all nvim tree on :q
          if not vim.tbl_isempty(tab_bufs) then                      -- and was not the last window (not closed automatically by code below)
            api.tree.close()
          end
        else                                                      -- else closed buffer was normal buffer
          if #tab_bufs == 1 then                                    -- if there is only 1 buffer left in the tab
            local last_buf_info = vim.fn.getbufinfo(tab_bufs[1])[1]
            if last_buf_info.name:match(".*NvimTree_%d*$") then       -- and that buffer is nvim tree
              vim.schedule(function ()
                if #vim.api.nvim_list_wins() == 1 then                -- if its the last buffer in vim
                  vim.cmd "quit"                                        -- then close all of vim
                else                                                  -- else there are more tabs open
                  vim.api.nvim_win_close(tab_wins[1], true)             -- then close only the tab
                end
              end)
            end
          end
        end
      end
      
      vim.api.nvim_create_autocmd("WinClosed", {
        callback = function ()
          local winnr = tonumber(vim.fn.expand("<amatch>"))
          vim.schedule_wrap(tab_win_closed(winnr))
        end,
        nested = true
      })

      vim.keymap.set("n", "<C-h>", "<Cmd>NvimTreeToggle<CR>", { silent = true, noremap = true })
    end,
}