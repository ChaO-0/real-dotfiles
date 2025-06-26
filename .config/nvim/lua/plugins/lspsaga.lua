return {
    'nvimdev/lspsaga.nvim',
    config = function()
        require('lspsaga').setup({})
        local opts = { noremap = true, silent = true }

        vim.keymap.set("n", "<C-j>", "<Cmd>Lspsaga diagnostic_jump_next<cr>", opts)
        vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<cr>", opts)
        vim.keymap.set("n", "gd", "<Cmd>Lspsaga finder<cr>", opts)
        vim.keymap.set("n", "gp", "<Cmd>Lspsaga peek_definition<cr>", opts)
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons',     -- optional
    }
}