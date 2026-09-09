-- Formatters
return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" }, -- lazy-load right before the first save
    cmd = { "ConformInfo" },
    -- Manual format keymap (normal + visual), in case you want to
    -- format without saving.
    keys = {
        {
            "<leader>cf",
            function()
                require("conform").format({ async = true, lsp_format = "fallback" })
            end,
            mode = { "n", "v" },
            desc = "Format buffer",
        },
    },
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
    end,
}
