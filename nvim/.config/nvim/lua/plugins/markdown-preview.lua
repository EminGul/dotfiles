return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    init = function()
        vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
    keys = {
        -- Toggle markdown preview
        { "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", desc = "Toggle Markdown Preview" },
    },
}
