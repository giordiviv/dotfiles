-- Makes the Lua language server (lua_ls) properly understand your Neovim config
-- - completion
-- - hover
-- - docs
-- - signatures
-- - type checking
-- for the Neovim API and your installed plugins.
return {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
        library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            -- load snacks types when Snacks is used
            { path = "snacks.nvim", words = { "Snacks" } },
        },
    },
}
