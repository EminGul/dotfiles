return {
    "sindrets/diffview.nvim",
    cmd = {
        "DiffviewOpen",
        "DiffviewClose",
        "DiffviewToggleFiles",
        "DiffviewFocusFiles",
        "DiffviewFileHistory",
    },
    config = function()
        require("diffview").setup()
        vim.opt.fillchars:append({ diff = " " })
    end,
    keys = {
        { "<leader>gd", "<cmd>DiffviewOpen<cr>",          desc = "Open diffview" },
        { "<leader>gD", "<cmd>DiffviewClose<cr>",         desc = "Close diffview" },
        { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File history (current file)" },
        { "<leader>gH", "<cmd>DiffviewFileHistory<cr>",   desc = "File history (repo)" },
    },
}
