-- LSP and Linting settings using Mason and nvim-lspconfig
-- some formatters are also installed through Mason
return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "mason-org/mason.nvim",
            "mason-org/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
        },
        config = function()
            -- 1. Mason: installs the language server *binaries*.
            -- List: https://mason-registry.dev/registry/list
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "biome", -- CSS/JS/TS/JSON: linter + format + import-sort
                    "emmet_language_server", -- HTML: Emmet abbrev. expansion
                    "html", -- HTML: Matur LSP from VSCode
                    "lua_ls",
                    "pyrefly", -- Python: types, hover, go-to-def, completion
                    "ruff", -- Python: linting + formatting
                    "rust_analyzer",
                    "superhtml", -- HTML: Error diagnostic + formatter
                },
            })
            require("mason-tool-installer").setup({
                ensure_installed = {
                    "stylua", -- Lua: formatter
                },
            })

            vim.filetype.add({
                extension = { shtml = "superhtml" },
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

                    -- Helper function to quickly attach descriptions
                    local function descmap(mode, lhs, rhs, desc)
                        vim.keymap.set(mode, lhs, rhs, vim.tbl_deep_extend("force", opts, { desc = desc }))
                    end
                    -- stylua: ignore start
                    descmap("n", "gd", function() Snacks.picker.lsp_definitions() end, "Go to Definition")
                    descmap("n", "gD", function() Snacks.picker.lsp_declarations() end, "Go to Declaration")
                    descmap("n", "gi", function() Snacks.picker.lsp_implementations() end, "Go to implementation")
                    descmap("n", "gy", function() Snacks.picker.lsp_type_definitions() end, "Go to Type Definition")
                    descmap("n", "gr", function() Snacks.picker.lsp_references() end, "References")
                    descmap("n", "<leader>ss", function() Snacks.picker.lsp_symbols() end, "LSP Symbols")
                    -- stylua: ignore end

                    -- No picker equivalent
                    descmap("n", "K", vim.lsp.buf.hover, "Hover Documentation")
                    descmap("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
                    descmap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code Action")
                    descmap("n", "<leader>e", vim.diagnostic.open_float, "Open Float Diagnostic") -- float for cursor line
                    descmap("n", "<leader>q", vim.diagnostic.setloclist, "Open List Diagnostic") -- all diagnostics → list
                    descmap("n", "]d", function()
                        vim.diagnostic.jump({ count = 1 })
                    end, "Diagnostic: Next")
                    descmap("n", "[d", function()
                        vim.diagnostic.jump({ count = -1 })
                    end, "Diagnostic: Previous")
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
                            -- displayTypeErrors = "force-on", deprecated and redundant
                        },
                    },
                },
            })

            vim.lsp.enable({
                "biome",
                "emmet_language_server",
                "html",
                "lua_ls",
                "pyrefly",
                "ruff",
                "rust_analyzer",
                "superhtml",
            })

            -- 4. How diagnostic *look* in the buffer.
            vim.diagnostic.config({
                virtual_lines = { current_line = true },
                virtual_text = false,
                float = {
                    border = "rounded",
                    source = true,
                    header = "",
                    format = function(diagnostic)
                        local code = diagnostic.code and string.format("[%s]", diagnostic.code) or ""
                        return string.format("%s %s", diagnostic.message, code)
                    end,
                },
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = "✘",
                        [vim.diagnostic.severity.WARN] = "",
                        [vim.diagnostic.severity.INFO] = "",
                        [vim.diagnostic.severity.HINT] = "",
                    },
                    numhl = {
                        [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
                        [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
                    },
                },
                underline = true,
                update_in_insert = false,
                severity_sort = true,
            })
        end,
    },
}
