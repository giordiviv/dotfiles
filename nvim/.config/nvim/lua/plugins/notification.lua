-- Notifications in vim
return {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
        local notify = require("notify")

        notify.setup({
            -- Animation style: "fade_in_slide_out", "fade", "slide", or "static"
            stages = "fade_in_slide_out",

            -- Default timeout for notifications (in milliseconds)
            timeout = 3000,

            -- Render style: "default", "minimal", "simple", or "compact"
            render = "compact",

            -- Max width of the notification window
            max_width = 50,

            -- Max height of the notification window
            max_height = 10,

            -- Minimum width to ensure icons and titles fit neatly
            min_width = 30,

            -- For visual consistency with Gruvbox Material
            background_colour = "#202020",
        })

        -- Set nvim-notify as your default Neovim notification handler
        vim.notify = notify

        -- Keyboard shortcut to clear active notifications instantly
        vim.keymap.set("n", "<leader>nd", function()
            notify.dismiss({ pending = true, silent = true })
        end, { desc = "Dismiss All Notifications" })
    end,
}
