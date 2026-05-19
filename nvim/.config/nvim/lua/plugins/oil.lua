return {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    lazy = false,
    config = function()
        require("oil").setup()
        vim.keymap.set("n", "<leader>o", "<cmd>Oil<cr>", { desc = "Open oil file browser" })

        vim.keymap.set("n", "<leader>cd", function()
            vim.fn.chdir(require("oil").get_current_dir())
            vim.notify("cwd: " .. require("oil").get_current_dir())
        end, { desc = "cd to oil directory" })

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "oil",
            callback = function(args)
                vim.wo.winbar = "  oil  |  Enter: open  |  -: up  |  C-c: close  |  <leader>cd: cd here  |  g?: help"
                vim.api.nvim_create_autocmd("BufLeave", {
                    buffer = args.buf,
                    callback = function()
                        vim.wo.winbar = ""
                    end,
                })
            end,
        })
    end,
}
