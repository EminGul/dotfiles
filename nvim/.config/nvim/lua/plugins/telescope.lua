return {
    "nvim-telescope/telescope.nvim",
    dependencies = { 
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
    },
    config = function()
        -- Telescope setup
        require("telescope").setup({
            defaults = {
                mappings = {
                    i = { -- Insert mode mappings
                        ["<C-h>"] = "which_key",
                        ["<C-j>"] = require('telescope.actions').move_selection_next,
                        ["<C-k>"] = require('telescope.actions').move_selection_previous,
                    }
                }
            },
            extensions = {
                file_browser = {
                    theme = "dropdown",
                    hijack_netrw = true, -- Use Telescope for file browsing instead of netrw
                }
            },
        })

        -- Keybindings for Telescope
        local builtin = require("telescope.builtin")
        vim.keymap.set('n', "<leader>ff", builtin.find_files, { noremap = true, silent = true, desc = "Find Files" })
        vim.keymap.set('n', "<leader>g", builtin.live_grep, { noremap = true, silent = true, desc = "Live Grep" })
        vim.keymap.set('n', "<space>fb", ":Telescope file_browser<CR>", { noremap = true, silent = true, desc = "Telescope File Browser" })   
    end,
}
