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

        -- How new note filenames are generated. This gives readable,
        -- title-based names instead of random zettelkasten IDs.
        -- note_id_func = function(title)
        --     local suffix = ""
        --     if title ~= nil then
        --         suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        --     else
        --         for _ = 1, 4 do
        --             suffix = suffix .. string.char(math.random(65, 90))
        --         end
        --     end
        --     return suffix
        -- end,

        -- Follow [[wikilinks]] and URLs with gf / <CR>. Let obsidian handle
        -- markdown links but fall through to normal gf otherwise.
        follow_url_func = function(url)
            vim.ui.open(url) -- built-in since nvim 0.10, no plenary needed
        end,

        -- Match this to YOUR completion engine (see note below):
        completion = {
            nvim_cmp = false,
            blink = true,
            min_chars = 2,
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
    },
    vim.keymap.set("n", "<leader>ov", function()
        vim.cmd("edit /Users/odysseus/Library/Mobile Documents/iCloud~md~obsidian/Documents/OrionNebula")
    end, { desc = "Open Obsidian vault" }),
}
