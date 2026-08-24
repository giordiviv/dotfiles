return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" }, -- lazy-load right before the first save
    cmd = { "ConformInfo" },
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                css = { "biome" },
                html = { "superhtml" },
                javascript = { "biome" },
                json = { "biome" },
                lua = { "stylua" },
                python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
                typescript = { "biome" },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_format = "fallback",
            },
            -- Pass StyLua flags:
            formatters = {
                stylua = {
                    prepend_args = { "--indent-type", "Spaces", "--indent-width", "4" },
                },
            },
        })

        -- Manual format keymap (normal + visual), in case you want to
        -- format without saving.
        vim.keymap.set({ "n", "v" }, "<leader>f", function()
            require("conform").format({ async = true, lsp_format = "fallback" })
        end, { desc = "Format buffer" })
    end,
}
