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
                    hijack_netrw = true,
                    mappings = {
                        n = {
                            ["<C-y>"] = function(prompt_bufnr)
                                local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
                                local dir = picker.finder.path
                                require("telescope.actions").close(prompt_bufnr)
                                vim.fn.chdir(dir)
                                vim.notify("cwd: " .. dir)
                            end,
                        },
                    },
                }
            },
        })

        -- Keybindings for Telescope
        local builtin = require("telescope.builtin")
        vim.keymap.set('n', "<leader>ff", builtin.find_files, { noremap = true, silent = true, desc = "Find files" })
        vim.keymap.set('n', "<leader>lg", builtin.live_grep,  { noremap = true, silent = true, desc = "Live grep" })
        vim.keymap.set('n', "<leader>bb", builtin.buffers,    { noremap = true, silent = true, desc = "List buffers" })
        vim.keymap.set('n', "<space>fb", ":Telescope file_browser<CR>", { noremap = true, silent = true, desc = "Telescope File Browser" })   
    end,
}
