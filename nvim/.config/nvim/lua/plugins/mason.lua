return {
    { -- Install lspconfig
        "neovim/nvim-lspconfig",
        dependencies = {
            'saghen/blink.cmp',
        }
    },
    { -- Install Mason
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    { -- Mason-lspconfig maps the mason name to its respective lsp-config name for the language setup (eg. lspconfig.[language].setup())
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
        config = function()
            local capabilities = require("blink.cmp").get_lsp_capabilities()

            require("lspconfig").lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
            })

            -- Default handlers
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",       -- lua
                    "pyright",      -- python
                    "clangd",       -- C/C++
                    "ts_ls",        -- JS/TS
                    "html",         -- HTML
                    "cssls",        -- CSS
                    "jsonls",       -- JSON
                },

                handlers = {
                    -- Default Handler
                    function(server_name)
                        require("lspconfig")[server_name].setup({ capabilities = capabilities })
                    end,
                }
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
    }
}
