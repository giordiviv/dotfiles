vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.smartindent = true
vim.opt.inccommand = "split"

vim.opt.wrap = false
vim.opt.colorcolumn = "88"
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("config.lazy")
-- vim.cmd.colorscheme("catppuccin-macchiato")
vim.cmd.colorscheme("gruvbox-material")
vim.o.number = true
vim.wo.relativenumber = true

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown", "text", "gitcommit" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.linebreak = true
        vim.opt_local.colorcolumn = ""
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "html", "css", "javascript", "typescript", "json", "yaml" },
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.softtabstop = 2
        vim.opt_local.shiftwidth = 2
    end,
})
