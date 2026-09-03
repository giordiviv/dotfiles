return {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
        -- render nicely in normal mode, show raw markdown when editing a line
        render_modes = { "n", "c" },
    },
}
