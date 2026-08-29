-- Completion Plugin
return {
    "saghen/blink.cmp",
    version = "1.*", -- pin to a v1 release → downloads a prebuilt binary; avoids needing a Rust toolchain
    dependencies = {
        "rafamadriz/friendly-snippets", -- optional: ready-made snippets for many languages
    },
    opts = {
        keymap = { preset = "super-tab" },
        appearance = {
            nerd_font_variant = "mono",
        },
        completion = {
            menu = {
                border = "rounded", -- boxed menu instead of borderless
                draw = {
                    columns = {
                        { "kind_icon" },
                        { "label", "label_description", gap = 1 },
                        { "source_name" },
                    },
                },
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 150,
            },
            ghost_text = {
                enabled = true,
            },
        },
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },
        signature = { enabled = true },
        fuzzy = { implementation = "prefer_rust_with_warning" },
    },
}
