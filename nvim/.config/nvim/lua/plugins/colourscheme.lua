local function set_float_highlights()
    -- A few shades lighter than bamboo's Normal bg (#252623), matching the
    -- shade bamboo itself uses for Pmenu/CursorLine so floats look like a
    -- deliberate "raised panel" rather than a random color.
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#2F312C", fg = "#F1E9D2" })
    -- Keep bamboo's own FloatBorder accent color, just give it a bg so the
    -- border doesn't blend into the editor background.
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#2F312C", fg = "#AAAAFF" })
    -- Keep FloatTitle's bg consistent to avoid visual clash
    vim.api.nvim_set_hl(0, "FloatTitle", { bg = "#2F312C", fg = "#AAAAFF" })
    -- Give blink.cmp's signature help window a visible border
    vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelpBorder", { link = "FloatBorder" })
end

return {
    'ribru17/bamboo.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        require('bamboo').setup {
            -- Disable italicization
            code_style = {
                comments = { italic = false },
                conditionals = { italic = false },
                keywords = { italic = false },
                functions = { italic = false },
                namespaces = { italic = false },
                parameters = { italic = false },
                strings = { italic = false },
                variables = { italic = false },
            },
        }
        require('bamboo').load()

        -- Re-apply after every colorscheme load (including :colorscheme
        -- reloads) so these overrides always survive and aren't clobbered.
        vim.api.nvim_create_autocmd("ColorScheme", {
            group = vim.api.nvim_create_augroup("FloatHighlights", { clear = true }),
            callback = set_float_highlights,
        })

        set_float_highlights()
    end,
}
