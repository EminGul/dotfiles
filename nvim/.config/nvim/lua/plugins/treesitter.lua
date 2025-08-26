return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require("nvim-treesitter.configs").setup({
            -- Install parsers for the following: (Note: Do not change the first 5)
            ensure_installed = {
                "c", "lua", "vim", "vimdoc", "query",
                "javascript", "html", "css", "go", "cpp", "python", "java",
                "sql", "bash", "c_sharp", "make",
            },

            auto_install = true,

            highlight = {
                enable = true,
            },

            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<Leader>ss",      -- Start selection
                    scope_incremental = "<Leader>sc",   -- Selection scope
                    node_incremental = "<Leader>si",    -- Selection increment
                    node_decremental = "<Leader>sd",    -- Selection decrement
                },
            },

            textobjects = {
                select = {
                    enable = true,
                    
                    -- Automatically jump forward to textobj, similar to targets.vim
                    lookahead = true,

                    keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                        -- You can also use captures from other query groups like `locals.scm`
                        ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
                    },

                    selection_modes = {
                        ['@parameter.outer'] = 'v', -- charwise
                        ['@function.outer'] = 'v', 
                        ['@class.outer'] = '<c-v>', -- blockwise
                    },
                    
                    -- If you set this to `true` (default is `false`) then any textobject is
                    -- extended to include preceding or succeeding whitespace. Succeeding
                    -- whitespace has priority in order to act similarly to eg the built-in
                    -- `ap`.
                    include_surrounding_whitespace = true,
                },
            },
        })    
    end,
}
