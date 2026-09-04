return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        -- no nvim-notify here; we route notifications to snacks.notifier
    },
    opts = {
        lsp = {
            -- use noice for LSP hover/signature/docs rendering, with markdown
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
            },
        },
        presets = {
            bottom_search = true, -- classic bottom cmdline for / search
            command_palette = true, -- cmdline + popupmenu together, centered
            long_message_to_split = true,
            lsp_doc_border = true,
        },
        keys = {
            {
                "<leader>nl",
                function()
                    require("noice").cmd("last")
                end,
                desc = "Noice last message",
            },
            {
                "<leader>nh",
                function()
                    require("noice").cmd("history")
                end,
                desc = "Noice history",
            },
        },
    },
}
