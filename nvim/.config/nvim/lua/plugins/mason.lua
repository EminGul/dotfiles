return {
    { -- nvim-lspconfig still needed for the server configs
        "neovim/nvim-lspconfig",
        dependencies = {
            "saghen/blink.cmp",
        },
    },

    { -- Mason
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },

    {
        -- Mason-lspconfig: installs + auto-enables servers
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
        config = function()
            local capabilities = require("blink.cmp").get_lsp_capabilities()

            -- list of servers you care about
            local servers = {
                "lua_ls",   -- Lua
                "pyright",  -- Python
                "clangd",   -- C/C++
                "ts_ls",    -- JS/TS
                "html",     -- HTML
                "cssls",    -- CSS
                "jsonls",   -- JSON
            }

            -- per-server config using the NEW API
            for _, server in ipairs(servers) do
                local cfg = {
                    capabilities = capabilities,
                }

                if server == "lua_ls" then
                    cfg.settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" },
                            },
                        },
                    }
                end

                -- define/extend the config
                vim.lsp.config(server, cfg)
            end

            -- let mason-lspconfig ensure they’re installed
            require("mason-lspconfig").setup({
                ensure_installed = servers,
                -- automatic_enable is true by default; you can make it explicit:
                -- automatic_enable = true,
            })
        end,
    },

    {
        "rachartier/tiny-inline-diagnostic.nvim",
        event = "LspAttach",
        config = function()
            require("tiny-inline-diagnostic").setup({
                preset = "classic",
            })
        end,
    },
}
