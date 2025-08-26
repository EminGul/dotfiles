return { -- See Josean Martinez's video on LSP setup
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer",           -- Source for text in buffer
        "hrsh7th/cmp-path",             -- Source for file system paths
        "L3MON4D3/LuaSnip",             -- Snippet engine
        "saadparwaiz1/cmp_luasnip",     -- Autocompletion
        "rafamadriz/friendly-snippets", -- Useful snippets
    },

    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")


        -- loads vscode style snippets from installed plugins
        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            completion = {
                completeopt = "menu,menuone,preview,noselect", -- :h completeopt
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-j>"] = cmp.mapping.select_next_item(),     -- next suggestion
                ["<C-k>"] = cmp.mapping.select_prev_item(),     -- previous suggestion
                ["<C-f>"] = cmp.mapping.scroll_docs(4), 
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-Space>"] = cmp.mapping.complete(),         -- Show completion suggestions
                ["<C-e>"] = cmp.mapping.abort(),                -- Close completion window
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
            }),
            -- sources for autocompletion (priority based on order)
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" }, -- snippets
                { name = "buffer" },  -- text within current buffer
                { name = "path" },    -- file system paths
            }),
        })
    end,
}
