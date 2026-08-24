return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "mason-org/mason.nvim",
            "mason-org/mason-lspconfig.nvim",
        },
        config = function()
            -- 1. Mason: installs the language server *binaries*.
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "stylua", -- Lua: formatter
                    "rust_analyzer",
                    "ruff", -- Python: linting + formatting
                    "pyrefly", -- Python: types, hover, go-to-def, completion
                },
            })

            -- 2. Buffer-local keymaps on attach.
            -- Neovim 0.11+ already ships defaults (grn rename, gra code action,
            -- grr references, gri implementation, K hover, gO document symbols,
            -- <C-x><C-o> completion). The maps below override some of those with
            -- older muscle-memory bindings — keep or drop as you prefer.
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    local opts = { buffer = ev.buf }
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts) -- float for cursor line
                    vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts) -- all diagnostics → list
                    vim.keymap.set("n", "]d", function()
                        vim.diagnostic.jump({ count = 1 })
                    end, opts)
                    vim.keymap.set("n", "[d", function()
                        vim.diagnostic.jump({ count = -1 })
                    end, opts)
                end,
            })

            -- 3. Per-server config overrides via vim.lsp.config().
            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" }, -- Stop "undefined global vim" warning
                        },
                        workspace = {
                            -- Just the Neovim runtime, not the whole runtimepath —
                            -- keeps lua_ls fast and light.
                            library = { vim.env.VIMRUNTIME },
                        },
                    },
                },
            })

            -- Ruff: lint + format only. Disable its hover so it doesn't
            -- compete with pyrefly's richer hover.
            vim.lsp.config("ruff", {
                on_attach = function(client, _)
                    client.server_capabilities.hoverProvider = false
                end,
            })

            -- Pyrefly: the Python type/intelligence server.
            vim.lsp.config("pyrefly", {
                cmd = { "pyrefly", "lsp" },
                settings = {
                    python = {
                        pyrefly = {
                            -- current, non-deprecated key. "strict" / "all" turn the most on;
                            -- "basic" is the quiet default you're trying to escape.
                            typeCheckingMode = "default",
                            displayTypeErrors = "force-on",
                        },
                    },
                },
            })

            vim.lsp.enable({ "lua_ls", "rust_analyzer", "ruff", "pyrefly" })
            vim.diagnostic.config({
                virtual_text = {
                    severity = { min = vim.diagnostic.severity.WARN },
                    prefix = "●",
                },
                signs = true,
                underline = true,
                update_in_insert = false,
                severity_sort = true,
            })
        end,
    },
}
