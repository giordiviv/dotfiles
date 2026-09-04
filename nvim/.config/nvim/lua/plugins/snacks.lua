return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        picker = { enabled = true, ui_select = true }, -- replaces telescope + telescope-ui-select
        notifier = { -- replaces nvim-notify
            enabled = true,
            timeout = 3000,
        },
        input = { enabled = true }, -- the vim.ui.input piece dressing used to give you
        indent = { enabled = true }, -- show
        styles = {
            notification = {
                -- wo = { wrap = true },
            },
        },
    },
    keys = {
        -- your telescope keymaps, mapped to snacks.picker
        -- stylua: ignore start
        { "<leader>ff", function() Snacks.picker.files() end, desc = "Find files" },
        { "<leader>fg", function() Snacks.picker.grep() end, desc = "Live grep" },
        { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
        { "<leader>fh", function() Snacks.picker.help() end, desc = "Help tags" },
        { "<leader>fa", function() Snacks.picker.files({ hidden = true, ignored = true }) end, desc = "Find all files" },
        { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
        -- stylua: ignore end
        -- your notify dismiss keymap
        {
            "<leader>dn",
            function()
                Snacks.notifier.hide()
            end,
            desc = "Dismiss all notifications",
        },
    },
}
