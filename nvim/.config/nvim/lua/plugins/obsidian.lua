return {
    "obsidian-nvim/obsidian.nvim",
    version = "*",
    ft = "markdown",
    opts = {
        workspaces = {
            {
                name = "personal",
                path = "/Users/odysseus/Library/Mobile Documents/iCloud~md~obsidian/Documents/OrionNebula",
            },
            -- add more vaults if you have them:
            -- { name = "work", path = "~/vaults/work" },
        },

        -- New subcommand style (:Obsidian new) instead of :ObsidianNew.
        -- Legacy format is unmaintained from v4.0.0, so opt out now.
        legacy_commands = false,
        frontmatter = { enabled = false },

        -- Where new notes / daily notes / templates live (relative to vault):
        notes_subdir = "Inbox",
        templates = {
            folder = "Templates",
        },

        -- File name is the same given in the parenthesis
        note = {
            id_func = function(title)
                if title == nil then
                    return tostring(os.time())
                end
                return title
            end,
        },

        -- Match this to YOUR picker (see note below):
        picker = {
            name = "telescope.nvim", -- or "telescope.nvim" or "fzf-lua" or "mini.pick"
        },

        -- Disable obsidian's own UI; render-markdown does it better (see below).
        ui = { enable = false },
    },
    keys = {
        { "<leader>on", "<cmd>Obsidian new<cr>", desc = "Obsidian: new note" },
        { "<leader>oo", "<cmd>Obsidian quick_switch<cr>", desc = "Obsidian: quick switch" },
        { "<leader>os", "<cmd>Obsidian search<cr>", desc = "Obsidian: search notes" },
        { "<leader>od", "<cmd>Obsidian today<cr>", desc = "Obsidian: daily note" },
        { "<leader>ot", "<cmd>Obsidian tags<cr>", desc = "Obsidian: search tags" },
        { "<leader>ob", "<cmd>Obsidian backlinks<cr>", desc = "Obsidian: backlinks" },
        { "<leader>ol", "<cmd>Obsidian links<cr>", desc = "Obsidian: links in note" },
        { "<leader>ip", "<cmd>Obsidian paste_img<cr>", desc = "Obsidian: paste image" },
        {
            "<leader>ov",
            "<cmd>edit /Users/odysseus/Library/Mobile Documents/iCloud~md~obsidian/Documents/OrionNebula<cr>",
            desc = "Open Obsidian vault",
        },
    },
}
