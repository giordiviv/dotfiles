-- Editor Line
return {
    "nvim-lualine/lualine.nvim",
    config = function()
        require("lualine").setup({
            options = {
                theme = "auto",
                dependencies = { "nvim-tree/nvim-web-devicons" },
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = { { "filename", path = 0 } },
                lualine_x = {
                    ---@diagnostic disable: undefined-field
                    {
                        function()
                            return require("noice").api.status.message.get_hl()
                        end,
                        cond = function()
                            return require("noice").api.status.message.has()
                        end,
                    },
                    {
                        function()
                            return require("noice").api.status.command.get()
                        end,
                        cond = function()
                            return require("noice").api.status.command.has()
                        end,
                        color = { fg = "#ff9e64" },
                    },
                    {
                        function()
                            return require("noice").api.status.search.get()
                        end,
                        cond = function()
                            return require("noice").api.status.search.has()
                        end,
                        color = { fg = "#ff9e64" },
                    },
                    "encoding",
                    "fileformat",
                    "filetype",
                },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { { "filename", path = 1 } },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },
        })
    end,
}
