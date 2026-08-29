-- Editor Line
return {
    "nvim-lualine/lualine.nvim",
    config = function()
        require("lualine").setup({
            options = {
                theme = "auto",
                dependencies = { "nvim-tree/nvim-web-devicons" },
            },
        })
    end,
}
