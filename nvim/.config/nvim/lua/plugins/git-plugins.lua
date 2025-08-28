return {
    {   -- Lazygit.nvim
        "kdheepak/lazygit.nvim",
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },

        dependencies = {
            "nvim-lua/plenary.nvim",
        },

        keys = {
            { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
        }
    },
    {   -- Gitsigns.nvim
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup({
                numhl = true,       -- Line number colour changes
                signcolumn = false, -- Remove sign column
            })
        end,
    }
}
