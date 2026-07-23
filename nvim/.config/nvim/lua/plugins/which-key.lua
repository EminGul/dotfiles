return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        local wk = require("which-key")
        wk.setup()

        wk.add({
            -- ----------------------------------------------------------------
            -- Groups
            -- ----------------------------------------------------------------
            { "<leader>b",  group = "buffers" },
            { "<leader>bb", desc = "List buffers" },
            { "<leader>l", group = "search" },
            { "<leader>c", group = "code" },
            { "<leader>f", group = "find" },
            { "<leader>g", group = "git" },
            { "<leader>m", group = "markdown" },
            { "<leader>r", group = "rename" },
            { "<leader>s", group = "selection" },
            { "<leader>t", group = "terminal" },
            { "<leader>w", group = "window" },

            -- ----------------------------------------------------------------
            -- Oil (oil.lua)
            -- ----------------------------------------------------------------
            { "<leader>o",  desc = "Open oil file browser" },
            { "<leader>cd", desc = "cd to current oil directory" },

            -- ----------------------------------------------------------------
            -- Diagnostics (vim-options.lua)
            -- ----------------------------------------------------------------
            { "<leader>d",  desc = "Open diagnostic float" },

            -- ----------------------------------------------------------------
            -- Search (vim-options.lua)
            -- ----------------------------------------------------------------
            { "<Esc>", desc = "Clear search highlight", mode = { "n" } },

            -- ----------------------------------------------------------------
            -- Find / Telescope (telescope.lua)
            -- NOTE: <leader>g is also mapped to live grep in telescope.lua.
            -- That mapping coexists with the git group via timeoutlen; which-key
            -- shows the git group popup and fires live grep on timeout.
            -- ----------------------------------------------------------------
            { "<leader>ff", desc = "Find files" },
            { "<leader>fb", desc = "File browser" },
            { "<leader>lg", desc = "Live grep" },

            -- ----------------------------------------------------------------
            -- Git (git-plugins.lua, diffview.lua)
            -- ----------------------------------------------------------------
            { "<leader>gg", desc = "Open Neogit" },
            { "<leader>gd", desc = "Open diffview" },
            { "<leader>gD", desc = "Close diffview" },
            { "<leader>gh", desc = "File history (current file)" },
            { "<leader>gH", desc = "File history (repo)" },

            -- ----------------------------------------------------------------
            -- Code / LSP (mason.lua LspAttach)
            -- ----------------------------------------------------------------
            { "<leader>ca", desc = "Code action" },
            { "<leader>rn", desc = "Rename symbol" },

            -- ----------------------------------------------------------------
            -- Terminal (toggleterm.lua)
            -- ----------------------------------------------------------------
            { "<c-\\>",     desc = "Toggle terminal", mode = { "n", "t" } },
            { "<leader>tf", desc = "Toggle terminal (float)" },
            { "<leader>th", desc = "Toggle terminal (horizontal)" },
            { "<leader>tv", desc = "Toggle terminal (vertical)" },

            -- ----------------------------------------------------------------
            -- Markdown (markdown-preview.lua)
            -- ----------------------------------------------------------------
            { "<leader>mp", desc = "Toggle markdown preview" },

            -- ----------------------------------------------------------------
            -- Selection / treesitter incremental (treesitter.lua)
            -- Keymaps are managed by treesitter config; descs live here only.
            -- ----------------------------------------------------------------
            { "<leader>ss", desc = "Start treesitter selection" },
            { "<leader>sc", desc = "Expand selection to scope" },
            { "<leader>si", desc = "Increment selection by node" },
            { "<leader>sd", desc = "Decrement selection by node" },

            -- ----------------------------------------------------------------
            -- LSP (buffer-local, set in LspAttach autocmd in mason.lua)
            -- ----------------------------------------------------------------
            { "gd", desc = "Go to definition" },
            { "gD", desc = "Go to declaration" },
            { "gi", desc = "Go to implementation" },
            { "gr", desc = "Go to references" },
            { "K",  desc = "Hover documentation" },
            { "[d", desc = "Previous diagnostic" },
            { "]d", desc = "Next diagnostic" },

            -- ----------------------------------------------------------------
            -- Ctrl binds (not in leader popup -- use :WhichKey to browse)
            -- ----------------------------------------------------------------
            { "<c-\\>", desc = "Toggle terminal",                        mode = { "n", "t" } },
            { "<c-y>",  desc = "cd to directory (telescope file browser)", mode = { "n" } },
            { "<c-o>",  desc = "Jump back (jumplist)",                   mode = { "n" } },
            { "<c-i>",  desc = "Jump forward (jumplist)",                mode = { "n" } },
            { "<c-s>",  desc = "Search and replace (whole file)",        mode = { "n" } },
        })
    end,
}
