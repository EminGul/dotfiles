return {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
        size = function(term)
            if term.direction == "horizontal" then
                return 15
            elseif term.direction == "vertical" then
                return 60
            end
        end,
        open_mapping = [[<c-\>]],
        direction = "vertical",
        shade_terminals = true,
    },
    keys = {
        { [[<c-\>]],  desc = "Toggle terminal",          mode = { "n", "t" } },
        { "<c-h>",    [[<c-\><c-n><c-w>h]],              desc = "Move to left window",  mode = "t" },
        { "<c-j>",    [[<c-\><c-n><c-w>j]],              desc = "Move to below window", mode = "t" },
        { "<c-k>",    [[<c-\><c-n><c-w>k]],              desc = "Move to above window", mode = "t" },
        { "<c-l>",    [[<c-\><c-n><c-w>l]],              desc = "Move to right window", mode = "t" },
        { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>",      desc = "Toggle terminal (float)" },
        { "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Toggle terminal (horizontal)" },
        { "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>",   desc = "Toggle terminal (vertical)" },
        { "<Esc>",      [[<C-\><C-n>]],                             desc = "Exit terminal mode", mode = "t" },
    },
}
