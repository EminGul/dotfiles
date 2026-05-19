return {
    {   -- Neogit
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
        },
        cmd = { "Neogit" },
        keys = {
            { "<leader>gg", "<cmd>Neogit<cr>", desc = "Open Neogit" },
        },
        opts = {
            integrations = {
                diffview = true,
            },
        },
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
