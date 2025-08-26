return {
    { -- Install lspconfig
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
    },
    { -- Install Mason
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    { -- Install cmp-nvim-lsp 
        "hrsh7th/cmp-nvim-lsp",
        dependencies = { "nvim-cmp" },
    },
    { -- Mason-lspconfig maps the mason name to its respective lsp-config name for the language setup (eg. lspconfig.[language].setup())
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "mason.nvim", "cmp-nvim-lsp" },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            require("mason-lspconfig").setup()

            -- Add LSP configurations
            require("mason-lspconfig").setup_handlers({
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities,
                    })
                end,
            })
        end,
    }
}
