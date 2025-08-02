vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

require("config.lazy")
vim.cmd.colorscheme("gruvbox")
vim.o.number = true
vim.wo.relativenumber = true
