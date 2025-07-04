return {
    'stevearc/conform.nvim',
    opts = {},
    config = function ()
        require("conform").setup({
            formatters_by_ft = {
              lua = { "stylua" },
              -- Conform will run multiple formatters sequentially
              python = { "black" },
              -- You can customize some of the format options for the filetype (:help conform.format)
              -- Conform will run the first available formatter
              javascript = { "prettierd", "prettier", stop_after_first = true },
            },
            format_on_save = {
                -- I recommend these options. See :help conform.format for details.
                lsp_format = "fallback",
                timeout_ms = 500,
            }
        })
    end
}
