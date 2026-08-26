return {
    { -- nvim-lspconfig still needed for the server configs
        "neovim/nvim-lspconfig",
        dependencies = {
            "saghen/blink.cmp",
        },
        config = function()
            -- Close the hover float if it's still open instead of reopening it
            local function toggle_hover()
                local bufnr = vim.api.nvim_get_current_buf()
                local winid = vim.b[bufnr].lsp_floating_preview
                if winid and vim.api.nvim_win_is_valid(winid) then
                    vim.api.nvim_win_close(winid, true)
                else
                    vim.lsp.buf.hover()
                end
            end

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(event)
                    local map = function(lhs, rhs, desc)
                        vim.keymap.set("n", lhs, rhs, { buffer = event.buf, desc = desc })
                    end
                    map("gd",          vim.lsp.buf.definition,    "Go to definition")
                    map("gD",          vim.lsp.buf.declaration,   "Go to declaration")
                    map("gi",          vim.lsp.buf.implementation,"Go to implementation")
                    map("gr",          vim.lsp.buf.references,    "Go to references")
                    map("K",           toggle_hover,              "Toggle hover documentation")
                    map("<leader>rn",  vim.lsp.buf.rename,        "Rename symbol")
                    map("<leader>ca",  vim.lsp.buf.code_action,   "Code action")
                    map("[d",          vim.diagnostic.goto_prev,  "Previous diagnostic")
                    map("]d",          vim.diagnostic.goto_next,  "Next diagnostic")
                end,
            })
        end,
    },

    { -- Mason
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },

    {
        -- Mason-lspconfig: installs + auto-enables servers
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
        config = function()
            local capabilities = require("blink.cmp").get_lsp_capabilities()

            local servers = {
                "lua_ls",   -- Lua (types provided by lazydev.nvim)
                "pyright",  -- Python
                "clangd",   -- C/C++
                "ts_ls",    -- JS/TS
                "html",     -- HTML
                "cssls",    -- CSS
                "jsonls",   -- JSON
            }

            for _, server in ipairs(servers) do
                vim.lsp.config(server, { capabilities = capabilities })
            end

            require("mason-lspconfig").setup({
                ensure_installed = servers,
            })
        end,
    },
}
